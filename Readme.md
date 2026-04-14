# Data Job Analysis

## Overview

This project explores the **Data Analyst job market**.  
I focused on **salary trends**, **top-paying roles**, and the **skills companies ask for most**.

The goal was simple: find the skills that help you **get hired** and **earn more**.

The dataset came from a SQL course. I used the course structure as a base, but I built the more advanced queries myself, especially for ranking and skill analysis.

---

## Key Findings

- **SQL** is the most in-demand skill overall.
- **Python** and **Tableau** appear often in top-paying roles.
- The highest salaries are usually tied to **senior positions**, not entry-level jobs.
- Some niche skills pay a lot, but they have very few job openings.
- The best mix of **demand** and **salary** is: **SQL, Python, and Tableau**.

---

## Questions This Project Answers

1. What are the top-paying analyst jobs?
2. What skills are required for those jobs?
3. What skills are most in demand?
4. Which skills are linked to higher salaries?
5. Which skills offer the best balance of demand and salary?

**Tools used:** PostgreSQL, VS Code

---

## 1. Top Paying Analyst Jobs

![Top paying role](assets/photo_1.png)

Some roles reach very high salaries, even up to **$650,000**. A large number of the top roles also sit around **$375,000**.

The main takeaway is clear: these are **not entry-level jobs**.

Most of them are senior roles like **Director**, **Principal**, or **SVP**. That means salary is driven more by **experience**, **leadership**, and **business impact** than by basic technical work alone.

---

## 2. Skills Required for Top Paying Jobs

| count_of_skill | top_skill |
|---:|---|
| 58 | python |
| 52 | sql |
| 34 | tableau |
| 32 | r |
| 18 | sas |
| 15 | excel |
| 10 | power bi |
| 10 | spark |
| 9 | aws |
| 8 | snowflake |

For top-paying roles, **Python** and **SQL** are the most important skills.

**Python** appears slightly more often, which shows how valuable it is at higher levels.  
**Tableau** also shows up more often than **Power BI** in these roles.

Some jobs also ask for tools like **AWS**, **Spark**, and **Snowflake**. That suggests higher-level analysts are often expected to understand more than just analysis. They also need to understand **data systems**.

---

## 3. Most In-Demand Skills

| top_skill | count_of_skill |
|---|---:|
| sql | 92628 |
| excel | 67031 |
| python | 57326 |
| tableau | 46554 |
| power bi | 39468 |

Across the full job market, **SQL** is the most requested skill.

**Excel** is also very common, even more than **Python**.

This shows a clear pattern:

**Excel** helps you get started.  
**SQL** is needed in most roles.  
**Python** helps you move toward higher-paying work.

---

## 4. Skills Linked to Higher Salaries

| top_skill | average_salary |
|---|---:|
| svn | 400000 |
| solidity | 179000 |
| couchbase | 160515 |
| datarobot | 155486 |
| golang | 155000 |
| mxnet | 149000 |
| dplyr | 147633 |
| vmware | 147500 |
| terraform | 146734 |
| twilio | 138500 |

The highest salaries are often tied to **niche skills**.

Examples like **SVN** and **Solidity** stand out, but there is a catch. These skills have **very few job openings**.

So yes, they pay well. But they are also **riskier** to focus on.

---

## 5. Best Skills to Learn

| skill_name | job_count | avg_salary | normalization_score |
|---|---:|---:|---:|
| sql | 3892 | 100299 | 0.7292 |
| python | 2304 | 105115 | 0.5634 |
| tableau | 2155 | 101543 | 0.5154 |
| perl | 26 | 133929 | 0.5019 |
| kafka | 54 | 128983 | 0.4657 |
| excel | 2467 | 88924 | 0.4540 |
| pytorch | 26 | 124956 | 0.4297 |
| r | 1337 | 102371 | 0.4167 |
| airflow | 100 | 121658 | 0.4127 |
| tensorflow | 31 | 122242 | 0.4085 |

To balance demand and salary, I used **min-max normalization**.

The top three skills are:

**SQL**  
**Python**  
**Tableau**

These give the best mix of **job opportunities** and **salary potential**.

Other tools may pay more, but they are much harder to find in the market.

---

## What I Learned

This project helped me understand both **SQL** and the **job market** better.

- I built complex SQL queries using **CTEs** and **JOINs**
- I created a normalization system to compare skills
- I learned how useful to apply **statistics** in data.

**Main takeaway:**  
**SQL** is the foundation, **Python** adds value, and **Tableau** helps turn analysis into something useful for business.

---

## Conclusion

If your goal is to get a job and grow your salary, do not chase rare skills too early.

Start with:

- **SQL**
- **Python**
- **Tableau**

**Excel** is useful at the beginning, but it will not take you very far on its own.

This combination gives you the best chance to grow both your **career** and your **income**.