# 🌍 World Life Expectancy - Data Cleaning and Exploratory Analysis with MySQL

## 📌 Overview
This project is part of my **Data Analyst** learning journey and focuses on **Data Cleaning** and **Exploratory Analysis** using **MySQL**. The dataset contains information on **life expectancy, country status (developing/developed), GDP, and other health-related factors** for different countries and years.

The **Data Cleaning** step follows a structured approach to fix common data quality issues, such as:
- **Handling duplicate records**
- **Filling missing values**
- **Ensuring data consistency**

📜 **SQL Queries:** All queries used in cleaning step are available in [`data_cleaning.sql`](data_cleaning.sql).

This project is inspired by the **Analyst Builder** course by [Alex Freberg](https://www.analystbuilder.com).

---

## 📊 Dataset
The dataset used in this project: **World Life Expectancy**  
📁 **File:** `WorldLifeExpectancy.csv`  
📌 **Source:** Kaggle / Open Data Repository  

---

## 🛠️ Data Cleaning Process
The data cleaning process involved several key steps to ensure data quality:
- **Handling duplicate records** using `ROW_NUMBER()`
- **Filling missing values** with self-joins and statistical imputations
- **Ensuring data consistency** by verifying country classifications (Developing vs. Developed)

📜 **Check all queries used in this step** in [`data_cleaning.sql`](data_cleaning.sql).

💡 **Key Learnings:**
✅ Using SQL window functions (`ROW_NUMBER()`) to detect duplicates  
✅ Cleaning missing data with **self-joins** and `UPDATE` queries  
✅ Applying **statistical imputations** to estimate missing values  
✅ Structuring SQL queries for **better performance and readability**  

---

## 📈 Next Steps: Exploratory Data Analysis (EDA)
Now that the data is clean and structured, the next step is **exploratory analysis**, where I will:
- Identify trends in **Life Expectancy** over time  
- Compare **Developed vs. Developing** countries  
- Find correlations with **GDP, healthcare, and education**  

🔄 *This section will be updated in the next few days!*

---

## 🏆 About Me
👩‍💻 I'm currently preparing for a **Data Analyst** role. This project is part of my **portfolio**, and I am actively learning **SQL, Power BI, and Data Warehouse**.

🔗 **Connect with me on [LinkedIn](www.linkedin.com/in/zellyirigon)** 🚀


