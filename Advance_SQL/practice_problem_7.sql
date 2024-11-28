SELECT 
    quarter_1.job_title_short,
    quarter_1.job_location,
    quarter_1.job_via,
    quarter_1.job_posted_date::DATE,
    quarter_1.salary_year_avg

     from

(   SELECT * 
    from jan_jobs
    UNION ALL
    SELECT * 
    from fab_jobs
    UNION ALL
    SELECT * 
    from mar_jobs
)
    as quarter_1
WHERE
    quarter_1.salary_year_avg > 70000 AND
    quarter_1.job_title_short = 'Data Analyst'
ORDER BY
    quarter_1.salary_year_avg DESC

