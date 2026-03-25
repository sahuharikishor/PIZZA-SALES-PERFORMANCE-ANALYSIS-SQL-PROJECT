# 🍕 Pizza Sales Performance Analysis — SQL Portfolio Project

<p align="center">
  <img src="https://img.shields.io/badge/Database-MySQL%208.0-blue?style=for-the-badge&logo=mysql" />
  <img src="https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Level-Beginner%20to%20Advanced-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge" />
</p>

📄 **[Click Here to View the Full Presentation (PDF)](./SQL_Project_Pizza_Sales.pdf)**

> 🎯 **Transforming Raw Transaction Data into Actionable Business Insights Using SQL**

**👤 Presented by:** Harikishor Sahu | BS in Computer Science & Data Analytics | IIT Patna

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Dataset Description](#-dataset-description)
- [Database Schema](#-database-schema)
- [Pizza Menu — Full List](#-pizza-menu--full-list)
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

The dataset represents **one full year** of pizza sales from a single restaurant location.

| File | Rows | Description |
|---|---|---|
| `orders.csv` | 21,350 | One row per order — date and time |
| `order_details.csv` | 48,620 | One row per pizza item ordered |
| `pizzas.csv` | 96 | All pizza variants (size + price) |
| `pizza_types.csv` | 32 | Pizza names, categories, ingredients |

**At a glance:**
- 📅 Period: Full year 
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