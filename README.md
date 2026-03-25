# 🍕 Pizza Sales Performance Analysis — SQL Portfolio Project

<p align="center">
  <img src="https://img.shields.io/badge/Database-MySQL%208.0-blue?style=for-the-badge&logo=mysql" />
  <img src="https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Level-Beginner%20to%20Advanced-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge" />
</p>

> 🎯 **Transforming Raw Transaction Data into Actionable Business Insights Using SQL**

**👤 Presented by:** Harikishor Sahu | BS in Computer Science & Data Analytics | IIT Patna

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Dataset Description](#-dataset-description)
- [Database Schema](#-database-schema)
- [Pizza Menu — Full List](#-pizza-menu--full-list)
- [Business Questions & SQL Solutions](#-business-questions--sql-solutions)
  - [Basic Level](#-basic-level)
  - [Intermediate Level](#-intermediate-level)
  - [Advanced Level](#-advanced-level)
- [Key Business Insights](#-key-business-insights)
- [SQL Concepts Demonstrated](#-sql-concepts-demonstrated)
- [Repository Structure](#-repository-structure)
- [How to Run](#-how-to-run)
- [Tools & Technologies](#-tools--technologies)
- [Author](#-author)

---

## 📌 Project Overview

This project uses **MySQL** to perform a full end-to-end analysis of a pizza restaurant's transactional sales data. By querying across 4 relational tables and writing **13 structured SQL queries** — progressing from simple aggregations to complex window functions — this project uncovers:

- 💰 Total revenue and sales performance
- 🕐 Peak ordering hours and busiest time slots
- 🍕 Best-selling pizza types and sizes
- 📦 Category-wise inventory demand
- 📈 Cumulative revenue growth over time
- 🏆 Top performers within each pizza category

This serves as a **hands-on SQL portfolio project** demonstrating real-world business intelligence capabilities on a realistic restaurant dataset.

---

## 📦 Dataset Description

The dataset represents **one full year (2015)** of pizza sales from a single restaurant location.

| File | Rows | Description |
|---|---|---|
| `orders.csv` | 21,350 | One row per order — date and time |
| `order_details.csv` | 48,620 | One row per pizza item ordered |
| `pizzas.csv` | 96 | All pizza variants (size + price) |
| `pizza_types.csv` | 32 | Pizza names, categories, ingredients |

**At a glance:**
- 📅 Period: Full year 2015
- 🧾 Total Orders: **21,350**
- 💵 Total Revenue: **$817,860.05**
- 🍕 Unique Pizza Types: **32**
- 📐 Pizza Sizes: S, M, L, XL, XXL
- 🗂️ Categories: Classic, Supreme, Chicken, Veggie

---

## 🗂️ Database Schema

```
Pizza_hub
│
├── orders
│   ├── order_id       (INT, PRIMARY KEY)
│   ├── order_date     (DATE)
│   └── order_time     (TIME)
│
├── order_details
│   ├── order_details_id  (INT, PRIMARY KEY, AUTO_INCREMENT)
│   ├── order_id          (INT, FK → orders.order_id)
│   ├── pizza_id          (TEXT, FK → pizzas.pizza_id)
│   └── quantity          (INT)
│
├── pizzas
│   ├── pizza_id          (TEXT, PRIMARY KEY)
│   ├── pizza_type_id     (TEXT, FK → pizza_types.pizza_type_id)
│   ├── size              (TEXT)  -- S, M, L, XL, XXL
│   └── price             (DECIMAL)
│
└── pizza_types
    ├── pizza_type_id     (TEXT, PRIMARY KEY)
    ├── name              (TEXT)
    ├── category          (TEXT)  -- Classic, Supreme, Chicken, Veggie
    └── ingredients       (TEXT)
```

**Relationships:**
```
orders ──< order_details >── pizzas >── pizza_types
(1:Many)              (Many:1)    (Many:1)
```

---

## 🍕 Pizza Menu — Full List

### 🍗 Chicken (6 types)
| Pizza Name | Key Ingredients |
|---|---|
| The Barbecue Chicken Pizza | Barbecued Chicken, Red & Green Peppers, Tomatoes, Red Onions, BBQ Sauce |
| The California Chicken Pizza | Chicken, Artichoke, Spinach, Garlic, Jalapeno, Fontina & Gouda Cheese |
| The Chicken Alfredo Pizza | Chicken, Red Onions, Red Peppers, Mushrooms, Asiago Cheese, Alfredo Sauce |
| The Chicken Pesto Pizza | Chicken, Tomatoes, Red Peppers, Spinach, Garlic, Pesto Sauce |
| The Southwest Chicken Pizza | Chicken, Tomatoes, Red Peppers, Red Onions, Jalapeno, Corn, Chipotle Sauce |
| The Thai Chicken Pizza | Chicken, Pineapple, Tomatoes, Red Peppers, Thai Sweet Chilli Sauce |

### 🍕 Classic (8 types)
| Pizza Name | Key Ingredients |
|---|---|
| The Big Meat Pizza | Bacon, Pepperoni, Italian Sausage, Chorizo Sausage |
| The Classic Deluxe Pizza | Pepperoni, Mushrooms, Red Onions, Red Peppers, Bacon |
| The Greek Pizza ⭐ *(Highest Priced — $35.95)* | Kalamata Olives, Feta Cheese, Tomatoes, Garlic, Beef Chuck Roast, Red Onions |
| The Hawaiian Pizza | Sliced Ham, Pineapple, Mozzarella Cheese |
| The Italian Capocollo Pizza | Capocollo, Red Peppers, Tomatoes, Goat Cheese, Garlic, Oregano |
| The Napolitana Pizza | Tomatoes, Anchovies, Green Olives, Red Onions, Garlic |
| The Pepperoni Pizza | Mozzarella Cheese, Pepperoni |
| The Pepperoni, Mushroom, and Peppers Pizza | Pepperoni, Mushrooms, Green Peppers |

### 👑 Supreme (9 types)
| Pizza Name | Key Ingredients |
|---|---|
| The Brie Carre Pizza | Brie Carre Cheese, Prosciutto, Caramelized Onions, Pears, Thyme, Garlic |
| The Calabrese Pizza | Nduja Salami, Pancetta, Tomatoes, Red Onions, Friggitello Peppers, Garlic |
| The Italian Supreme Pizza | Calabrese Salami, Capocollo, Tomatoes, Red Onions, Green Olives, Garlic |
| The Pepper Salami Pizza | Genoa Salami, Capocollo, Pepperoni, Tomatoes, Asiago Cheese, Garlic |
| The Prosciutto and Arugula Pizza | Prosciutto di San Daniele, Arugula, Mozzarella Cheese |
| The Sicilian Pizza | Coarse Sicilian Salami, Tomatoes, Green Olives, Luganega Sausage, Onions, Garlic |
| The Soppressata Pizza | Soppressata Salami, Fontina & Mozzarella Cheese, Mushrooms, Garlic |
| The Spicy Italian Pizza | Capocollo, Tomatoes, Goat Cheese, Artichokes, Peperoncini, Garlic |
| The Spinach Supreme Pizza | Spinach, Red Onions, Pepperoni, Tomatoes, Artichokes, Kalamata Olives, Asiago Cheese |

### 🥦 Veggie (9 types)
| Pizza Name | Key Ingredients |
|---|---|
| The Five Cheese Pizza | Mozzarella, Provolone, Smoked Gouda, Romano, Blue Cheese, Garlic |
| The Four Cheese Pizza | Ricotta, Gorgonzola Piccante, Mozzarella, Parmigiano Reggiano, Garlic |
| The Green Garden Pizza | Spinach, Mushrooms, Tomatoes, Green Olives, Feta Cheese |
| The Italian Vegetables Pizza | Eggplant, Artichokes, Tomatoes, Zucchini, Red Peppers, Garlic, Pesto Sauce |
| The Mediterranean Pizza | Spinach, Artichokes, Kalamata Olives, Sun-dried Tomatoes, Feta Cheese, Red Onions |
| The Mexicana Pizza | Tomatoes, Red Peppers, Jalapeno, Red Onions, Cilantro, Corn, Chipotle Sauce |
| The Spinach and Feta Pizza | Spinach, Mushrooms, Red Onions, Feta Cheese, Garlic |
| The Spinach Pesto Pizza | Spinach, Artichokes, Tomatoes, Sun-dried Tomatoes, Garlic, Pesto Sauce |
| The Vegetables + Vegetables Pizza | Mushrooms, Tomatoes, Red & Green Peppers, Red Onions, Zucchini, Spinach, Garlic |

---

## ❓ Business Questions & SQL Solutions

### 🟢 Basic Level

---

#### Q1 — Retrieve the total number of orders placed

```sql
SELECT COUNT(order_id) AS Total_Orders
FROM orders;
```

**Result:**

| Total_Orders |
|---|
| **21350** |

📌 *The restaurant received 21,350 orders throughout 2015.*

---

#### Q2 — Calculate the total revenue generated from pizza sales

```sql
SELECT
    ROUND(SUM(order_details.Quantity * pizzas.price), 2) AS 'Total Revenue'
FROM order_details
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id;
```

**Result:**

| Total Revenue |
|---|
| **817860.05** |

📌 *Total annual revenue crossed $817K — a strong performance for a single location.*

---

#### Q3 — Identify the highest-priced pizza

```sql
SELECT pizza_types.name, pizzas.price
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;
```

**Result:**

| name | price |
|---|---|
| The Greek Pizza | **35.95** |

📌 *The Greek Pizza is the premium offering at $35.95, featuring Kalamata Olives, Feta Cheese, and Beef Chuck Roast.*

---

#### Q4 — Identify the most common pizza size ordered

```sql
SELECT
    pizzas.size,
    COUNT(order_details.order_details_id) AS Common_Pizza_Size_Order
FROM pizzas
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY Common_Pizza_Size_Order DESC;
```

**Result:**

| size | Common_Pizza_Size_Order |
|---|---|
| **L** | **18526** |
| M | 15385 |
| S | 14137 |
| XL | 544 |
| XXL | 28 |

📌 *Large is the most popular size by a significant margin. XXL with only 28 orders is a candidate for removal.*

---

#### Q5 — List the top 5 most ordered pizza types along with their quantities

```sql
SELECT
    pizza_types.name,
    SUM(order_details.Quantity) AS Total_Ordered
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY Total_Ordered DESC
LIMIT 5;
```

**Result:**

| name | Total_Ordered |
|---|---|
| The Classic Deluxe Pizza | **2453** |
| The Barbecue Chicken Pizza | 2432 |
| The Hawaiian Pizza | 2422 |
| The Pepperoni Pizza | 2418 |
| The Thai Chicken Pizza | 2371 |

📌 *The Classic Deluxe leads in quantity, but Chicken pizzas dominate the top 5 revenue-wise.*

---

### 🟡 Intermediate Level

---

#### Q6 — Total quantity of each pizza category ordered

```sql
SELECT
    pizza_types.category,
    SUM(order_details.Quantity) AS Total_Quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY Total_Quantity DESC;
```

**Result:**

| category | Total_Quantity |
|---|---|
| **Classic** | **14888** |
| Supreme | 11987 |
| Veggie | 11649 |
| Chicken | 11050 |

📌 *Classic pizzas are ordered most, but all categories are relatively balanced — no single category is ignored.*

---

#### Q7 — Distribution of orders by hour of the day

```sql
SELECT
    HOUR(order_time) AS Hours,
    COUNT(order_id) AS Total_Order
FROM orders
GROUP BY HOUR(order_time);
```

**Result:**

| Hours | Total_Order | Note |
|---|---|---|
| 9 | 1 | |
| 10 | 8 | |
| 11 | 1231 | |
| **12** | **2520** | 🔥 Peak Hour |
| 13 | 2455 | |
| 14 | 1472 | |
| 15 | 1468 | |
| 16 | 1920 | |
| **17** | **2336** | 🌅 Dinner Rush Starts |
| **18** | **2399** | |
| 19 | 2009 | |
| 20 | 1642 | |
| 21 | 1198 | |
| 22 | 663 | |
| 23 | 28 | |

📌 *Two clear peaks: Lunch (12–1 PM) and Dinner (5–6 PM). Staffing and inventory should be optimized around these windows.*

---

#### Q8 — Category-wise distribution of pizza types

```sql
SELECT category, COUNT(name) AS Total_items
FROM pizza_types
GROUP BY Category;
```

**Result:**

| category | Total_items |
|---|---|
| Chicken | 6 |
| Classic | 8 |
| Supreme | 9 |
| Veggie | 9 |

📌 *Supreme and Veggie offer the most variety (9 types each), while Chicken has the fewest but highest revenue per type.*

---

#### Q9 — Average number of pizzas ordered per day

```sql
SELECT ROUND(AVG(Pizzas_par_day), 2) AS Avg_num_pizzas
FROM (
    SELECT
        DATE(orders.order_date) AS Order_day,
        SUM(order_details.Quantity) AS Pizzas_par_day
    FROM orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY DATE(order_date)
) AS Daily_Orders;
```

**Result:**

| Avg_num_pizzas |
|---|
| **138.47** |

📌 *On average, ~138 pizzas are sold daily. This is a key number for daily ingredient procurement and kitchen planning.*

---

#### Q10 — Top 3 most ordered pizza types based on revenue

```sql
SELECT
    pizza_types.name,
    ROUND(SUM(order_details.Quantity * pizzas.price), 2) AS Total_Revenue
FROM pizza_types
JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY Total_Revenue DESC
LIMIT 3;
```

**Result:**

| name | Total_Revenue |
|---|---|
| 🥇 The Thai Chicken Pizza | **$43,434.25** |
| 🥈 The Barbecue Chicken Pizza | **$42,768.00** |
| 🥉 The California Chicken Pizza | **$41,409.50** |

📌 *All top 3 revenue earners are Chicken pizzas — a strong signal to expand the chicken category.*

---

### 🔴 Advanced Level

---

#### Q11 — Percentage contribution of each pizza category to total revenue

```sql
SELECT
    pizza_types.category,
    ROUND(
        SUM(order_details.Quantity * pizzas.price) /
        (SELECT ROUND(SUM(order_details.Quantity * pizzas.price), 2)
         FROM order_details
         JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id) * 100,
    2) AS Total_Revenue_percentage
FROM pizza_types
JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY Total_Revenue_percentage DESC;
```

**Result:**

| category | Total_Revenue_percentage |
|---|---|
| Classic | **26.91%** |
| Supreme | 25.46% |
| Chicken | 23.96% |
| Veggie | 23.68% |

📌 *Revenue is nearly evenly split across all 4 categories (within ~3%), showing a well-balanced menu with no heavy dependency on a single category.*

---

#### Q12 — Cumulative revenue generated over time

```sql
SELECT order_date,
       SUM(Revenue) OVER(ORDER BY order_date) AS Cum_Revenue
FROM (
    SELECT
        orders.order_date,
        ROUND(SUM(order_details.Quantity * pizzas.price), 2) AS Revenue
    FROM order_details
    JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
    JOIN orders ON order_details.order_id = orders.order_id
    GROUP BY orders.order_date
) AS Sales;
```

**Sample Output (first few rows):**

| order_date | Cum_Revenue |
|---|---|
| 2015-01-01 | 2713.85 |
| 2015-01-02 | 5033.60 |
| 2015-01-03 | 7349.45 |
| ... | ... |
| 2015-12-31 | 817860.05 |

🔧 **Technique Used:** `SUM() OVER(ORDER BY order_date)` — a **window function** that calculates a running total without collapsing rows.

📌 *Cumulative revenue tracking helps visualize business growth trends and identify slow or strong sales periods throughout the year.*

---

#### Q13 — Top 3 most ordered pizza types by revenue for each category

```sql
SELECT name, Revenue
FROM (
    SELECT category, name, revenue,
           RANK() OVER(PARTITION BY category ORDER BY Revenue DESC) AS rn
    FROM (
        SELECT
            pizza_types.category,
            pizza_types.name,
            ROUND(SUM(order_details.Quantity * pizzas.price), 2) AS Revenue
        FROM pizza_types
        JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
        GROUP BY pizza_types.category, pizza_types.name
    ) AS a
) AS b
WHERE rn <= 3;
```

**Result:**

| Category | name | Revenue |
|---|---|---|
| **Chicken** | The Thai Chicken Pizza | $43,434.25 |
| Chicken | The Barbecue Chicken Pizza | $42,768.00 |
| Chicken | The California Chicken Pizza | $41,409.50 |
| **Classic** | The Classic Deluxe Pizza | $38,180.50 |
| Classic | The Barbecue Chicken Pizza | $37,468.50 |
| Classic | The Hawaiian Pizza | $32,273.25 |
| **Supreme** | The Spicy Italian Pizza | $34,831.25 |
| Supreme | The Italian Supreme Pizza | $33,476.75 |
| Supreme | The Calabrese Pizza | $25,882.50 |
| **Veggie** | The Four Cheese Pizza | $32,265.70 |
| Veggie | The Mexicana Pizza | $26,780.75 |
| Veggie | The Five Cheese Pizza | $26,066.50 |

🔧 **Technique Used:** `RANK() OVER(PARTITION BY category ORDER BY Revenue DESC)` — ranks each pizza **independently within its category**, then filters for top 3.

📌 *This per-category ranking helps identify underperforming pizzas within each group and informs menu curation decisions.*

---

## 📊 Key Business Insights

| # | Insight | Action |
|---|---|---|
| 1 | 🥇 Classic is the top revenue category at **26.91%** | Maintain strong Classic menu presence |
| 2 | 📏 **Large (L)** is ordered 18,526 times vs only 28 for XXL | Consider removing XXL size |
| 3 | ⏰ Peak hours are **12 PM** (2,520) and **6 PM** (2,399) | Schedule more staff during lunch & dinner |
| 4 | 🍗 All **top 3 revenue pizzas** are Chicken-based | Expand the Chicken category |
| 5 | 📅 Average **138.47 pizzas/day** | Use as baseline for daily ingredient planning |
| 6 | 📈 Revenue balanced across all 4 categories (~3% spread) | Menu is well-diversified — no over-reliance |
| 7 | 🏆 The Classic Deluxe Pizza leads in **quantity** (2,453) | Feature in combo deals and promotions |
| 8 | 💰 The Thai Chicken leads in **revenue** ($43,434) | Highlight as a premium offering |

---

## 🛠️ SQL Concepts Demonstrated

| Concept | Questions | Description |
|---|---|---|
| `COUNT()` | Q1 | Count total rows |
| `SUM()` + `ROUND()` | Q2, Q6, Q9, Q10 | Revenue and quantity aggregation |
| `ORDER BY` + `LIMIT` | Q3, Q5, Q10 | Top-N filtering |
| `JOIN` (2 tables) | Q2, Q3, Q4 | Basic table linking |
| `JOIN` (3 tables) | Q5, Q6, Q10 | Multi-table combining |
| `GROUP BY` | Q4, Q6, Q7, Q8 | Grouped aggregations |
| `HOUR()`, `DATE()` | Q7, Q9 | Date/time extraction |
| **Subquery** | Q11 | Nested SELECT for % calculation |
| **Derived Table** | Q9, Q12, Q13 | Inline subquery used as a table |
| `SUM() OVER()` | Q12 | **Window function** — cumulative sum |
| `RANK() OVER(PARTITION BY)` | Q13 | **Window function** — category-level ranking |

---

## 📁 Repository Structure

```
pizza-sales-sql-analysis/
│
├── 📂 data/
│   ├── orders.csv            # 21,350 orders (date + time)
│   ├── order_details.csv     # 48,620 line items
│   ├── pizzas.csv            # 96 pizza variants (size + price)
│   └── pizza_types.csv       # 32 pizza types (name + category + ingredients)
│
├── 📂 queries/
│   ├── Q_1.sql               # Total orders
│   ├── Q_2.sql               # Total revenue
│   ├── Q_3.sql               # Highest-priced pizza
│   ├── Q_4.sql               # Most common pizza size
│   ├── Q_5.sql               # Top 5 most ordered pizza types
│   ├── Q_6.sql               # Total quantity by category
│   ├── Q_7.sql               # Orders by hour of day
│   ├── Q_8.sql               # Category-wise pizza type count
│   ├── Q_9.sql               # Average pizzas per day
│   ├── Q_10.sql              # Top 3 pizzas by revenue
│   ├── Q_11.sql              # Revenue % by category
│   ├── Q_12.sql              # Cumulative revenue over time
│   └── Q_13.sql              # Top 3 per category by revenue
│
├── Table_creation.sql         # DDL — CREATE TABLE statements for all 4 tables
├── SQL_Project_Pizza_Sales.pdf  # Full project presentation (Canva)
└── README.md                  # This file
```

---

## ⚙️ How to Run

### Prerequisites
- MySQL 8.0 or higher
- MySQL Workbench (or any MySQL client)

### Step-by-Step Setup

**1. Clone the repository**
```bash
git clone https://github.com/your-username/pizza-sales-sql-analysis.git
cd pizza-sales-sql-analysis
```

**2. Create and select the database**
```sql
CREATE DATABASE Pizza_hub;
USE Pizza_hub;
```

**3. Create all tables**
```sql
-- Run the provided DDL file
SOURCE Table_creation.sql;
```

**4. Find your MySQL secure upload directory**
```sql
SHOW VARIABLES LIKE 'secure_file_priv';
```

**5. Copy CSV files** to the path returned above, then load data:
```sql
LOAD DATA INFILE '/your/path/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Repeat for order_details.csv, pizzas.csv, pizza_types.csv
```

**6. Run the queries**
```sql
-- Run each query file in order
SOURCE queries/Q_1.sql;
SOURCE queries/Q_2.sql;
-- ... through Q_13.sql
```

---

## 📦 Tools & Technologies

| Tool | Purpose |
|---|---|
| **MySQL 8.0** | Database engine |
| **MySQL Workbench** | SQL IDE and query execution |
| **CSV files** | Raw data storage and import |
| **Canva** | Project presentation design (PDF) |
| **GitHub** | Version control and portfolio hosting |

---

## 👤 Author

**Harikishor Sahu**

- 🎓 BS in Computer Science & Data Analytics — IIT Patna
- 💼 Aspiring Data Analyst
- 📊 Skills: SQL, Python, Data Analysis, Business Intelligence

---

## 📄 License

This project is intended for **educational and portfolio purposes**. The dataset is publicly available and used here for learning. Feel free to fork, reference, or build upon this project with proper attribution.

---

<p align="center">
  ⭐ If you found this project helpful, please consider giving it a star!
</p>