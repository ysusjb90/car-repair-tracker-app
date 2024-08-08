SELECT * FROM estimates
SELECT * FROM user_detail ORDER BY user_id asc
SELECT * FROM vehicle
SELECT * FROM user_vehicle

--For Vehicle lookup tests:
START TRANSACTION;







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
    (5, 7, '2024-07-15', 1, '2024-08-01', true, false, true),
    (2, 5, '2024-06-20', 2, '2024-07-10', false, true, false),
    (8, 3, '2024-07-01', 3, '2024-08-05', true, true, true),
    (2, 8, '2024-05-15', 4, '2024-06-25', false, false, false),
    (4, 1, '2024-08-01', 5, '2024-08-15', true, false, true);

COMMIT;

ROLLBACK;


SELECT * FROM vehicle v INNER JOIN user_vehicle uv 
ON v.vehicle_id = uv.vehicle_id
WHERE uv.user_id = 10;






















-- test to redo VEHICLE---------------------------------------------------------------
START TRANSACTION;

DROP TABLE IF EXISTS vehicle CASCADE;

CREATE TABLE vehicle (
	vehicle_id serial,
	vehicle_make varchar NOT NULL,
	vehicle_model varchar NOT NULL,
	vehicle_year smallint ,
	vehicle_color varchar,
	isactive boolean,
	CONSTRAINT pk_vehicle_vehicle_id PRIMARY KEY (vehicle_id)
	);
	
INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color, isactive)
VALUES
('DMC', 'Delorean', 1981, 'Silver', true),
('Pontiac', 'Trans Am', 1982, 'Black', true),
 ('Chevy', 'COE', 1941, 'Rust-bucket', true),
('Ford', 'F-150', 2010, 'Red', true),
('Chevrolet', 'Silverado', 2011, 'Blue', true),
('Toyota', 'Camry', 2012, 'Green', true),
('Honda', 'Civic', 2013, 'Black', true),
('Nissan', 'Rogue', 2014, 'White', true),
('Ram', 'Pickup', 2015, 'Silver', true),
('Honda', 'CR-V', 2016, 'Yellow', true),
('Toyota', 'Corolla', 2017, 'Gray', true),
('Chevrolet', 'Equinox', 2018, 'Brown', true),
('Ford', 'Escape', 2019, 'Orange', true);

COMMIT;

ROLLBACK;


START TRANSACTION;
INSERT INTO user_detail (user_id, user_type, first_name, last_name, email_address, phone_number)
VALUES
(10,'admin', 'Patrick', 'Stewart', 'Capta@nextgen.cmm', '201-555-1000'),
(11,'employee', 'Jonathan', 'Frakes', 'Comma@nextgen.cmm', '201-555-1001'),
(12,'employee', 'Brent', 'Spiner', 'Lieut@nextgen.cmm', '201-555-1002'),
(13,'user', 'LeVar', 'Burton', 'Lt. C@nextgen.cmm', '201-555-1003'),
(14,'user', 'Marina', 'Sirtis', 'Couns@nextgen.cmm', '201-555-1004'),
(15,'user', 'Michael', 'Dorn', 'Lt. W@nextgen.cmm', '201-555-1005'),
(16,'user', 'Gates', 'McFadden', 'Dr. B@nextgen.cmm', '201-555-1006'),
(17,'user', 'Wil', 'Wheaton', 'Wesle@nextgen.cmm', '201-555-1007'),
(18,'user', 'Denise', 'Crosby', 'Lt. T@nextgen.cmm', '201-555-1008'),
(19,'user', 'Majel', 'Barrett', 'Lwaxa@nextgen.cmm', '201-555-1009');
-- round 2 below
START TRANSACTION;
INSERT INTO user_detail (user_id, user_type, first_name, last_name, email_address, phone_number)
VALUES
(1,'admin','Stewie', 'Stewart', 'Capta@nextgen.cmm', '201-555-1000'),
(2,'employee','Johnny', 'Frakes', 'Comma@nextgen.cmm', '201-555-1001'),
(5,'employee', 'BruHa', 'Spiner', 'Lieut@nextgen.cmm', '201-555-1002'),
(6,'user', 'Burtr', 'Burton', 'Lt. C@nextgen.cmm', '201-555-1003'),
(7,'user', 'Maris', 'Sirtis', 'Couns@nextgen.cmm', '201-555-1004'),
(8,'user', 'Mikl', 'Dorn', 'Lt. W@nextgen.cmm', '201-555-1005'),
(9,'user', 'Gattois', 'McFadden', 'Dr. B@nextgen.cmm', '201-555-1006'),
(20,'user', 'Willliam', 'Wheaton', 'Wesle@nextgen.cmm', '201-555-1007'),
(21,'user', 'Deenny', 'Crosby', 'Lt. T@nextgen.cmm', '201-555-1008'),
(22,'user', 'Marjorie', 'Barrett', 'Lwaxa@nextgen.cmm', '201-555-1009');


COMMIT;

ROLLBACK;

START TRANSACTION;

INSERT INTO user_vehicle (user_id, vehicle_id)
VALUES
	(10,1),
	(10,2),
	(10,3),
	(11,4),
	(11,5),
	(16,6),
	(17,7),
	(18,8),
	(12,9),
	(14,10);

	
COMMIT;

