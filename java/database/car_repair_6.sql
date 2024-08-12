-- This script creates all tables and then loads them with test information.
START TRANSACTION;

DROP TABLE IF EXISTS user_detail, vehicle, repair_items, estimates, estimate_repairs, recall_items, make_model CASCADE;

CREATE TABLE user_detail(
	user_id int, -- must be loaded with same user_id as index in users table - not a serial
	user_type varchar(20) NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(30) NOT NULL,
	email_address varchar(50),
	phone_number varchar(12) NOT NULL,
	CONSTRAINT pk_user_detail_user_id PRIMARY KEY (user_id)
	-- CONSTRAINT fk_user_detail_user_user_id FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE vehicle (
	vehicle_id serial,
	user_id int,
	vehicle_make varchar NOT NULL,
	vehicle_model varchar NOT NULL,
	vehicle_year smallint ,
	vehicle_color varchar,
	CONSTRAINT pk_vehicle_vehicle_id PRIMARY KEY (vehicle_id)
	);
	
CREATE TABLE repair_items(
	repair_item_id serial,
	description varchar NOT NULL,
	parts_cost int NOT NULL,
	labor_cost int,
	flat_rate_hours int,
	isSuperseded boolean,
	CONSTRAINT PK_repair_Items PRIMARY KEY (repair_item_id)
);

CREATE TABLE estimates(
	estimate_id serial,
	user_id int,
	vehicle_id int,
	description_of_problem varchar,
	date_created DATE,
	total_cost int,
	recall_id int,
	promised_completion_date DATE,
	approved_by_customer boolean,
	job_complete boolean,
	is_paid boolean,
	CONSTRAINT PK_estimates PRIMARY KEY (estimate_id),
	CONSTRAINT FK_estimates_user_detail FOREIGN KEY (user_id) REFERENCES user_detail (user_id),
	CONSTRAINT FK_estimates_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicle (vehicle_id)
);
	
CREATE TABLE estimate_repairs(
	estimate_id int,
	repair_item_id int,
	recall_id int,
	item_complete boolean,
	repair_notes varchar,
	is_approved boolean,
	CONSTRAINT PK_estimate_repairs PRIMARY KEY (estimate_id),
	CONSTRAINT FK_estimate_repairs_repair_items FOREIGN KEY (repair_item_id) REFERENCES repair_items (repair_item_id)
);


CREATE TABLE recall_items(
	recall_id int,
	description varchar,
	severity varchar,
	parts_cost int,
	labor_cost int,
	flat_rate_hours int,
	is_reimbursable boolean,
	CONSTRAINT PK_recall_items PRIMARY KEY (recall_id)
);

CREATE TABLE make_model(
	make varchar,
	model varchar,
	CONSTRAINT PK_make_model_make PRIMARY KEY (model)
);

--- NOW load all tables with test data  ----


INSERT INTO user_detail (user_id, user_type, first_name, last_name, email_address, phone_number)
VALUES
(1,'user', 'Jonathan', 'Frakes', 'Comma@nextgen.cmm', '201-555-1001'),
(2,'admin', 'Patrick', 'Stewart', 'Capta@nextgen.cmm', '201-555-1000'),
(13,'employee', 'Brent', 'Spiner', 'Lieut@nextgen.cmm', '201-555-1002'),
(14,'user', 'LeVar', 'Burton', 'Lt. C@nextgen.cmm', '201-555-1003'),
(15,'user', 'Marina', 'Sirtis', 'Couns@nextgen.cmm', '201-555-1004'),
(16,'user', 'Michael', 'Dorn', 'Lt. W@nextgen.cmm', '201-555-1005'),
(17,'user', 'Gates', 'McFadden', 'Dr. B@nextgen.cmm', '201-555-1006'),
(18,'user', 'Wil', 'Wheaton', 'Wesle@nextgen.cmm', '201-555-1007'),
(19,'user', 'Denise', 'Crosby', 'Lt. T@nextgen.cmm', '201-555-1008'),
(20,'user', 'Willliam', 'Wheaton', 'Wesle@nextgen.cmm', '201-555-1007');


INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  
VALUES 
	('Oil Change', 30, 30, 5,'false'),
	('Brake Pad Replacement', 100, 150, 20,'false'),
	 ('Battery Replacement', 150, 50, 50,'false'),
	 ('Spark Plug Replacement', 50, 100, 15,'false'),
	 ('Tire Replacement', 120, 80, 10,'false'),
	 ('Transmission Fluid Change', 80, 100, 15,'false'),
	 ('Air Filter Replacement', 20, 20, 5,'false'),
	 ('Alternator Replacement', 300, 150, 30,'false'),
	 ('Radiator Replacement', 200, 150, 25,'false'),
	 ('Timing Belt Replacement', 200, 400, 50,'false'),
	 ('Brake Rotor Replacement', 150, 200, 25,'false'),
	 ('Wheel Alignment', 80, 100, 15,'false'),
	 ('Fuel Filter Replacement', 30, 50, 10,'false'),
	 ('Exhaust Repair', 120, 200, 25,'false'),
	 ('Headlight Replacement', 30, 50, 5,'false'),
	 ('Windshield Wiper Replacement', 20, 10, 2,'false'),
	 ('Oxygen Sensor Replacement', 100, 100, 15,'false'),
	 ('Serpentine Belt Replacement', 60, 100, 15,'false'),
	 ('Fuel Pump Replacement', 250, 400, 40,'false'),
	 ('Power Steering Fluid Change', 15, 60, 5,'false'),
	 ('Cabin Air Filter Replacement', 15, 40, 5,'false'),
	 ('Coolant Flush', 100, 150, 20,'false'),
	 ('Thermostat Replacement', 60, 100, 20,'false'),
	 ('Starter Replacement', 250, 300, 30,'false');




INSERT INTO vehicle (user_id, vehicle_make, vehicle_model, vehicle_year, vehicle_color)
VALUES
	(2,'DMC', 'Delorean', 1981, 'Silver'),
	(1,'Pontiac', 'Trans Am', 1982, 'Black'),
	(13,'Chevy', 'COE', 1941, 'Rust-bucket'),
	(14,'Ford', 'F-150', 2010, 'Red'),
	(14,'Chevrolet', 'Silverado', 2011, 'Blue'),
	(14,'Toyota', 'Camry', 2012, 'Green'),
	(15,'Honda', 'Civic', 2013, 'Black'),
	(16,'Nissan', 'Rogue', 2014, 'White'),
	(17,'Ram', 'Pickup', 2015, 'Silver'),
	(18,'Honda', 'CR-V', 2016, 'Yellow'),
	(19,'Toyota', 'Corolla', 2017, 'Gray'),
	(20,'Chevrolet', 'Equinox', 2018, 'Brown'),
	(20,'Ford', 'Escape', 2019, 'Orange');


INSERT INTO make_model (make, model) VALUES
	('Honda', 'Civic'),
	('Honda', 'Accord'),
	('Honda', 'CR-V'),
	('Honda', 'Pilot'),
	('Honda', 'Odyssey'),
	('Honda', 'Ridgeline'),
	('Honda', 'Crosstour'),
	('Honda', 'Fit'),
	('Honda', 'HR-V'),
	('Honda', 'Insight'),
	('Ford', 'F-150'),
	('Ford', 'Mustang'),
	( 'Ford', 'Explorer'),
	( 'Ford', 'Escape'),
	('Ford', 'Focus'),
	('Ford', 'Edge'),
	('Ford', 'Fusion'),
	('Ford', 'Ranger'),
	('Ford', 'Expedition'),
	('Ford', 'Bronco'),
	('Chevy', 'Silverado'),
	('Chevy', 'Camaro'),
	('Chevy', 'Equinox'),
	('Chevy', 'Tahoe'),
	('Chevy', 'Malibu'),
	('Chevy', 'Traverse'),
	('Chevy', 'Impala'),
	('Chevy', 'Colorado'),
	('Chevy', 'Suburban'),
	('Chevy', 'Corvette'),
	('Jeep', 'Wrangler'),
	('Jeep', 'Grand Cherokee'),
	('Jeep', 'Cherokee'),
	('Jeep', 'Compass'),
	('Jeep', 'Renegade'),
	('Jeep', 'Gladiator'),
	('Jeep', 'Liberty'),
	('Jeep', 'Commander'),
	('Jeep', 'Patriot'),
	('Jeep', 'Wagoneer'),
	('Acura', 'MDX'),
	('Acura', 'TLX'),
	('Acura', 'RDX'),
	('Acura', 'ILX'),
	('Acura', 'RLX'),
	('Acura', 'NSX'),
	('Acura', 'CL'),
	('Acura', 'RSX'),
	('Acura', 'SLX'),
	('Acura', 'ZDX'),
	('Buick', 'Encore'),
	('Buick', 'Enclave'),
	('Buick', 'Regal'),
	(('Buick'), 'LaCrosse'),
	(('Buick'), 'Verano'),
	(('Buick'), 'Cascada'),
	(('Buick'), 'Envision'),
	(('Buick'), 'Century'),
	(('Buick'), 'Riviera'),
	(('Buick'), 'Skylark'),
	('Mercedes', 'C-Class'),
	(('Mercedes'), 'E-Class'),
	(('Mercedes'), 'S-Class'),
	(( 'Mercedes'), 'A-Class'),
	(( 'Mercedes'), 'GLC'),
	(('Mercedes'), 'GLE'),
	(('Mercedes'), 'GLA'),
	(('Mercedes'), 'CLA'),
	(( 'Mercedes'), 'GLS'),
	(('Mercedes'), 'SL'),
	('BMW', '3 Series'),
	(('BMW'), '5 Series'),
	(( 'BMW'), '7 Series'),
	(( 'BMW'), 'X3'),
	(( 'BMW'), 'X5'),
	(( 'BMW'), 'X7'),
	(('BMW'), 'i3'),
	(( 'BMW'), 'i8'),
	(( 'BMW'), 'M3'),
	(('BMW'), 'M5'),
	('Lexus', 'ES'),
	(('Lexus'), 'RX'),
	(('Lexus'), 'NX'),
	(('Lexus'), 'IS'),
	(('Lexus'), 'LS'),
	(('Lexus'), 'GX'),
	(( 'Lexus'), 'LC'),
	(( 'Lexus'), 'RC'),
	(( 'Lexus'), 'LX'),
	(( 'Lexus'), 'UX'),
	('Toyota', 'Camry'),
	(('Toyota'), 'Corolla'),
	(('Toyota'), 'RAV4'),
	(('Toyota'), 'Highlander'),
	(('Toyota'), 'Sienna'),
	(('Toyota'), 'Tacoma'),
	(('Toyota'), 'Tundra'),
	(('Toyota'), '4Runner'),
	(('Toyota'), 'Prius'),
	(('Toyota'), 'Supra')
;

INSERT INTO estimates (user_id, vehicle_id, date_created, recall_id,
                       promised_completion_date, total_cost, approved_by_customer,
                       job_complete, is_paid)
VALUES
    (2, 2, '2024-08-07', 0, '2024-08-10',0, false, false, false),
    (15, 7, '2024-07-15', 1, '2024-08-01',0, false, false, false),
    (13, 5, '2024-06-20', 2, '2024-07-10',0, false, false, false),
    (18, 3, '2024-07-01', 3, '2024-08-05',0, false, false, false),
    (2, 2, '2024-05-15', 4, '2024-06-25',0, false, false, false),
    (1, 1, '2024-08-01', 5, '2024-08-15',0, false, false, true),
	(14, 3, '2024-08-07', 0, '2024-08-10',0, false, false, false);
	

COMMIT;




