-- 3. what skills are most in-demand for data?

SELECT
    skills.skills AS top_skill,
    COUNT(skills.skills) AS count_of_skill
FROM
    skills_dim AS skills
INNER JOIN skills_job_dim AS sjd ON sjd.skill_id = skills.skill_id
INNER JOIN job_postings_fact ON sjd.job_id = job_postings_fact.job_id
WHERE
    job_title_short LIKE 'Data Analyst'
GROUP BY
    top_skill 
ORDER BY
    count_of_skill DESC
LIMIT 5;