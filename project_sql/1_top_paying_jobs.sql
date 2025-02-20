<<<<<<< HEAD
/*
Question: what are the top-paying data analyst jobs?
-identify the top 10 highest-paying data analyst roles that are available remotely.
-focuses on job postings with specified salaries (remove nulls)
-why? highlight the top-paying opportunities for data analysts,offering insights into 
*/

SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short ='Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10


=======
/*
Question: what are the top-paying data analyst jobs?
-identify the top 10 highest-paying data analyst roles that are available remotely.
-focuses on job postings with specified salaries (remove nulls)
-why? highlight the top-paying opportunities for data analysts,offering insights into 
*/

SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short ='Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
>>>>>>> 95e1e2afbe18ce027a86adb2b0a7904caa74e75d
