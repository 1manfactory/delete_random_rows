# MySQL Stored Procedure for Deleting Random Records from a Table

This stored procedure is designed to delete a random set of records from a specified table in a MySQL database. It takes two parameters as input: the name of the table to delete records from, and a real number between 0 and 1 that represents the proportion of records to be deleted. The stored procedure first backs up the original table by creating a new table with the same name and a "_org" suffix. Then it deletes the specified proportion of records from the original table.

## Prerequisites

To use this stored procedure, you will need:

- A MySQL database server with version 5.5 or higher
- Sufficient permissions to create stored procedures and tables in the database

## Usage

To use this stored procedure, follow these steps:

1. Open a MySQL client, such as the mysql command-line tool or MySQL Workbench.
2. Connect to the MySQL database server where you want to create the stored procedure.
3. Create the stored procedure by copying and pasting the SQL code from the "delete_random_records.sql" file in this repository.
4. Call the stored procedure by executing the following SQL command:

   ```sql
   CALL delete_random_records('table_name', 0.5);
   ```

   Replace "table_name" with the name of the table you want to delete records from, and 0.5 with the proportion of records you want to delete. This example deletes 50% of the records in the table.

## Notes

- This stored procedure does not check if the specified table exists before trying to delete records from it. Make sure the table name is spelled correctly and that it exists in the database before calling the stored procedure.
- The stored procedure will create a new table with the same name and a "_org" suffix to backup the original table. If a table with that name already exists, it will be dropped and replaced with the new backup table.
- The stored procedure uses the RAND() function to select random records for deletion. This function is not truly random, so the distribution of deleted records may not be perfectly even across the table. However, it should be sufficiently random for most purposes.
