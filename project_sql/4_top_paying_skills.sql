/* 

Task #4: 
What are the top skills based on salaries?
Personal Task: Filter for Israeli jobs

*/

SELECT 
    skills,
    round(avg(salary_year_avg), 2) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE   
    job_title_short = 'Data Analyst' AND
    job_location like '%Israel%' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY    
    avg_salary desc
LIMIT 25;