-- Create table TRANSACTION if it doesn't already exist
CREATE TABLE IF NOT EXISTS demo_db.demo.TRANSACTION (
    TRANSACTION_ID INT AUTOINCREMENT,       -- Auto-incrementing primary key
    ITEM_ID INT NOT NULL,                   -- Foreign key to ITEM table
    QUANTITY INT NOT NULL,                  -- Quantity of the item
    TRANSACTION_DATE TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP, -- When the transaction happened
    PRIMARY KEY (TRANSACTION_ID),
    FOREIGN KEY (ITEM_ID) REFERENCES ITEM(ITEM_ID)
);
