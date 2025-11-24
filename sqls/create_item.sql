-- Create table ITEM if it doesn't already exist
CREATE TABLE IF NOT EXISTS demo_db.demo.ITEM (
    ITEM_ID INT AUTOINCREMENT,      -- Auto-incrementing primary key
    ITEM_NAME STRING NOT NULL,      -- Name of the item
    CATEGORY STRING,                -- Category of the item
    PRICE NUMBER(10,2),             -- Price with 2 decimals
    CREATED_AT TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP, -- Creation timestamp
    PRIMARY KEY (ITEM_ID)
);
