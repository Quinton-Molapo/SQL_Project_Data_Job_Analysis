<<<<<<< HEAD
/*
Question: What are the most in-demand skills for data analysts?
-join job postings to inner join table similar to query 2
-identify the top 5 in_demand skills for a data analyst.
-focus on all job postings.
-why? retrieves the top 5 skills with the highiest demand in the job market,
    providing insights into the most valuable skills for job seekers.
 */

SELECT 
        skills,
        count(skills_job_dim.skill_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
=======
/*
Question: What are the most in-demand skills for data analysts?
-join job postings to inner join table similar to query 2
-identify the top 5 in_demand   skills for a data analyst.
-focus on all job postings.
-why? retrieves the top 5 skills with the highiest demand in the job market,
    providing insights into the most valuable skills for job seekers.
 */

SELECT 
        skills,
        count(skills_job_dim.skill_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
>>>>>>> 95e1e2afbe18ce027a86adb2b0a7904caa74e75d
LIMIT 5