/*
===================================================================================
Stored Procedure: Load Bronze Layer(Source -> Bronze)
===================================================================================
Script Purpose:
  This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following actions:
  - Truncates the bronze tables before loading data.
  -Uses the 'BULK INSERT' commond to load data from CSV files to bronze tables.

Parameters:
  None.
  This stored procedure does not accept any parameters or reture any values.

Usage Example:
  EXCE bronze.load_bronze;
======================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME
	BEGIN TRY
		PRINT '==================================================='
		PRINT 'Loding Bronze Layer'
		PRINT '==================================================='
	
		PRINT '---------------------------------------------------'
		PRINT 'Loding CRM Tables'
		PRINT '---------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>> Trauncating Table: bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting Data Into: bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'G:\Placement\DBMS\sql-dwh-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Trauncating Table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data Into: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'G:\Placement\DBMS\sql-dwh-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Trauncating Table: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting Data Into: bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'G:\Placement\DBMS\sql-dwh-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Trauncating Table: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting Data Into: bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'G:\Placement\DBMS\sql-dwh-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------------------------------';

		PRINT '---------------------------------------------------'
		PRINT 'Loding ERP Tables'
		PRINT '---------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>> Trauncating Table: bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Inserting Data Into: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM 'G:\Placement\DBMS\sql-dwh-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Trauncating Table: bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting Data Into: bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'G:\Placement\DBMS\sql-dwh-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Trauncating Table: bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'G:\Placement\DBMS\sql-dwh-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'seconds';
		PRINT '>> --------------------------------------';
	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR(50));
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR(50));
		PRINT '=========================================='
	END CATCH
END
