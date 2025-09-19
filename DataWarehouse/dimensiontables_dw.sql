mysql> -- ===================================================== 
mysql> -- DATA WAREHOUSE STAR SCHEMA FOR TAILORING BUSINESS 
mysql> -- ===================================================== 
mysql> 
mysql> -- Create Data Warehouse Database 
mysql> CREATE DATABASE tailor_dw; 
ERROR 1007 (HY000): Can't create database 'tailor_dw'; database exists 
mysql> USE tailor_dw; 
Database changed 
mysql> 
mysql> -- ===================================================== 
mysql> -- DIMENSION TABLES 
mysql> -- ===================================================== 
mysql> 
mysql> -- Customer Dimension 
mysql> CREATE TABLE dim_customer ( 
-> customer_key INT AUTO_INCREMENT PRIMARY KEY, 
-> customer_id INT NOT NULL, 
-> customer_name VARCHAR(50), 
-> phone_number INT, 
-> address VARCHAR(50), 
-> location_area VARCHAR(20), -- Extracted from address for grouping 
-> UNIQUE KEY uk_customer (customer_id) 
-> ); 
Query OK, 0 rows affected (0.04 sec) 
mysql> 
mysql> -- Tailor Dimension 
mysql> CREATE TABLE dim_tailor ( 
-> tailor_key INT AUTO_INCREMENT PRIMARY KEY, 
-> tailor_id INT NOT NULL, 
-> tailor_name VARCHAR(50), 
-> phone_number INT, 
-> UNIQUE KEY uk_tailor (tailor_id) 
-> ); 
Query OK, 0 rows affected (0.03 sec) 
mysql> 
mysql> -- Garment Dimension 
mysql> CREATE TABLE dim_garment ( 
-> garment_key INT AUTO_INCREMENT PRIMARY KEY, 
-> garment_id INT NOT NULL, 

-> type_name VARCHAR(50), 
-> fabric_required VARCHAR(100), 
-> fabric_category VARCHAR(30), -- Main fabric type extracted 
-> UNIQUE KEY uk_garment (garment_id) 
-> ); 
Query OK, 0 rows affected (0.03 sec) 
mysql> 
mysql> -- Payment Dimension 
mysql> CREATE TABLE dim_payment ( 
-> payment_key INT AUTO_INCREMENT PRIMARY KEY, 
-> payment_id INT NOT NULL, 
-> payment_method VARCHAR(20), 
-> payment_category VARCHAR(15), -- Digital/Cash grouping 
-> UNIQUE KEY uk_payment (payment_id) 
-> ); 
Query OK, 0 rows affected (0.03 sec) 
mysql> 
mysql> -- Date Dimension 
mysql> CREATE TABLE dim_date ( 
-> date_key INT AUTO_INCREMENT PRIMARY KEY, 
-> full_date DATE, 
-> day_of_month INT, 
-> month_num INT, 
-> month_name VARCHAR(20), 
-> quarter INT, 
-> year INT, 
-> month_year VARCHAR(10), 
-> is_weekend BOOLEAN, 
-> UNIQUE KEY uk_date (full_date) 
-> ); 
Query OK, 0 rows affected (0.02 sec) 
mysql> 
mysql> -- Status Dimension 
mysql> CREATE TABLE dim_status ( 
-> status_key INT AUTO_INCREMENT PRIMARY KEY, 
-> status_name VARCHAR(20), 
-> status_category VARCHAR(15), -- Active/Inactive grouping 
-> UNIQUE KEY uk_status (status_name) 
-> ); 
Query OK, 0 rows affected (0.02 sec) 
mysql> 
