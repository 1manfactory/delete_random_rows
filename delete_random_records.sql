DELIMITER //
CREATE PROCEDURE `delete_random_rows`(
    IN `table_name` VARCHAR(255),
    IN `delete_fraction` FLOAT
)
BEGIN
    DECLARE backup_tbl_name VARCHAR(255);
    SET backup_tbl_name = CONCAT(table_name, '_org');
    
    -- drop backup table if exists
    SET @query = CONCAT('DROP TABLE IF EXISTS ', backup_tbl_name);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- create backup table
    SET @query = CONCAT('CREATE TABLE ', backup_tbl_name, ' LIKE ', table_name);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    -- insert rows into backup table
    SET @query = CONCAT('INSERT INTO ', backup_tbl_name, ' SELECT * FROM ', table_name);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    -- delete rows from original table
    SET @query = CONCAT('DELETE FROM ', table_name, ' WHERE RAND() <= ', delete_fraction);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END//
