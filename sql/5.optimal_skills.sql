-- 5. what are the most optimal skills to learn?

WITH top_demand AS (
    SELECT
        skills.skills AS top_skill,
        COUNT(skills.skills) AS count_of_skill
    FROM
        skills_dim AS skills
    INNER JOIN skills_job_dim AS sjd ON sjd.skill_id = skills.skill_id
    INNER JOIN job_postings_fact ON sjd.job_id = job_postings_fact.job_id
    WHERE
        job_title_short LIKE '%Data Analyst%'
    GROUP BY
        top_skill 
    ORDER BY
        count_of_skill DESC
    -- LIMIT 5;
), top_paying AS (
    SELECT
        skills.skills AS top_skill,
        ROUND(AVG(job.salary_year_avg), 0) AS average_salary
    FROM
        skills_dim AS skills
    INNER JOIN skills_job_dim AS sjd ON sjd.skill_id = skills.skill_id
    INNER JOIN job_postings_fact AS job ON sjd.job_id = job.job_id
    WHERE
        job.job_title_short LIKE '%Data Analyst%' AND
        job.salary_year_avg IS NOT NULL
    GROUP BY
        top_skill
    ORDER BY
        average_salary DESC
    -- LIMIT 100;
)

SELECT
    top_demand.top_skill,
    count_of_skill,
    average_salary
FROM
    top_demand
INNER JOIN top_paying ON top_paying.top_skill = top_demand.top_skill
WHERE
    count_of_skill>10
LIMIT 100;



-- By using the help of AI, im trying to use normalization so we can see the best skill to learn while considering the two metrics.

WITH skill_stats AS (
    SELECT
        skills.skills AS skill_name,
        COUNT(skills.skills) AS job_count,
        ROUND(AVG(job.salary_year_avg), 0) AS avg_salary
    FROM 
        skills_dim AS skills
    INNER JOIN skills_job_dim AS sjd ON skills.skill_id = sjd.skill_id
    INNER JOIN job_postings_fact AS job ON sjd.job_id = job.job_id
    WHERE 
        job.job_title_short LIKE '%Data Analyst%' AND 
        job.salary_year_avg IS NOT NULL
    GROUP BY 
        skill_name
    HAVING 
        COUNT(skills.skills) > 10
),
min_max AS (
    SELECT 
        MIN(job_count) as min_d, MAX(job_count) as max_d,
        MIN(avg_salary) as min_s, MAX(avg_salary) as max_s
    FROM 
        skill_stats
)
SELECT 
    s.skill_name,
    s.job_count,
    s.avg_salary,
    ROUND(
        CAST(
            ((s.job_count - m.min_d) * 1.0 / (m.max_d - m.min_d)) * 0.5 + 
            ((s.avg_salary - m.min_s) * 1.0 / (m.max_s - m.min_s)) * 0.5 
        AS NUMERIC) -- can edit this formula to prioritize the salary or the job count
    , 4) AS normalization_score
FROM 
    skill_stats AS s
CROSS JOIN 
    min_max AS m
ORDER BY 
    normalization_score DESC
LIMIT 10;