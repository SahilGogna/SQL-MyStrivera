# 🚲 Bike Rental SQL Case Study

This repository contains a SQL case study based on a fictional bike rental shop run by Emily. As a data analyst, your task is to answer key business questions using SQL, leveraging insights from a database of bikes, customers, rentals, and memberships.

---

## 📘 Case Study Background

Emily owns a bike rental shop and wants to improve her business through data-driven decisions. She has asked for your help to analyze her shop's database to answer questions.

This case study gives you hands-on experience writing intermediate to advanced SQL queries to extract insights from a real-world business context.

---

## 🧱 Database Structure

The database consists of the following tables:

1. **customer** – Info about each customer.
2. **bike** – Details of the bikes available for rent.
3. **rental** – Records of each bike rental.
4. **membership_type** – Information about the different types of memberships available.
5. **membership** – Memberships purchased by customers.

---

## 🧠 Problem Statements

Some of the business questions you'll answer:

### Question 1:
Emily would like to know how many bikes the shop owns by category. Can you get this for her?
Display the category name and the number of bikes the shop owns in each category (call this column number_of_bikes ). Show only the categories where the number of bikes is greater than 2 .

### Question 2: 
Emily needs a list of customer names with the total number of memberships purchased by each.
For each customer, display the customer's name and the count of memberships purchased (call this column membership_count ). Sort the results by membership_count , starting with the customer who has purchased the highest number of memberships. Keep in mind that some customers may not have purchased any memberships yet. In such a situation, display 0 for the membership_count .

### Question 3:

Emily is working on a special offer for the winter months. Can you help her prepare a list of new rental prices?

For each bike, display the following:
- `id`
- `category`
- `old_price_per_hour`
- `new_price_per_hour`
- `old_price_per_day`
- `new_price_per_day`

#### 💸 Discount Rules:
- **Electric bikes**:  
  - 10% discount on hourly rentals  
  - 20% discount on daily rentals
- **Mountain bikes**:  
  - 20% discount on hourly rentals  
  - 50% discount on daily rentals
- **All other bikes**:  
  - 50% discount on both hourly and daily rentals

Make sure to round all new prices to **2 decimal places**.

### Question 4:
Emily is looking for counts of the rented bikes and of the available bikes in each category. Display the number of available bikes (call this column available_bikes_count) and the number of rented bikes (call this column rented_bikes_count) by bike category.

### Question 5:

Emily is preparing a sales report. She needs to know the **total revenue from rentals by month, by year, and across all years**.

For each row, display the following:
- `year`
- `month` (use `null` for yearly totals)
- `revenue`

#### 📌 Instructions:
- Only include **rental revenue** (🚫 exclude membership revenue).
- Sort the data **chronologically**:
  - Show monthly revenue for each year.
  - After listing all months of a year, include the **yearly total** with `month = null`.
  - At the end, show the **all-time total** with both `year` and `month` as `null`.

#### 📊 Example Output:

| year | month | revenue |
|------|-------|---------|
| 2022 | 11    | 200.00  |
| 2022 | 12    | 150.00  |
| 2022 | null  | 350.00  |
| 2023 | 1     | 110.00  |
| ...  | ...   | ...     |
| 2023 | 10    | 335.00  |
| 2023 | null  | 1370.00 |
| null | null  | 1720.00 |

Your goal is to help Emily quickly understand rental revenue trends across months, years, and overall.

### Question 6:
Emily has asked you to get the total revenue from memberships for each combination of year, month, and membership type. 

Display the year, the month, the name of the membership type (call this column membership_type_name), and the total revenue (call this column total_revenue) for every combination of year, month, and membership type. Sort the results by year, month, and name of membership type.

### Question 7: PENDING

### Question 8:

Now it's time for the final task.

Emily wants to segment customers based on the number of rentals and see the count of customers in each segment. Use your SQL skills to get this!

Categorize customers based on their rental history as follows:
- Customers who have had **more than 10 rentals** are categorized as `'more than 10'`.
- Customers who have had **5 to 10 rentals (inclusive)** are categorized as `'between 5 and 10'`.
- Customers who have had **fewer than 5 rentals** are categorized as `'fewer than 5'`.

Calculate the number of customers in each category.

Display two columns:
- `rental_count_category` (the rental count category)
- `customer_count` (the number of customers in each category)

---

## 🛠️ How to Use

1. Run the provided SQL script (when available) in your favorite RDBMS (PostgreSQL, MySQL, etc.).
2. Review each problem statement.
3. Write and run SQL queries to find answers.
4. Cross-check with the solution script for learning and validation.

---

## 🙌 Credits

- Case study content sourced from [LearnSQL.com's November 2023 Advanced SQL Challenge](https://learnsql.com/course/2023-advanced-sql-practice-challenges/november-challenge/introduction/introduction/)
- Special thanks to [TechTFQ](https://techtfq.com/) for compiling and sharing this case study material.

---

## 📢 Disclaimer

This repository is meant for **learning and practice** purposes only. All rights to original content belong to the respective authors/platforms mentioned above.
