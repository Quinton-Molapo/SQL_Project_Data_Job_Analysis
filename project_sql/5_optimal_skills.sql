<<<<<<< HEAD
/*
answer: What are most optimal skills to learn (aka it's in high demand and high paying skill)
-Identify skills in high demand and associated with high average salaries for Data Analyst roles
-concentrates on remote positions with specified salaries 
-why? targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
    */

WITH skills_demand AS (   
    SELECT 
            skills_dim.skill_id,
            skills_dim.skills,
            count(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
    
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_job_dim.skill_id
)
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC   
    LIMIT 25
    
    --rewriting this query more concisely

SELECT 
            skills_dim.skill_id,
            skills_dim.skills,
            count(skills_job_dim.job_id) AS demand_count,
            ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
        skills_dim.skill_id
HAVING 
    count(skills_job_dim.job_id) >10
ORDER BY
    avg_salary DESC,
    demand_count DESC   
    LIMIT 25
=======
/*
answer: What are most optimal skills to learn (aka it's in high demand and high paying skill)
-Identify skills in high demand and associated with high average salaries for Data Analyst roles
-concentrates on remote positions with specified salaries 
-why? targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
    */

WITH skills_demand AS (   
    SELECT 
            skills_dim.skill_id,
            skills_dim.skills,
            count(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
    
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_job_dim.skill_id
)
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC   
    LIMIT 25
    
    --rewriting this query more concisely

SELECT 
            skills_dim.skill_id,
            skills_dim.skills,
            count(skills_job_dim.job_id) AS demand_count,
            ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
        skills_dim.skill_id
HAVING 
    count(skills_job_dim.job_id) >10
ORDER BY
    avg_salary DESC,
    demand_count DESC   
    LIMIT 25
>>>>>>> 95e1e2afbe18ce027a86adb2b0a7904caa74e75d
