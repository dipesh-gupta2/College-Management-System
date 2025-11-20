# **College-Management-System**

Everything below is formatted clean, simple, and fully GitHub-friendly Markdown.

---

# **College-Management-System**

A complete SQL-based implementation of a student information management system.

---

## 📌 Overview

This project is a fully implemented **College Management System** designed to digitalize and streamline the workflow of the Student Affairs Department.

It includes:

* Problem Definition
* ER Model
* Relational Schema
* DDL Table Creation
* DML Insertions
* SQL Queries (JOIN, SUBQUERY, AGGREGATE)

The system follows complete database normalization and integrity constraints.

---

## 🏛️ Project Structure

### **1. Problem Definition**

The goal is to replace manual record-keeping with a secure, efficient, and accurate **database-driven student information system**.

It manages:

* Students
* Faculty
* Departments
* Courses
* Sections
* Mini Projects
* Research Projects

---

## 🧩 2. ER Model

The ER model contains all entities and relationships including:

* Department
* Student
* Faculty
* Course
* Section
* Mini_Project (with specialization for Research Project)
* Many-to-Many relationships such as:

  * Student–Course
  * Faculty–Course
  * Faculty–Project

---

## 🗃️ 3. Relational Schema

The relational schema maps the ER Model into complete SQL table structures with:

* Primary Keys
* Foreign Keys
* Composite Keys
* Unique Constraints
* Check Constraints
* Cascading Deletes

---

## 🛠️ 4. DDL Commands

Major tables included:

* Department
* Student
* Faculty
* Course
* Section
* Mini_Project
* Research_Project

Relationship tables:

* Student_Course
* Faculty_Course
* Faculty_Research_Project
* Department_Project
* Faculty_Project
* Course_Sec
* MiniProject_Sec
* Faculty_Sec

---

## 📥 5. DML Commands (Sample Data)

Sample data includes:

* 50 Departments
* 50 Sections
* 50 Mini Projects
* 100+ Students

All data is inserted with realistic attributes like:

* Names
* DOB
* Gender
* Phone
* Hobbies
* Salary
* Project information

---

## 🔍 6. SQL Queries

This project includes **5 executed SQL queries**:

### ✔ JOIN Queries (2)

* Student with Department and Section
* Faculty teaching Course with Department

### ✔ SUBQUERY Queries (2)

* Students older than average age
* Faculty teaching courses taken by a specific student

### ✔ AGGREGATE Query (1)

* Count departments having more than 10 students

---

## 📂 Folder Structure (Recommended)

```
College-Management-System/
│
├── README.md
│
├── ER_Diagram/
│   └── er_diagram.png
│
├── Schema/
│   └── relational_schema.pdf
│
├── SQL/
│   ├── ddl.sql
│   ├── dml.sql
│   └── queries.sql
│
└── Screenshots/
    ├── workbench_queries.png
    ├── tables_list.png
```

---

## 🚀 How to Run

### **1. Create the Database**

```sql
CREATE DATABASE college_management_system;
USE college_management_system;
```

### **2. Execute DDL**

```sql
SOURCE ddl.sql;
```

### **3. Insert Sample Data**

```sql
SOURCE dml.sql;
```

### **4. Run SQL Queries**

```sql
SOURCE queries.sql;
```

---

## 🧾 License

This project is developed for **academic and learning purposes**.
You may modify and reuse it with attribution.

---

## 🙌 Acknowledgements

Prepared as part of the **DBMS Lab (BCS-551)** internal practical exam.
Created by **Dipesh Gupta**.

