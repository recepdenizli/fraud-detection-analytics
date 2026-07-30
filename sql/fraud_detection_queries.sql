-- =====================================================
-- Fraud Detection Analytics Project
-- GOIT Data Analytics Hackathon
-- PostgreSQL Analysis Queries
-- =====================================================

-- ==========================================
-- 1. Preview source tables
-- ==========================================

SELECT *
FROM transactions;

SELECT *
FROM fraud_customers;

SELECT *
FROM fraud_labels;


-- ==========================================
-- 2. Fraud Rate by Customer Segment
-- Calculates total transactions, fraud count,
-- and fraud rate for each customer segment.
-- ==========================================

SELECT
    c.segment,
    COUNT(t.tx_id) AS total_transactions,
    SUM(f.is_fraud) AS fraud_count,
    ROUND(SUM(f.is_fraud) * 100.0 / COUNT(t.tx_id), 2) AS fraud_rate_pct
FROM transactions t
JOIN fraud_customers c
    ON t.customer_id = c.customer_id
JOIN fraud_labels f
    ON t.tx_id = f.tx_id
GROUP BY c.segment
ORDER BY fraud_rate_pct DESC;


-- ==========================================
-- 3. Fraud Rate by Transaction Amount Bucket
-- Groups transactions into risk buckets
-- using CASE WHEN.
-- ==========================================

WITH risk_bucket AS (
    SELECT
        t.tx_id,
        CASE
            WHEN t.amount < 200 THEN 'Low'
            WHEN t.amount < 500 THEN 'Medium'
            WHEN t.amount < 800 THEN 'High'
            ELSE 'Very High'
        END AS amount_risk_bucket,
        f.is_fraud
    FROM transactions t
    JOIN fraud_labels f
        ON t.tx_id = f.tx_id
)

SELECT
    amount_risk_bucket,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_count,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_pct
FROM risk_bucket
GROUP BY amount_risk_bucket
ORDER BY
    CASE amount_risk_bucket
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END;


-- ==========================================
-- 4. Fraud Analysis by Merchant Category
-- Calculates fraud statistics for each
-- merchant category.
-- ==========================================

SELECT
    t.merchant_category,
    COUNT(t.tx_id) AS total_transactions,
    SUM(f.is_fraud) AS fraud_count,
    ROUND(SUM(f.is_fraud) * 100.0 / COUNT(t.tx_id), 2) AS fraud_rate_pct
FROM transactions t
JOIN fraud_labels f
    ON t.tx_id = f.tx_id
GROUP BY t.merchant_category
ORDER BY fraud_rate_pct DESC;


-- ==========================================
-- 5. High-Risk Fraud Transactions
-- Returns the top 20 fraudulent transactions
-- over $500 and labels them as Day/Night.
-- ==========================================

SELECT
    t.tx_id,
    t.customer_id,
    t.amount,
    t.timestamp,
    t.merchant_category,
    CASE
        WHEN EXTRACT(HOUR FROM t.timestamp::timestamp) BETWEEN 0 AND 5
        THEN 'Night'
        ELSE 'Day'
    END AS transaction_period
FROM transactions t
JOIN fraud_labels f
    ON t.tx_id = f.tx_id
WHERE f.is_fraud = 1
  AND t.amount >= 500
ORDER BY t.amount DESC
LIMIT 20;


-- ==========================================
-- 6. Customers with Multiple Fraud Transactions
-- Identifies customers involved in more than
-- one fraudulent transaction.
-- ==========================================

SELECT
    t.customer_id,
    COUNT(*) AS fraud_transaction_count
FROM transactions t
JOIN fraud_labels f
    ON t.tx_id = f.tx_id
WHERE f.is_fraud = 1
GROUP BY t.customer_id
HAVING COUNT(*) > 1
ORDER BY fraud_transaction_count DESC, t.customer_id;
