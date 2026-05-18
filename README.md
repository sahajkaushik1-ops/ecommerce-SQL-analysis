# E-Commerce Sales Analysis — MySQL

## Overview
Analysis of 100,000+ orders from a Brazilian e-commerce platform 
using MySQL to uncover business insights on revenue, delivery 
performance, and customer behavior.

## Key Findings
- Peak revenue month: November 2017 (R$ 1,153,528) — likely due to Black Friday
- Top revenue category: cama_mesa_banho (R$ 22.4M across 11,115 orders)
- Fastest delivery state: SP — avg 8.7 days
- Slowest delivery state: RR — significantly higher avg days
- Late deliveries avg rating: 2.57 vs On-time: 4.21 (39% lower)
- Only 3.12% customers make repeat purchases (2,997 out of 96,096)
- Most used payment method: Credit Card (76,795 transactions, R$ 12.5M revenue)
- Top state by orders: SP (43,622 orders, R$ 5.99M revenue)

## Analysis Covered
1. Monthly revenue trends (2017–2018)
2. Top 10 product categories by revenue
3. Average delivery time by state
4. Late delivery impact on customer ratings
5. Customer repeat purchase rate
6. Revenue breakdown by payment type
7. Top 5 states by order volume

## Business Insights
- Late deliveries receive 39% lower ratings — improving logistics 
  in high-delay states can significantly boost customer satisfaction
- Credit card dominates at 73% of all transactions
- SP state alone contributes ~55% of total orders
- Low repeat rate (3.12%) suggests strong new customer acquisition 
  but weak retention strategy

## Tools Used
MySQL 8.0, MySQL Workbench

## Dataset
Brazilian E-Commerce Public Dataset by Olist
Source: Kaggle
Records: 100,000+ orders across 6 tables
