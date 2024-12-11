Here's the updated **README.md** including the HTML file and all other content you shared:

---

# SQL Masterclass Repository

This repository contains a collection of SQL exercises, scripts, datasets, and interactive learning resources, including the **SQL Murder Mystery** and accompanying HTML interface.

---

## **Repository Contents**

### **1. Datasets**
- **`Customer.csv`**: Sample customer data with attributes like name, address, and region.
- **`Product.csv`**: Product-related data, including product IDs, categories, and names.
- **`Sales.csv`**: Sales data with information about order dates, sales values, and profits.
- **`Student.csv`**: Student data for exercises on table creation, querying, and updating.
- **`copy.csv`** & **`copytext.txt`**: Example files used for importing data into a database.

### **2. SQL Scripts**
- **`comprehensive_sql_operations.sql`**: A comprehensive collection of SQL queries demonstrating:
  - Joins (inner, left, right, full outer).
  - Subqueries and aggregate functions.
  - Window functions like `ROW_NUMBER` and `RANK`.
  - String and mathematical functions.
  - Date and time operations.
- **`customer_product_sales_schema.sql`**: SQL scripts to create and manage `Customer`, `Product`, and `Sales` tables with data import and operations.
- **`customer_table_operations.sql`**: Demonstrates basic table management, including creating, updating, and altering tables.
- **`science_class_management.sql`**: Exercises involving a classroom database with table creation, queries, and modifications.
- **`murder_mystery.txt`**: A full SQL-based murder mystery game. Solve a case by querying a fictional database, analyzing crime scene reports, witnesses, and suspect details.
- **`User_table.txt`**: Includes SQL statements for creating a `Users` table and inserting sample user data.

### **3. Binary Files**
- **`customer_test_empty_section24.bin`**: Represents a PostgreSQL tablespace for an empty test table.

### **4. Interactive HTML Interface**
- **`The SQL Murder Mystery.html`**: An interactive web interface designed for the **SQL Murder Mystery** exercise. This file provides a detailed walkthrough for solving the mystery, including schema exploration, query examples, and interactive hints.

---

## **SQL Murder Mystery**

### Overview
The SQL Murder Mystery is a game where you use SQL to solve a fictional murder that occurred in **SQL City** on **January 15, 2018**. This interactive exercise helps you practice SQL queries while unraveling the mystery.

### Objectives:
1. Retrieve the crime scene report for the murder.
2. Identify witnesses and investigate their accounts.
3. Trace the suspect using gym check-ins, car details, and other clues.
4. Determine the mastermind behind the murder.

### Key Commands:
- Query crime scene reports:
  ```sql
  SELECT * FROM crime_scene_report
  WHERE type = 'murder' AND date = '20180115' AND city = 'SQL City';
  ```
- Investigate witnesses:
  ```sql
  SELECT * FROM person
  WHERE address_street_name IN ('Northwestern Dr', 'Franklin Ave');
  ```
- Analyze gym check-ins and memberships:
  ```sql
  SELECT * FROM get_fit_now_member
  WHERE id = '48Z55';
  ```
- Identify the mastermind:
  ```sql
  SELECT * FROM person
  WHERE car_model = 'Model S' AND car_make = 'Tesla' AND height BETWEEN 65 AND 67;
  ```

### Using the HTML File:
- Open **`The SQL Murder Mystery.html`** in your browser to access an interactive environment for solving the mystery. The interface includes:
  - The murder story and database schema.
  - Hints and SQL query examples.
  - A walkthrough for beginners.

---

## **How to Use**

### **Database Setup**
1. Install PostgreSQL or SQLite.
2. Load datasets like `Customer.csv`, `Product.csv`, and `Sales.csv` using the `COPY` command or your DBMS's import tools.
3. Execute the SQL scripts to create and populate tables.

### **Explore the Murder Mystery**
- The murder mystery database is SQLite-based. Use queries provided in `murder_mystery.txt` or the interactive **HTML interface** to navigate through the case.

### **Run Other SQL Scripts**
- Use the `.sql` files to practice creating schemas, performing complex queries, and exploring SQL concepts.

---

## **Additional Content**

### User Table
SQL commands for creating a `Users` table and adding sample data:
```sql
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name CHARACTER VARYING
);

INSERT INTO users (name)
VALUES
  ('Alex'),
  ('Jon Snow'),
  ('Christopher'),
  ('Arya'),
  ('Sandip Debnath'),
  ('Lakshmi'),
  ('alex@gmail.com'),
  ('@sandip5004'),
  ('lakshmi@gmail.com');
```

---

## **How to Contribute**
- Fork the repository and make contributions via pull requests.
- Report any issues or suggest new features via the **Issues** tab.

---

## **License**
This project is available under the MIT License.

---

Let me know if you'd like further adjustments or enhancements!
