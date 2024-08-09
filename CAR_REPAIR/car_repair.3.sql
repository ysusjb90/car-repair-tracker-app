START TRANSACTION;

DROP TABLE IF EXISTS user_detail, vehicle, user_vehicle,  repair_items, estimates,  estimate_repairs, recall_items CASCADE;
	
-- below was formerly user_details  -plural; also PW removed as its hash is captured in table users
CREATE TABLE user_detail(
	user_id int, -- must be loaded with same user_id as index in users table
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
	vehicle_make varchar NOT NULL,
	vehicle_model varchar NOT NULL,
	vehicle_year smallint ,
	vehicle_color varchar,
	isActive boolean,
	CONSTRAINT pk_vehicle_vehicle_id PRIMARY KEY (vehicle_id)
);
-- primary key below will attach to estimates table as FK (on vehicle ID)


CREATE TABLE user_vehicle (
	user_id int NOT NULL,
	vehicle_id int NOT NULL,
	CONSTRAINT pk_user_vehicle PRIMARY KEY (user_id),
	CONSTRAINT FK_user_vehicle_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicle (vehicle_id)
);
-- in above, corrected FK; primary is userId back to user-detail; FK is Vehicle_id



INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color, isActive)
VALUES ('Pontiac', 'Trans Am', 1982, 'Black', true);
INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color, isActive)
VALUES ('DMC', 'Delorean', 1981, 'Silver', true);
INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color, isActive)
VALUES ('Chevy', 'COE', 1941, 'Rust-bucket', true);



CREATE TABLE repair_items(
	repair_item_id serial,
	description varchar NOT NULL,
	parts_cost int NOT NULL,
	labor_cost int,
	flat_rate_hours int,
	isSuperseded boolean,
	CONSTRAINT PK_repair_Items PRIMARY KEY (repair_item_id)
);

INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Oil Change', 30, 30, 5,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Brake Pad Replacement', 100, 150, 20,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Battery Replacement', 150, 50, 50,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Spark Plug Replacement', 50, 100, 15,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Tire Replacement', 120, 80, 10,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Transmission Fluid Change', 80, 100, 15,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Air Filter Replacement', 20, 20, 5,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Alternator Replacement', 300, 150, 30,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Radiator Replacement', 200, 150, 25,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Timing Belt Replacement', 200, 400, 50,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Brake Rotor Replacement', 150, 200, 25,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Wheel Alignment', 80, 100, 15,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Fuel Filter Replacement', 30, 50, 10,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Exhaust Repair', 120, 200, 25,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Headlight Replacement', 30, 50, 5,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Windshield Wiper Replacement', 20, 10, 2,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Oxygen Sensor Replacement', 100, 100, 15,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Serpentine Belt Replacement', 60, 100, 15,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Fuel Pump Replacement', 250, 400, 40,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Power Steering Fluid Change', 15, 60, 5,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Cabin Air Filter Replacement', 15, 40, 5,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Coolant Flush', 100, 150, 20,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Thermostat Replacement', 60, 100, 20,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Starter Replacement', 250, 300, 30,'false');
INSERT INTO repair_items (description, parts_cost, labor_cost, flat_rate_hours, isSuperseded)  VALUES ('Water Pump Replacement', 150, 200, 35,'false');

CREATE TABLE estimates(
	estimate_id serial,
	user_id int,
	vehicle_id int,
	description_of_problem varchar,
	date_created DATE, 
	recall_id int,
	promised_completion_date DATE, 
	approved_by_customer boolean,
	job_complete boolean,
	is_paid boolean,
	CONSTRAINT PK_estimates PRIMARY KEY (estimate_id),
	CONSTRAINT FK_estimates_user_detail FOREIGN KEY (user_id) REFERENCES user_detail (user_id),
	CONSTRAINT FK_estimates_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicle (vehicle_id)
);
	 -- note DATE takes string in YYYY-MM-DD format

-- estimate_id below must match same in estimates table
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

INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color, isActive)
VALUES 
	('Honda', 'Civic', 2022, 'Black', true),
	('Honda', 'Accord', 2022, 'Silver', true),
	('Honda', 'CR-V', 2022, 'Red', true),
	('Honda', 'Pilot', 2022, 'Blue', true),
	('Honda', 'Odyssey', 2022, 'White', true),
	('Honda', 'Ridgeline', 2022, 'Gray', true),
	('Honda', 'Crosstour', 2022, 'Green', true),
	('Honda', 'Fit', 2022, 'Yellow', true),
	('Honda', 'HR-V', 2022, 'Orange', true),
	('Honda', 'Insight', 2022, 'Purple', true),
	('Ford', 'F-150', 2022, 'Black', true),
	('Ford', 'Mustang', 2022, 'Silver', true),
	('Ford', 'Explorer', 2022, 'Red', true),
	('Ford', 'Escape', 2022, 'Blue', true),
	('Ford', 'Focus', 2022, 'White', true),
	('Ford', 'Edge', 2022, 'Gray', true),
	('Ford', 'Fusion', 2022, 'Green', true),
	('Ford', 'Ranger', 2022, 'Yellow', true),
	('Ford', 'Expedition', 2022, 'Orange', true),
	('Ford', 'Bronco', 2022, 'Purple', true),
	('Chevy', 'Silverado', 2022, 'Black', true),
	('Chevy', 'Camaro', 2022, 'Silver', true),
	('Chevy', 'Equinox', 2022, 'Red', true),
	('Chevy', 'Tahoe', 2022, 'Blue', true),
	('Chevy', 'Malibu', 2022, 'White', true),
	('Chevy', 'Traverse', 2022, 'Gray', true),
	('Chevy', 'Impala', 2022, 'Green', true),
	('Chevy', 'Colorado', 2022, 'Yellow', true),
	('Chevy', 'Suburban', 2022, 'Orange', true),
	('Chevy', 'Corvette', 2022, 'Purple', true),
	('Jeep', 'Wrangler', 2022, 'Black', true),
	('Jeep', 'Grand Cherokee', 2022, 'Silver', true),
	('Jeep', 'Cherokee', 2022, 'Red', true),
	('Jeep', 'Compass', 2022, 'Blue', true),
	('Jeep', 'Renegade', 2022, 'White', true),
	('Jeep', 'Gladiator', 2022, 'Gray', true),
	('Jeep', 'Liberty', 2022, 'Green', true),
	('Jeep', 'Commander', 2022, 'Yellow', true),
	('Jeep', 'Patriot', 2022, 'Orange', true),
	('Jeep', 'Wagoneer', 2022, 'Purple', true),
	('Acura', 'TLX', 2022, 'Black', true),
	('Acura', 'MDX', 2022, 'Silver', true),
	('Acura', 'RDX', 2022, 'Red', true),
	('Acura', 'ILX', 2022, 'Blue', true),
	('Acura', 'RLX', 2022, 'White', true),
	('Acura', 'NSX', 2022, 'Gray', true),
	('Acura', 'CL', 2022, 'Green', true),
	('Acura', 'RSX', 2022, 'Yellow', true),
	('Acura', 'SLX', 2022, 'Orange', true),
	('Acura', 'ZDX', 2022, 'Purple', true),
	('Buick', 'Encore', 2022, 'Black', true),
	('Buick', 'Enclave', 2022, 'Silver', true),
	('Buick', 'Regal', 2022, 'Red', true),
	('Buick', 'LaCrosse', 2022, 'Blue', true),
	('Buick', 'Verano', 2022, 'White', true),
	('Buick', 'Cascada', 2022, 'Gray', true),
	('Buick', 'Envision', 2022, 'Green', true),
	('Buick', 'Century', 2022, 'Yellow', true),
	('Buick', 'Riviera', 2022, 'Orange', true),
	('Buick', 'Skylark', 2022, 'Purple', true),
	('Mercedes', 'C-Class', 2022, 'Black', true),
	('Mercedes', 'E-Class', 2022, 'Silver', true),
	('Mercedes', 'S-Class', 2022, 'Red', true),
	('Mercedes', 'A-Class', 2022, 'Blue', true),
	('Mercedes', 'GLC', 2022, 'White', true),
	('Mercedes', 'GLE', 2022, 'Gray', true),
	('Mercedes', 'GLA', 2022, 'Green', true),
	('Mercedes', 'CLA', 2022, 'Yellow', true),
	('Mercedes', 'GLS', 2022, 'Orange', true),
	('Mercedes', 'SL', 2022, 'Purple', true),
	('BMW', '3 Series', 2022, 'Black', true),
	('BMW', '5 Series', 2022, 'Silver', true),
	('BMW', '7 Series', 2022, 'Red', true),
	('BMW', 'X3', 2022, 'Blue', true),
	('BMW', 'X5', 2022, 'White', true),
	('BMW', 'X7', 2022, 'Gray', true),
	('BMW', 'i3', 2022, 'Green', true),
	('BMW', 'i8', 2022, 'Yellow', true),
	('BMW', 'M3', 2022, 'Orange', true),
	('BMW', 'M5', 2022, 'Purple', true),
	('Lexus', 'ES', 2022, 'Black', true),
	('Lexus', 'RX', 2022, 'Silver', true),
	('Lexus', 'NX', 2022, 'Red', true),
	('Lexus', 'IS', 2022, 'Blue', true),
	('Lexus', 'LS', 2022, 'White', true),
	('Lexus', 'GX', 2022, 'Gray', true),
	('Lexus', 'LC', 2022, 'Green', true),
	('Lexus', 'RC', 2022, 'Yellow', true),
	('Lexus', 'LX', 2022, 'Orange', true),
	('Lexus', 'UX', 2022, 'Purple', true),
	('Toyota', 'Camry', 2022, 'Black', true),
	('Toyota', 'Corolla', 2022, 'Silver', true),
	('Toyota', 'RAV4', 2022, 'Red', true),
	('Toyota', 'Highlander', 2022, 'Blue', true),
	('Toyota', 'Sienna', 2022, 'White', true),
	('Toyota', 'Tacoma', 2022, 'Gray', true),
	('Toyota', 'Tundra', 2022, 'Green', true),
	('Toyota', '4Runner', 2022, 'Yellow', true),
	('Toyota', 'Prius', 2022, 'Orange', true),
	('Toyota', 'Supra', 2022, 'Purple', true);
	
COMMIT;



