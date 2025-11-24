CREATE OR REPLACE TABLE EMPLOYEE_DESIGNATION (
    EMP_ID        NUMBER(10)       NOT NULL,        -- Employee ID
    EMP_NAME      VARCHAR(100)     NOT NULL,        -- Employee Name
    DESIGNATION   VARCHAR(50)      NOT NULL,        -- Job Title / Designation
    DEPARTMENT    VARCHAR(50),                      -- Department Name
    JOIN_DATE     DATE,                              -- Date of Joining
    STATUS        VARCHAR(20) DEFAULT 'Active',     -- Employment Status
    CREATED_AT    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT    TIMESTAMP
);
