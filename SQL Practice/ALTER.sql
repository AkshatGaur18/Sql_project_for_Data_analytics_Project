ALTER TABLE job_applied
add contact varchar (50)

ALTER TABLE job_applied
rename column contact to contact_name

SELECT * from job_applied;