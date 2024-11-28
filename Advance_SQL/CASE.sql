SELECT 
    count(job_id) as number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote' 
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END as location
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    location