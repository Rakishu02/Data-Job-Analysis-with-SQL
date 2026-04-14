-- 4. which skills are associated with higher salaries?

SELECT
    skills.skills AS top_skill,
    ROUND(AVG(job.salary_year_avg), 0) AS average_salary
FROM
    skills_dim AS skills
INNER JOIN skills_job_dim AS sjd ON sjd.skill_id = skills.skill_id
INNER JOIN job_postings_fact AS job ON sjd.job_id = job.job_id
WHERE
    job.job_title_short = 'Data Analyst' AND
    job.salary_year_avg IS NOT NULL
GROUP BY
    top_skill
ORDER BY
    average_salary DESC
LIMIT 10;