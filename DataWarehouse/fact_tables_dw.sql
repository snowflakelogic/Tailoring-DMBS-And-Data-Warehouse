mysql> -- ===================================================== 
mysql> -- FACT TABLE 
mysql> -- ===================================================== 
mysql> 
mysql> -- Orders Fact Table 
mysql> CREATE TABLE fact_orders ( 
-> order_key INT AUTO_INCREMENT PRIMARY KEY, 
-> order_id INT NOT NULL, 
-> 
-> -- Foreign Keys to Dimensions 
-> customer_key INT, 
-> tailor_key INT, 
-> garment_key INT, 
-> payment_key INT, 
-> deadline_date_key INT, 
-> status_key INT, 
-> 
-> -- Measures 
-> price_amount DECIMAL(10,2), 
-> 
-> -- Additional metrics for analysis 
-> is_completed BOOLEAN, 
-> is_overdue BOOLEAN, 
-> days_to_deadline INT, 
-> 
-> -- Foreign Key Constraints 
-> FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key), 
-> FOREIGN KEY (tailor_key) REFERENCES dim_tailor(tailor_key), 
-> FOREIGN KEY (garment_key) REFERENCES dim_garment(garment_key), 
-> FOREIGN KEY (payment_key) REFERENCES dim_payment(payment_key), 
-> FOREIGN KEY (deadline_date_key) REFERENCES dim_date(date_key), 
-> FOREIGN KEY (status_key) REFERENCES dim_status(status_key), 
-> 
-> INDEX idx_order_id (order_id), 
-> INDEX idx_customer_key (customer_key), 
-> INDEX idx_tailor_key (tailor_key), 
-> INDEX idx_date_key (deadline_date_key), 
-> INDEX idx_status_key (status_key) 
-> ); 
Query OK, 0 rows affected (0.07 sec) 
mysql> 
