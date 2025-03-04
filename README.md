# Introdution
### This project provides data-driven insights into the data analyst job market. 📊 analyzing trends 📈 to identify the skills that correlate with top compensation. 💰 my findings offer a clear understanding 💡 of the expertise needed for career advancement. 🚀

🔍Here are SQL Queries to check out: [project_sql folder](/project_sql/)

---
# Background
### Motivated by the need to navigate the data analyst job market more efficiently, this project was created to identify high-paying, in-demand skills and help others streamline their job search for the best opportunities.the data is from https://lukebarousse.com.
### The quest to finding data-driven insights into the data analyst job market was through writting queries that provide answers to this questions:


#### 1. What are the top-paying data analyst jobs? 💼💰

#### 2. What skills are required for these top-paying jobs? 🛠️📊

#### 3. What skills are most in demand for data analysts? 📈🔍

#### 4. Which skills are associated with high salaries? 💵💡

#### 5. What are the most optimal skills to learn? 📚🚀
---
# Tools I used

- **SQL:** used to query the database and extract insights to answer key questions. 📝  
- **PostgreSQL:** my preferred database management system for this project. 🐘  
- **Visual Studio Code:** the tool I use to execute SQL queries. 💻  
- **Git & GitHub:** for sharing SQL scripts and analyses. 🔄🚀
---

# The Analysis
The following queries are designed to answer each of the five questions outlined in the background section. 📊❓ Below each query, you'll find a visualization of the results, followed by the insights. 👀💡 Here is the approach. 🚀

### 1. top paying data analyst jobs
To identify the highiest paying roles, I filtered data analyst position by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
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
```

![output1](https://github.com/user-attachments/assets/6a915986-56de-49e5-883c-5cb1d1dcca8c)

*Bar graph visualizing salaries of the top 10 highiest paying data analyst roles. this graph was generated by ChatGPT using results of my sql above.*
### 📈 Key Insights from the above bar graph:

**Wide Salary Range:** The bar graph clearly demonstrates a substantial salary range within data analyst-related roles, from $184,000 to $650,000. 💰📊 This suggests that various factors, such as experience, job title, company size, and specific skills, significantly influence compensation. 📈💼  

**Job Title Variation:** The bar graph showcases the diversity of job titles within the field, including "Data Analyst," "Director of Analytics," "Principal Data Analyst," and more specialized roles like "ERM Data Analyst" and "AV Performance Analysis." 🔍📋 This highlights the many career paths available. 🚀👨‍💻

---
### 2.skills for top paying jobs
The following query picks out the skills that are required for top paying Data analyst jobs. I left joined job_postings_fact table and company_dim table to accoplish this.

```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        name AS company_name,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short ='Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
) 
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
LIMIT 10
```
*Bar![output-2](https://github.com/user-attachments/assets/924daec6-e56b-495c-b2f7-c5ec2e36c47d)
 graph visualizing skills for top 10 paying data analyst roles. this graph was generated by ChatGPT using results of my sql above.*

- **SQL** is the most in-demand skill – Essential for data extraction and manipulation. 📝💾
- **Python** ranks second – Used for data analysis, automation, and machine learning. 🐍📊
- **Tableau** is highly valued – Indicates the importance of data visualization. 📊🎨
- **R** is significant – Shows demand for statistical analysis skills. 📉📈
- Cloud & Big Data skills are growing – **Snowflak**e and **Azure** highlight this trend. ☁️🔵
- **Excel** remains relevant – Still widely used in data workflows. 📊🖥️
### 3. In-demand skills for data analyst
the query below retrieves the top 5 skills with the highiest demand in the job market,providing insights into the most valuable skills for job seekers.I performed an inner join on three tables—**skills_job_dim, job_postings_fact,** and **skills_dim**—applying a **WHERE** clause to filter for `job_title_short = 'Data Analyst'` and `job_work_from_home = TRUE`.
 */
```sql
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
LIMIT 5
```

  ### 📊Comparison of In-Demand Data Analyst Skills 

| 🏆 **Skill**  | 🔢 **Demand Count** | 📌 **Key Insight** |
|--------------|----------------|----------------|
| **SQL** 🔹 | **7,291** | 💾 Most in-demand, crucial for database querying. |
| **Excel** 📊 | **4,611** | 📈 Still widely used for analysis & reporting. |
| **Python** 🐍 | **4,330** | 🤖 Essential for automation, analytics, and ML. |
| **Tableau** 📉 | **3,745** | 🎨 High demand for data visualization skills. |
| **Power BI** ⚡ | **2,609** | 📊 Important for business intelligence & dashboards. |

 ### 🧐 Key Takeaways

- **SQL is the clear leader** 🚀—a must-have for data analysts.  
- **Excel & Python are neck and neck** 🏁—both vital for different aspects of data analysis.  
- **Tableau vs. Power BI** 🔥—Tableau is slightly more in demand, but both are crucial for BI roles.  
- **BI & visualization skills are growing** 📊—suggesting increasing reliance on data-driven decision-making.  
---
### 4.Skills associated with high salary
the query below retrives average salary associated with each skill for data analyst positions.I performed an inner join on three tables,**skills_job_dim, job_postings_fact,** and **skills_dim**,applying a **WHERE** clause to filter for `job_title_short = 'Data Analyst'` and `job_work_from_home = TRUE` and salary_year_avg IS NOT NULL
```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 10
```
![output3](https://github.com/user-attachments/assets/1e3d1138-3643-4bc2-97fe-f34fc6d5676a)

*the graph was generated by Chatgpt using the results of the query above.*
### here are the insights drawn from the above bar graph:

🔹 Top-Paying Skill: **PySpark** 🏆 leads with the highest salary ($208K).

🔹 **Bitbucket** 💰 follows closely with $189K.

🔹 **Watson** & **Couchbase** 🖥️ both offer competitive salaries ($160K).

🔹 **Elasticsearch** 📊 ranks lowest among the top skills ($145K).

🔹 ***Trend***: Big data, cloud, and AI-related skills dominate high salaries 🚀.

---

### 5.High paying skill by demand
the following query retrives high demand skills that have high salaries. i created two common table expressions then inner joining them to retrive skills_demand.skills,demand_count and avg_salary.
```sql
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
    LIMIT 10
