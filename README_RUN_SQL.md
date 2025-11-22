Run SQL against Snowflake (from VS Code)

This project includes a VS Code task that runs the current SQL file with SnowSQL using environment variables (so you can keep prod secrets out of the repo).

1) Install SnowSQL
   - Follow Snowflake docs: https://docs.snowflake.com/en/user-guide/snowsql

2) Put SnowSQL on PATH and verify in cmd.exe:

```cmd
snowsql -v
```

3) Provision environment variables from your production secret store.
   - Required variables (example names used by the VS Code task):
     - `SNOWSQL_ACCOUNT` (e.g. abc-12345.us-east-1)
     - `SNOWSQL_USER`
     - `SNOWSQL_PWD` (or use keypair auth instead of password)
     - `SNOWSQL_ROLE` (optional)
     - `SNOWSQL_WAREHOUSE` (optional)

   - Examples (Windows `cmd.exe`, temporary for session):

```cmd
set SNOWSQL_ACCOUNT=your_account
set SNOWSQL_USER=your_user
set SNOWSQL_PWD=your_password
set SNOWSQL_ROLE=your_role
set SNOWSQL_WAREHOUSE=your_warehouse
```

   - Persist to user environment (so VS Code can pick them up on restart):

```cmd
setx SNOWSQL_ACCOUNT "your_account"
setx SNOWSQL_USER "your_user"
setx SNOWSQL_PWD "your_password"
setx SNOWSQL_ROLE "your_role"
setx SNOWSQL_WAREHOUSE "your_warehouse"
```

   - CI example (GitHub Actions) — read secrets into environment:

```yaml
- name: Run SQL with SnowSQL
  env:
    SNOWSQL_ACCOUNT: ${{ secrets.SNOWSQL_ACCOUNT }}
    SNOWSQL_USER: ${{ secrets.SNOWSQL_USER }}
    SNOWSQL_PWD: ${{ secrets.SNOWSQL_PWD }}
    SNOWSQL_ROLE: ${{ secrets.SNOWSQL_ROLE }}
    SNOWSQL_WAREHOUSE: ${{ secrets.SNOWSQL_WAREHOUSE }}
  run: |
    snowsql -a "$SNOWSQL_ACCOUNT" -u "$SNOWSQL_USER" -p "$SNOWSQL_PWD" -r "$SNOWSQL_ROLE" -w "$SNOWSQL_WAREHOUSE" -d demo_db -s demo -f "sql/salary_table.sql"
```

4) Run the VS Code task
   - In VS Code: `Terminal` → `Run Task...` → select `Run current SQL with SnowSQL (uses PROD env vars)`
   - The task executes the current active file using the environment variables.

Security notes
- Avoid committing passwords or keys into the repository.
- Prefer keypair auth for SnowSQL where possible.
- On developer machines, use OS-provided secret storage or CI secret managers to inject environment variables.

