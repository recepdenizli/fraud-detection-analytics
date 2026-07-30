<p align="center">
  <img src="https://github.com/user-attachments/assets/6e6cd164-1503-4a4f-bb05-cb5ff7532f61" width="900" alt="Fraud Detection Dashboard">
</p>
# Fraud Detection Analytics Pipeline

## Overview

This project was developed as part of the **GOIT Data Analytics Hackathon (Finance & Banking Track)**.

The objective was to analyze banking transactions, identify fraud patterns, build predictive machine learning models, and create an interactive business dashboard for risk analysts.

The project combines SQL, Python, Tableau, and Google Sheets into a complete analytics workflow, covering data preparation, exploratory analysis, statistical anomaly detection, supervised machine learning, and business intelligence.

---

## Dataset

The dataset contains three related tables:

* **Transactions** (8,000 banking transactions)
* **Customers** (500 customer profiles)
* **Fraud Labels** (497 confirmed fraudulent transactions)

Key attributes include:

* Transaction amount
* Merchant category
* Timestamp
* Customer income
* Customer segment
* Fraud label

---

## Project Workflow

### 1. Data Preparation (Google Sheets)

* Combined multiple tables using XLOOKUP
* Created transaction risk buckets
* Classified night transactions
* Built Pivot Tables to identify fraud patterns

### 2. SQL Analysis (PostgreSQL)

Performed analytical queries including:

* Fraud rate by customer segment
* Fraud analysis by merchant category
* Amount-based risk classification using CASE WHEN
* High-risk transaction detection
* Identification of customers with multiple fraud incidents

Techniques used:

* INNER JOIN
* GROUP BY
* CASE WHEN
* Aggregate functions
* ORDER BY
* Common fraud KPIs

### 3. Machine Learning (Python)

Implemented multiple fraud detection approaches from simple statistical methods to advanced supervised models.

Models:

* IQR
* Z-Score
* Isolation Forest
* Logistic Regression
* Random Forest
* XGBoost

Additional techniques:

* Feature Engineering
* Label Encoding
* Train/Test Split
* Standardization
* Classification Report
* Confusion Matrix
* SHAP Feature Importance

### 4. Business Intelligence (Tableau)

Developed an interactive dashboard including:

* Fraud Rate by Customer Segment
* Fraud Amount by Merchant Category
* Monthly Fraud Trend
* Customer Risk Heatmap
* Amount vs Income Scatter Plot

Interactive filters:

* Customer Segment
* Merchant Category
* Date
* Amount
* Risk Bucket

---

## Technologies

* PostgreSQL
* Python
* Pandas
* NumPy
* Scikit-learn
* XGBoost
* SHAP
* Tableau
* Google Sheets

---

## Key Business Insights

* Identified customer segments with elevated fraud risk.
* Compared fraud frequency across merchant categories.
* Evaluated the relationship between transaction amount and fraud probability.
* Built predictive models to support fraud detection.
* Created an interactive dashboard for fraud monitoring and investigation.

---

## Skills Demonstrated

* Data Cleaning
* SQL Analytics
* Exploratory Data Analysis (EDA)
* Fraud Analytics
* Feature Engineering
* Machine Learning
* Model Evaluation
* Data Visualization
* Dashboard Design
* Business Storytelling

## 🔗 Project Resources

### Google Sheets Analysis
Explore the exploratory data analysis, XLOOKUP integration, and Pivot Tables.

https://docs.google.com/spreadsheets/d/1RVIzp7viqSIx_gIh5nwz5NEoH2566Yc0/edit?usp=sharing

### Tableau Public Dashboard
Explore the interactive fraud analytics dashboard.

https://public.tableau.com/app/profile/recep.denizli/viz/FraudAnalysis_17844523307010/Dashboard1
