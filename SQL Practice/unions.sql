SELECT 
    job_title_short,
    company_id,
    job_location
from jan_jobs

UNION all

SELECT
    job_title_short,
    company_id,
    job_location
FROM fab_jobs

UNION all

SELECT
    job_title_short,
    company_id,
    job_location
FROM mar_jobs
