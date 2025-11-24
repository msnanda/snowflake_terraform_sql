-- Create table TRANSACTION if it doesn't already exist
CREATE TABLE IF NOT EXISTS demo_db.demo.TRANSACTION (
    TRANSACTION_ID INT AUTOINCREMENT,       -- Auto-incrementing primary key
    ITEM_ID INT NOT NULL,                   -- Foreign key to ITEM table
    QUANTITY INT NOT NULL                  -- Quantity of the item

);
