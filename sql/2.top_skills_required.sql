-- 2. what skills are required for these top-paying jobs?

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE
        job_title_short LIKE '%Data Analyst%' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 100
)

SELECT
    COUNT(skills.skills) AS count_of_skill,
    skills.skills AS top_skill
FROM
    skills_dim AS skills
INNER JOIN skills_job_dim AS sjd ON sjd.skill_id = skills.skill_id
INNER JOIN top_paying_jobs ON sjd.job_id = top_paying_jobs.job_id
GROUP BY
    top_skill 
ORDER BY
    count_of_skill DESC
LIMIT 10;

    
