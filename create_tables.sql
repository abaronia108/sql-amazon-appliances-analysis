-- Create metadata table
CREATE TABLE appliances_metadata (
    asin varchar    PRIMARY KEY,
    price  TEXT,
    brand VARCHAR(255),
    description TEXT,
    price NUMERIC(10,2),
    subcategory VARCHAR(255)
);

-- Create reviews table
CREATE TABLE appliances_reviews (
    review_id       SERIAL         PRIMARY KEY,
    reviewer_id     VARCHAR(50),
    asin            VARCHAR(20)    REFERENCES metadata(asin),
    reviewer_name   VARCHAR(255),
    review_text     TEXT,
    overall_rating  NUMERIC(2,1),
    summary         TEXT,
    review_date     DATE
);


-- Load data from CSV files into the tables
-- Update the file paths below to match your local directory

COPY appliances_metadata (asin, price, imurl, description, categories, title, brand, subcategory)
FROM '/path/to/appliances_metadata.csv'
WITH (FORMAT CSV, HEADER);

COPY appliances_reviews (reviewerID, asin, reviewerName, reviewText, overall, summary, reviewTime)
FROM '/path/to/appliances_reviews.csv'
WITH (FORMAT CSV, HEADER);