```   


### The table below showcases the demand and average salaries for various data analytics-related skills:  

| Skill       | Demand Count | Average Salary ($) |
|------------|--------------|--------------------|
| Snowflake  | 37           | 112,948            |
| Azure      | 34           | 111,225            |
| AWS        | 32           | 108,317            |
| Go         | 27           | 115,320            |
| Hadoop     | 22           | 113,193            |
| Jira       | 20           | 104,918            |
| Java       | 17           | 106,906            |
| BigQuery   | 13           | 109,654            |
| SSIS       | 12           | 106,683            |
| Confluence | 11           | 114,210            |

### 📈 Key Insights from the table above: 

- **SQL & Cloud Skills Dominate** – Cloud-based skills like **Snowflake, Azure, and AWS** are in high demand, making them essential for data professionals.  

- **Top-Paying Skills 💰** – **Go ($115,320)** and **Confluence ($114,210)** offer some of the highest average salaries, suggesting strong compensation for these niche skills.  

- **High Demand = Job Security ✅** – **Snowflake (37), Azure (34), and AWS (32)** have the highest demand, indicating strong job opportunities in cloud data management.  

- **Specialized Skills Pay Off 🚀** – **Hadoop ($113,193)** and **BigQuery ($109,654)** show that expertise in big data technologies can significantly boost earning potential.  

- **Balancing Demand & Salary 🤔** – While some skills offer higher salaries, demand plays a crucial role in job availability. Choosing a mix of high-demand and high-paying skills can provide the best career opportunities.  
---

# What i learned.
### 🔥 Just leveled up my SQL Data Analytics skills! this is what i learned:
1️⃣ CTEs (Common Table Expressions) – No more messy queries! WITH statements make code cleaner, more readable, and reusable.

2️⃣ Aggregation Magic 📊 – SUM(), AVG(), and COUNT() make it easy to crunch numbers and summarize massive datasets in seconds.

3️⃣ Filtering Like a Pro 🔍 – WHERE and HAVING help pull exactly the right data, making queries precise and efficient.

4️⃣ CASE Statements = SQL Superpower 🤯 – Conditional logic inside queries allows for dynamic categorization and calculated fields on the fly.

---
# Conclutions

### Insights

1. Top-Paying Data Analyst Jobs: The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!

2. Skills for Top-Paying Jobs: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.

3. Most In-Demand Skills: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.

4. Skills with Higher Salaries: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.

5. Optimal Skills for Job Market Value: SQL leads in demand and offers a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.



### closing thoughts
This project strengthened my **SQL** skills 🛠️💾 and offered valuable insights into the **data analyst job market** 📊💼. The analysis results serve as a roadmap 🗺️ for prioritizing **skill development** 📚 and optimizing **job search strategies** 🔍🚀. Aspiring data analysts can gain a **competitive edge** 🏆 by focusing on **high-demand, high-paying skills** 💰📈. This exploration emphasizes the importance of **continuous learning** 📖✨ and adapting to evolving **trends in data analytics** 🔄📊.
