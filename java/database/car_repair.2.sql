
START TRANSACTION;

DROP TABLE IF EXISTS user_details, vehicle, user_vehicle,  repair_items CASCADE;
	

CREATE TABLE user_details(
	user_id int,
	user_type varchar(20) NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(30) NOT NULL,
	email_address varchar(50),
	password varchar NOT NULL,
	phone_number varchar(12) NOT NULL,
	CONSTRAINT pk_user_details_user_id PRIMARY KEY (user_id)
	-- CONSTRAINT fk_user_details_user_user_id FOREIGN KEY (user_id) REFERENCES users (user_id)
);


CREATE TABLE vehicle (
	vehicle_id serial,
	vehicle_make varchar NOT NULL,
	vehicle_model varchar NOT NULL,
	vehicle_year smallint ,
	vehicle_color varchar,
	CONSTRAINT pk_vehicle_vehicle_id PRIMARY KEY (vehicle_id)
);
-- primary key below will attach to estimates table as FK (on vehicle ID)

CREATE TABLE user_vehicle (
	user_id int NOT NULL,
	vehicle_id int NOT NULL,
	CONSTRAINT pk_user_vehicle PRIMARY KEY (vehicle_id),
	CONSTRAINT FK_user_vehicle_user_details FOREIGN KEY (vehicle_id) REFERENCES user_details (user_id)

);
-- NOT loading test data into user_vehicle untill user_details table is populated



INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color)
VALUES ('Pontiac', 'Trans Am', 1982, 'Black');
INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color)
VALUES ('DMC', 'Delorean', 1981, 'Silver');
INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color)
VALUES ('Chevy', 'COE', 1941, 'Rust-bucket');



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




COMMIT;
--ROLLBACK;

SELECT * FROM user_details

