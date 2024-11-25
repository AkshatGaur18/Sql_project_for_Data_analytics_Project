SELECT '2023-02-19' :: DATE,
        '123':: Int,
        'true'::BOOLEAN,
        '3.14'::REAL;

select job_title_short as title,
job_location as location,
job_posted_date :: DATE as DATE
from
job_postings_fact

select job_title_short as title,
job_location as location,
job_posted_date  AT Time zone 'UTC' at time zone 'IST' as date_time
from
job_postings_fact
LIMIT 5

select extract (month from job_posted_date) as month,
extract (year from job_posted_date) as year
from job_postings_fact limit 5


select count(job_id),
        extract(month from job_posted_date) as month
        from
        job_postings_fact
        where job_title_short = 'Data Analyst'
        group by month
        order by month 

create table mar_jobs as
select * 
from
        job_postings_fact
where 
        extract (month from job_posted_date) = 3

drop table mar_jobs