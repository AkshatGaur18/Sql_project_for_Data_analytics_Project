/*
Question: What are the top paying data scientist jobs?
- Identity the top 10 Highest-paying Data scienctsit roles available Remotely.
- Focuses on job postings with specified salaries (Remove nulls).
- Why? Highlight the top-paying opportunited for Data Scienctist, offering insights into employement oppertunites
*/



SELECT 
    job_id,
    job_title,
    company_dim.name as company_Name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_work_from_home = TRUE AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
