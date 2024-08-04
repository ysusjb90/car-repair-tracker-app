
START TRANSACTION;

DROP TABLE IF EXISTS users, user_details, vehicle, user_vehicle,  repair_items CASCADE;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id));
	

CREATE TABLE user_details(
	user_id int NOT NULL,
	user_type varchar(20) NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(30) NOT NULL,
	email_address varchar(50) NOT NULL,
	password varchar NOT NULL,
	phone_number varchar(12),
	CONSTRAINT pk_user_details_user_id PRIMARY KEY (user_id),
	CONSTRAINT fk_user_details_user_user_id FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- note that group is a reserved word
CREATE TABLE vehicle (
	vehicle_id serial,
	vehicle_make varchar NOT NULL,
	vehicle_model varchar NOT NULL,
	vehicle_year smallint NOT NULL,
	vehicle_color varchar,
	CONSTRAINT pk_vehicle_vehicle_id PRIMARY KEY (vehicle_id)
);

CREATE TABLE user_vehicle (
	user_id int NOT NULL,
	vehicle_id int NOT NULL,
	CONSTRAINT pk_user_vehicle_user_id_vehicle_id PRIMARY KEY (user_id, vehicle_id),
	CONSTRAINT fk_user_vehicle_users_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk_user_vehicle_vehicle_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


INSERT INTO users(
	username,
	password_hash,
	role)
	
VALUES ('nightkitt',
	   '9audfijeuha98sduf',
	   'ROLE_EMPLOYEE'),
	   ('88N55',
	   'KADSFHHVJHDJFAP8',
	   'ROLE_USER'),
	   ('Eye4eye',
	   'AOSDIVJ88AUYF0AHhaosdhf',
	   'ROLE_USER');



INSERT INTO user_details (
	user_id,
	user_type,
	email_address,
	password,
	phone_number,
	first_name,
	last_name)
VALUES ( 
	(SELECT user_id FROM users WHERE username = 'nightkitt'),
		'employee',
	   'kitt_the_bucket@kr.com',
	   '1234',
	   999999999,
	   'Michael',
	   'Knight'), 
	   ((SELECT user_id FROM users WHERE username = '88N55'),
		'customer',
	   'Back_from_future@88.com',
	   '1234',
	   2223334444,
	   'Jean de',
	   'Lorean'),
	   (
		(SELECT user_id FROM users WHERE username = 'Eye4eye'),
		'customer',
	   'luv_your_peepers@gmail.com',
	   '1234',
	   '444444444',
	   'Jee',
	   'Percreeper');

INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color)
VALUES ('Pontiac', 'Trans Am', 1982, 'Black');
INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color)
VALUES ('DMC', 'Delorean', 1981, 'Silver');
INSERT INTO vehicle (vehicle_make, vehicle_model, vehicle_year, vehicle_color)
VALUES ('Chevy', 'COE', 1941, 'Rust-bucket');

INSERT INTO user_vehicle (user_id, vehicle_id) 
	VALUES 
	((SELECT user_id FROM users WHERE username = 'nightkitt'), (SELECT vehicle_id FROM vehicle WHERE vehicle_model = 'Trans Am')),
	((SELECT user_id FROM users WHERE username = '88N55'), (SELECT vehicle_id FROM vehicle WHERE vehicle_model = 'Delorean')),
	((SELECT user_id FROM users WHERE username = 'Eye4eye'), (SELECT vehicle_id FROM vehicle WHERE vehicle_model = 'COE'));

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

