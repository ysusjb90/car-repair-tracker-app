SELECT * FROM estimates
SELECT * FROM user_detail
SELECT * FROM vehicle



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

INSERT INTO user_detail (user_id, user_type, first_name, last_name, email_address, phone_number) 
VALUES (



);

START TRANSACTION;
INSERT INTO estimates (user_id, vehicle_id, date_created, recall_id, 
                       promised_completion_date, approved_by_customer, 
                       job_complete, is_paid) 
VALUES 
    (4, 2, '2024-08-07', 0, '2024-08-10', false, false, false),
    (15, 7, '2024-07-15', 1, '2024-08-01', true, false, true),
    (12, 5, '2024-06-20', 2, '2024-07-10', false, true, false),
    (18, 3, '2024-07-01', 3, '2024-08-05', true, true, true),
    (20, 8, '2024-05-15', 4, '2024-06-25', false, false, false),
    (14, 1, '2024-08-01', 5, '2024-08-15', true, false, true);

COMMIT;

ROLLBACK;