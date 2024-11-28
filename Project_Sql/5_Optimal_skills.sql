/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high paying skills?)
- Identify skills in high demands and associated with high average salaries for Data Scientisr roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (High demand) and financial benefits (high salaries),
    offering starategic insights for carrer development in Data Science.
*/

WITH skills_demands AS
(
    SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count
        
FROM job_postings_fact 
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where job_title_short = 'Data Scientist' AND
    job_work_from_home = true
    AND 
    salary_year_avg IS NOT NULL
GROUP BY
   skills_dim.skill_id

)

,average_salary as 
(
     SELECT 
    skills_dim.skill_id,
    count(skills_job_dim.job_id) as demand_count,
    round(avg(salary_year_avg ),2) as average_salaries
        
FROM job_postings_fact 
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where 
    job_title_short = 'Data Scientist' 
AND 
    salary_year_avg IS NOT NULL
AND
    job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id

)

SELECT skills_demands.skill_id,
skills_demands.skills,
average_salary.demand_count,
average_salaries
FROM
skills_demands
INNER join average_salary on skills_demands.skill_id = average_salary.skill_id
WHERE average_salary.demand_count>10
ORDER BY
 average_salaries desc,
    demand_count desc
limit 25


SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand,
    round (avg(job_postings_fact.salary_year_avg),2) as average_salaries
FROM job_postings_fact
INNER join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER Join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where
  job_title_short = 'Data Scientist' 
    and salary_year_avg is not null
    and job_work_from_home = True

GROUP by skills_dim.skill_id
having   count(skills_job_dim.job_id)>10
ORDER BY
    average_salaries desc,
    demand desc
limit 25