/*
Answer: What are the top skills based on salary?
- look at the average salary associated with each skill for Data scientist positions
- focuses on roles with specified salaries, regardless of location
- Why? It reveales how different skills impact salaries level for Data Scientist and
    helps identify the most financially rewarding skills to acquire or improve
    */

 SELECT 
    skills,
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
    skills
ORDER BY
    average_salaries DESC
limit 25


/*
### Key Trends in Top-Paying Data Science Skills

1. **Specialized and Niche Skills Drive Salaries**  
   - GDPR compliance, blockchain development (Solidity), 
   and graph databases (Neo4j) highlight demand for domain-specific 
   expertise.  

2. **Programming Languages and Emerging Technologies**  
   - High-paying languages like Go, Rust, and traditional C reflect 
   the need for scalable, performance-critical 
   systems. Tools like OpenCV and AutoML frameworks 
   (DataRobot, Watson) underline the rise of advanced analytics.

3. **Data-Driven Decision-Making and Cloud Solutions**  
   - BI tools (Qlik, Looker, MicroStrategy) and cloud/database 
   technologies (DynamoDB, Cassandra) demonstrate the ongoing
    emphasis on visualization, scalable storage, and ETL workflows.  
*/