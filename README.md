# Pizza Sales SQL Analysis

A **MySQL sales analytics project** that uses relational pizza-order data to answer business questions about orders, revenue, product demand, category performance, ordering patterns, and cumulative sales.

The project is structured from **basic SQL analysis to intermediate aggregations and advanced window-function queries**.

## Project objectives

The analysis focuses on questions such as:

- How many orders were placed and how much revenue was generated?
- Which pizza sizes and pizza types are ordered most frequently?
- Which categories generate the most quantity and revenue?
- When are orders most concentrated during the day?
- Which pizza types contribute the most revenue?
- What is the cumulative revenue trend over time?
- Which pizza types rank highest within each category?

## SQL analysis levels

### Basic SQL

The basic queries cover:

- Total order count
- Total sales / revenue
- Highest-priced pizza
- Most common pizza size
- Top 5 pizza types by quantity ordered

### Intermediate SQL

The intermediate queries cover:

- Quantity ordered by pizza category
- Order distribution by hour
- Pizza count by category
- Average pizzas ordered per day
- Top 3 pizza types by revenue

### Advanced SQL

The advanced queries cover:

- Revenue contribution by pizza category
- Cumulative revenue over time using window functions
- Top 3 pizza types within each category using `RANK()`

## SQL concepts demonstrated

- `SELECT`, `ORDER BY`, `LIMIT`
- Aggregate functions: `COUNT`, `SUM`, `AVG`
- `GROUP BY`
- `JOIN`
- Subqueries
- Common Table Expressions (`CTE`)
- Date/time analysis with `HOUR()`
- Revenue calculations
- Percentage contribution analysis
- Window functions
- `RANK()`
- Cumulative totals

## Data model

The queries work across the following relational tables:

```text
orders
├── order_id
├── order_date
└── order_time

order_details
├── order_details_id
├── order_id
├── pizza_id
└── quantity

pizzas
├── pizza_id
├── pizza_type_id
├── size
└── price

pizza_types
├── pizza_type_id
├── name
└── category
```

The analysis joins these tables to connect orders, quantities, products, categories, and prices.

## Repository structure

```text
pizza_sales_sql/
├── queries/
│   ├── Basic.sql
│   ├── Intermediate.sql
│   └── Advance.sql
├── questions.txt
└── README.md
```

## How to use

Run the SQL files in a MySQL environment containing the required pizza-sales tables.

Recommended order:

```text
1. Basic.sql
2. Intermediate.sql
3. Advance.sql
```

The `questions.txt` file contains the business questions addressed by each level.

## Scope & limitations

This repository focuses on **SQL querying and analytical reasoning**. The current repository contains query files and a question list, but does not include the underlying database schema or data import scripts.

The queries therefore assume that the required tables and columns already exist in the MySQL environment.

## Author

**Bhaskar Nakka** — Data Analyst | SQL · Python · Excel · Tableau · Power BI

For opportunities or project discussions: **[bn7740401@gmail.com](mailto:bn7740401@gmail.com)**