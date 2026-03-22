# SQL Analysis: Amazon Appliances Review Dataset

Exploratory SQL analysis of Amazon Appliances reviews and product metadata using PostgreSQL, covering 600,000+ reviews across 93 product subcategories.

## Data Source

Ni, J., Li, J., & McAuley, J. (2019). Justifying recommendations using distantly-labeled reviews and fine-grained aspects. *Empirical Methods in Natural Language Processing (EMNLP)*.

Dataset: https://nijianmo.github.io/amazon/index.html  
Category used: Appliances (602,777 reviews)

## Overview

This project loads Amazon Appliances review and product metadata into a PostgreSQL relational database and runs 13 analytical SQL queries to explore reviewer behavior, product ratings, subcategory trends, and temporal patterns in review activity.

Data was preprocessed in Python (Pandas) before loading into PostgreSQL via pgAdmin 4.

## Key Findings

- Overall average rating across all reviews: **4.08 / 5.0**
- Total unique reviewers: **132,002**
- Total product subcategories: **93**
- Most reviewed subcategory: **Dryer Parts & Accessories** (5,529 reviews)
- January review volume grew from **881 in 2011** to **6,747 in 2014**, reflecting rapid growth in Amazon Appliances activity over this period

## Database Schema

```sql
CREATE TABLE appliances_metadata (
    asin varchar PRIMARY KEY,
    price numeric,
    imurl varchar,
    description varchar,
    categories varchar,
    title varchar,
    brand varchar,
    subcategory varchar
);

CREATE TABLE appliances_reviews (
    reviewerID varchar,
    asin varchar,
    reviewerName varchar,
    reviewText varchar,
    overall numeric,
    summary varchar,
    reviewTime date
);
```

## Queries Covered

1. Average rating per reviewer
2. Average ratings by month for 2014
3. Average price per subcategory
4. Product count per subcategory
5. Total number of subcategories
6. Overall average review rating
7. Total unique reviewers
8. Review count per subcategory
9. Average review text length (characters)
10. Review count every January for 2011–2014
11. Review count per subcategory every May for 2011–2014
12. Average price per subcategory where average rating > 3
13. Top 3 most reviewed products per subcategory (using window functions)

## Setup

### Requirements
- PostgreSQL
- pgAdmin 4
- Python 3 with Pandas (for data preprocessing)

## Data Preprocessing
The following preprocessing steps were applied to the raw data using 
Python (Pandas) before loading into PostgreSQL:
- Extracted subcategory from nested categories field
- Converted reviewTime to datetime format
- Selected relevant columns for each table


### Steps
1. Download the Appliances reviews and metadata files from the dataset 
   link above
2. Parse and preprocess the raw JSON files into CSV format using Python 
   (Pandas) — key steps include extracting subcategory from the nested 
   categories field, converting reviewTime to datetime, and selecting 
   relevant columns
3. Create the database tables using `queries/create_tables.sql`
4. Load the CSV files into PostgreSQL using the COPY commands in 
   `queries/create_tables.sql` — update file paths to match your 
   local directory
5. Run the analysis queries in `queries/analysis_queries.sql`


## Tools
- PostgreSQL
- pgAdmin 4
- Python (Pandas) — data preprocessing
- SQL — window functions, joins, aggregations, date extraction
