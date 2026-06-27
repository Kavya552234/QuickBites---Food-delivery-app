# Assignment 1 — Database Design and Conceptual Modelling

## Overview

QuickBites is a database-driven food delivery management system designed to
connect customers, restaurants, and delivery partners on a single digital
platform. This assignment focused on designing a normalized relational
database schema and modelling it conceptually through UML and ER diagrams.

The system supports user management, restaurant and menu management, order
processing, payment handling, delivery tracking, and a rating/review system.

## What We Did

### Module A — SQL Implementation

We designed and implemented a fully normalized relational schema (up to 3NF)
covering 16 tables, including Member, Customer, RestaurantOwner,
DeliveryPartner, Restaurant, MenuItem, Category, Orders, OrderItem, Offer,
Payment, Delivery, DeliveryLocation, Address, FoodReview, and DeliveryReview.

Key design decisions:
- **Specialization:** Member is the base entity; Customer, RestaurantOwner,
  and DeliveryPartner each have their own table linked back to Member via
  foreign key, avoiding data redundancy.
- **Many-to-Many resolution:** OrderItem resolves the M:N relationship
  between Orders and MenuItem.
- **Composition:** DeliveryLocation is dependent on Delivery and cannot
  exist without it.
- **Constraints enforced:** CHECK constraints on rating, price, quantity,
  discount values, and ENUM-style constraints on order_status,
  payment_status, delivery_status, and vehicle_type.
- **Referential integrity:** All foreign key relationships are enforced.

The SQL dump (`Module_A/A1_databases.sql`) includes all CREATE TABLE
statements, primary/foreign key constraints, CHECK constraints, and
10-20 sample rows per table.

### Module B — ER Diagram

We translated the relational schema into a conceptual ER model showing
entities, relationships, primary/foreign keys, and cardinalities (1:M, M:N).

The transition from UML to ER followed standard mapping rules — UML classes
became ER entities, associations became relationships, inheritance was
mapped using foreign-key specialization tables, and the M:N relationship
between Orders and MenuItem was resolved via the OrderItem associative
entity.

## Folder Structure
## How to Run the SQL Dump

1. Open MySQL Workbench or your preferred MySQL client
2. Create a new database:
```sql
   CREATE DATABASE quickbites;
   USE quickbites;
```
3. Run the dump file:
```bash
   mysql -u your_username -p quickbites < Module_A/A1_databases.sql
```

## Team Contributions

| Name | Roll No | Contribution |
|------|---------|--------------|
| Pravallika Matha | 24110198 | Database design (Module A — Design) |
| Poladasu Tanmai Manjula | 24110261 | SQL Implementation (Module A — Implementation) |
| Modalavalasa Anusha | 24110206 | UML Diagrams (Module B — UML) |
| Reddyboina Triveni | 24110295 | ER Diagram (Module B — ER) |
| Gullapalli Kavya Durga Sri | 24110125 | Lead — Integration & Documentation |
