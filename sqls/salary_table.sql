-- DDL: create salary table in demo_db.demo
-- Assumes database `demo_db` and schema `demo` already exist

CREATE TABLE IF NOT EXISTS demo_db.demo.salary (
    employee_id NUMBER(38,0) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    position VARCHAR(150),
    salary_amount NUMBER(18,2),
    currency VARCHAR(10) DEFAULT 'USD',
    effective_date DATE,
    created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),

    -- Optional: logical unique identifier (Snowflake does not enforce primary keys)
    CONSTRAINT salary_emp_unique UNIQUE (employee_id, effective_date)
);

-- Example: to run this file using SnowSQL from Windows cmd:
-- snowsql -a <account> -u <user> -f "c:\Maninder\github\snowflake_terraform_sql\sql\salary_table.sql"

-- End of file
