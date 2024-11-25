SELECT *
FROM(
    SELECT * FROM job_postings_fact
    WHERE EXTRACT (month from job_posted_date) = 1)

with jan_data as (
    select * from job_postings_fact
    where EXTRACT (month from job_posted_date) = 1
)

select * from jan_data


select name as company_Name
from company_dim
where company_id in(

select company_id
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = true)





with degree_Data as 
(
    select company_id,
    count(*) as count
FROM
    job_postings_fact
GROUP BY
    company_id
order by company_id
)

select company_dim.name as Company_name,count from company_dim 
left join degree_Data on company_dim.company_id = 
degree_Data.company_id 
ORDER BY count desc

select * from skills_dim where skill_id in
(
select skill_id from skills_job_dim 
GROUP BY skill_id 
order by count(skill_id) desc
limit 5
)

with topskills as 
(
   select skill_id,count(skill_id) as count from skills_job_dim 
GROUP BY skill_id 
order by count(skill_id) desc
limit 5
)

select 
    topskills.skill_id,
    topskills.count,
    skills_dim.skills
from 
    topskills 
left join
     skills_dim 
on
     skills_dim.skill_id = topskills.skill_id







 