START TRANSACTION;

DROP TABLE IF EXISTS user_detail, vehicle, user_vehicle,  repair_items, estimates,  estimate_repairs, recall_items, make_model CASCADE;
	
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

CREATE TABLE make_model(
	make varchar,
	model varchar,
	CONSTRAINT PK_make_model_make PRIMARY KEY (model)
);

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
	
COMMIT;


