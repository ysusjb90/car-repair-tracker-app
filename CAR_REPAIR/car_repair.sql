
START TRANSACTION;

DROP TABLE IF EXISTS user_details, vehicle, user_vehicle CASCADE;

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


COMMIT;