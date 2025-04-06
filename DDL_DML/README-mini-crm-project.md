
# Mini CRM - SQL & PostgreSQL Basics

## Overview

This project contains a simple CRM (Customer Relationship Management) database built using **SQL** and **PostgreSQL**. It is designed for beginners to practice key **Data Definition Language (DDL)** and **Data Manipulation Language (DML)** concepts.

## Key Concepts Covered

- **Data Definition Language (DDL)**:
  - Creating tables
  - Altering table structures (e.g., adding columns)
  - Dropping tables
- **Data Manipulation Language (DML)**:
  - Inserting data into tables
  - Updating existing data
  - Deleting records from tables
  - Selecting data with queries

This project allows you to learn basic SQL commands and practice them in PostgreSQL, one of the most popular relational database management systems.

## Project Features

- **Database**: `mini_crm`
- **Tables Created**:
  - `customers`: Stores customer information like name, email, and phone number.
  - `products`: Stores details about products, including price and category (food).
  - `orders`: Stores order details, including total amounts and status.
  - `order_items`: Stores individual items within each order, linking products to orders.

## How to Use

1. **Create the Database**: Start by creating the `mini_crm` database in PostgreSQL.
2. **Create Tables**: Use the provided SQL code to create the tables for customers, products, orders, and order items.
3. **Insert Data**: Insert sample customer and order data into the tables.
4. **Alter Structure**: Learn how to modify table structures with `ALTER` commands.
5. **Manipulate Data**: Practice inserting, updating, and deleting records.
6. **Run Queries**: Retrieve customer orders with `SELECT` queries.

## PostgreSQL Features Used

- **SERIAL**: Automatically increments values for primary key columns.
- **FOREIGN KEY**: Ensures referential integrity between related tables (e.g., linking orders to customers).
- **CHECK Constraints**: Ensures values meet certain conditions (e.g., quantity > 0).
- **Default Values**: For columns like `created_at` and `order_status`.
