SELECT * FROM estimates
SELECT * FROM user_detail



START TRANSACTION;
--INSERT INTO estimates (user_id, vehicle_id, date_created, recall_id, 
--					   promised_completion_date, approved_by_customer, 
--					   job_complete, is_paid) 
--VALUES (4,3,'2024-08-07',0,'2024-08-10',false,false,false);

INSERT INTO estimates (user_id, vehicle_id, date_created, recall_id, 
					   promised_completion_date, approved_by_customer, 
					   job_complete, is_paid) 
VALUES (4,2,'2024-08-07',0,'2024-08-10',false,false,false);

INSERT INTO estimates (user_id, vehicle_id, date_created, recall_id, 
					   promised_completion_date, approved_by_customer, 
					   job_complete, is_paid) 
VALUES (4,1,'2024-08-07',0,'2024-08-10',false,false,false);



COMMIT;
ROLLBACK;
