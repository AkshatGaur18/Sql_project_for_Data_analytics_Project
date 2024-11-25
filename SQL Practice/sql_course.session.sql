CREATE TABLE job_applied (
    job_id int,
    application_sent_date DATE,
    custom_resume boolean,
    resume_file_name varchar(225),
    cover_letter_sent boolean,
    cover_letter_file_name varchar(255),
    status varchar(50)
);

SELECT * from job_applied;

INSERT into job_applied VALUES 
(1,'2024-02-01',true,'resume_01.pdf',true,'cover_letter_01.pdf','submitted'),
(2,'2024-02-02',true,'resume_02.pdf',false,'cover_letter_02.pdf','not submitted'),
(3,'2024-02-03',false,'resume_03.pdf',false,'cover_letter_03.pdf','ghosted'),
(4,'2024-02-03',true,'resume_04.pdf',true,'cover_letter_04.pdf','not Submitted'),
(5,'2024-02-03',false,'resume_05.pdf',false,'cover_letter_05.pdf','rejected');
