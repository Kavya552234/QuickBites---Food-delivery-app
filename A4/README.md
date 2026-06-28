# Assignment 4 — Sharding of the Developed Application

## Project Overview

This assignment extends the **QuickBites Food Delivery System** by implementing **horizontal scaling using database sharding**.

The existing database application was modified to support logical data partitioning across multiple simulated shards. The project demonstrates shard key selection, data distribution, query routing, shard isolation, and scalability analysis.

The implementation focuses on:

- Shard Key Selection
- Hash-Based Data Partitioning
- Data Migration
- Query Routing
- Shard Isolation
- Scalability Trade-off Analysis


---

# Sharding Implementation

## 1. Shard Key Selection

### Selected Shard Key

```
item_id
```

The `item_id` attribute from the **MenuItem** table was selected as the shard key.

### Justification

### High Cardinality

`item_id` is the primary key of the MenuItem table and uniquely identifies each record.

This provides high cardinality and enables even distribution of records across shards.

### Query Alignment

Most menu-related operations use `item_id`:

- Fetch menu item
- Update menu item
- Delete menu item

Using `item_id` allows direct routing of queries to the correct shard.

### Stability

`item_id` remains unchanged after insertion, preventing expensive data migration between shards.


---

# 2. Partitioning Strategy

The implemented partitioning strategy is:

## Hash-Based Partitioning

Shard calculation:

```python
shard_id = item_id % 3
```

Data distribution rule:

| Condition | Destination |
|---|---|
| item_id % 3 = 0 | shard_0 |
| item_id % 3 = 1 | shard_1 |
| item_id % 3 = 2 | shard_2 |


## Why Hash Partitioning?

Hash partitioning was chosen because:

- It distributes records uniformly
- It avoids uneven load caused by sequential IDs
- It provides fast shard identification
- It does not require an additional lookup table


---

# 3. Data Partitioning and Migration

The original `MenuItem` table was divided into three shard tables:

```
shard_0_menuitem
shard_1_menuitem
shard_2_menuitem
```

Each shard maintains the same schema as the original MenuItem table.


## Migration Logic

Data was migrated using:

```sql
INSERT INTO shard_X_menuitem
SELECT *
FROM menuitem
WHERE item_id % 3 = X;
```


Example:

```
item_id % 3 = 0  →  shard_0_menuitem

item_id % 3 = 1  →  shard_1_menuitem

item_id % 3 = 2  →  shard_2_menuitem
```


---

# 4. Data Validation

After migration, the following checks were performed:

- Total rows across all shards match original table count

- No duplicate `item_id` values exist across shards

- No records were lost during migration

- Data distribution was verified


Final distribution:

| Shard | Number of Records |
|---|---|
| shard_0_menuitem | 7 |
| shard_1_menuitem | 5 |
| shard_2_menuitem | 7 |


The validation confirms correct partitioning without overlap or data loss.


---

# 5. Query Routing Implementation

A shard router was implemented to direct every request to the correct shard.

Routing logic:

```python
shard = item_id % 3
```


## Single Item Operations

Operations:

- GET
- PUT
- DELETE

are directly routed to the required shard.


Example:

```
item_id = 701

701 % 3 = 2

Request is routed to shard_2_menuitem
```


This avoids unnecessary queries on other shards.


---

## Insert Operations

New records are inserted into the shard calculated using:

```python
item_id % 3
```

The application automatically selects the correct shard before insertion.


---

## Multi-Shard Queries

For queries requiring complete data:

Example:

```
GET all menu items
```

The system:

1. Queries all shards
2. Collects results
3. Merges the output
4. Returns the final response


---

# 6. Sharding Approach and Isolation

The project implements **logical sharding using multiple tables inside a single database instance**.

The simulated shards are:

```
shard_0_menuitem
shard_1_menuitem
shard_2_menuitem
```


Isolation is maintained using:

- Separate shard tables
- Deterministic shard mapping
- Application-level routing


Each record exists in exactly one shard, preventing duplication and inconsistency.


---

# 7. Scalability and Trade-off Analysis


## Horizontal vs Vertical Scaling

### Vertical Scaling

Vertical scaling improves performance by upgrading a single database server.

Examples:

- Increasing RAM
- Increasing CPU capacity
- Increasing storage


Limitations:

- Hardware limits
- Higher upgrade cost


### Horizontal Scaling

Horizontal scaling distributes data across multiple shards.

Advantages:

- Increased storage capacity
- Better workload distribution
- Parallel query execution
- Improved scalability


The implemented system follows horizontal scaling using sharding.


---

# Consistency

Single-shard operations provide strong consistency because only one shard is accessed.

Multi-shard operations require combining results from multiple shards and may require synchronization between shards.


---

# Availability

If one shard fails:

- Data stored in that shard becomes unavailable
- Other shards continue functioning


This provides:

- Partial availability
- Better failure isolation


---

# Partition Tolerance

The system handles partitioning using:

- Independent shard tables
- Deterministic shard mapping
- Controlled query routing


A failure in one shard affects only the records stored inside that shard.


---

# Results Achieved

The project successfully implements:

- Selection of a suitable shard key

- Hash-based partitioning

- Three simulated shards

- Correct data migration

- Zero overlap between shards

- Efficient query routing

- Horizontal scaling simulation

- Scalability analysis


---

# Limitations

- Shards are simulated using tables instead of separate physical servers
- No replication mechanism is implemented
- Range queries require checking multiple shards
- Dataset size is small compared to real distributed systems


---

# Conclusion

The QuickBites database system was successfully extended with sharding capabilities.

The implementation demonstrates how distributed database systems improve scalability by partitioning data, routing queries efficiently, and managing trade-offs between scalability, consistency, and availability.

This assignment provided practical understanding of real-world distributed database concepts and horizontal scaling techniques.
