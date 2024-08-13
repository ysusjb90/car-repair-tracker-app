-- this is just a scratch pad for sql stuff

SELECT * FROM estimates
SELECT * FROM user_detail ORDER BY user_id asc
SELECT * FROM vehicle
SELECT * FROM work_order_items
SELECT * FROM users
SELECT * FROM repair_items
SELECT * FROM user_detail 


For Later:

--- pull all user data
SELECT * FROM user_detail ud  LEFT JOIN users u 
ON ud.user_id = u.user_id 

-- pull vehicle data by user & user detail
SELECT * FROM vehicle v
	INNER JOIN user_detail ud
		ON v.user_id = ud.user_id 
	INNER JOIN users u
		ON ud.user_id = u.user_id
ORDER BY u.user_id;
		
-- pull estimate data
SELECT * FROM estimates

DELETE FROM user_detail WHERE user_id > 13;

INSERT INTO user_detail (user_id, user_type, first_name, last_name, email_address, phone_number)
VALUES

(1,'user', 'Deenny', 'Crosby', 'Lt. T@nextgen.cmm', '201-555-1008'),
(2,'user', 'Marjorie', 'Barrett', 'Lwaxa@nextgen.cmm', '201-555-1009'),

-- Need to test out the estimate backend; create some test data:  Will add itms
-- into two different estimates and test the sum functions

--invice No. 9; user Id 2; vehicle 15
--invoice NO. 3; userId 13; vechicle 5




START TRANSACTION;
DROP TABLE IF EXISTS user_detail CASCADE;


CREATE TABLE estimate_repairs(
	line_item_id serial,
	estimate_id int,
	repair_item_id int,
	recall_id int,
	item_complete boolean,
	repair_notes varchar,
	is_approved boolean,
	CONSTRAINT PK_estimate_repairs PRIMARY KEY (line_item_id),
	CONSTRAINT FK_estimate_repairs_repair_items FOREIGN KEY (repair_item_id) REFERENCES repair_items (repair_item_id),
	CONSTRAINT FK_estimate_repairs_estimates FOREIGN KEY (estimate_id) REFERENCES estimates (estimate_id)
-- first FK ties each line item to its description and cost held in repair-items
-- second FK ties each line item to the estimate it appears on
);

START TRANSACTION;
INSERT INTO estimate_repairs 
	(estimate_id, repair_item_id, recall_id, item_complete, repair_notes,is_approved)
VALUES
	(9,1,0,false,'nice oil',false),
	(9,2,0,false,'now you can stop good',false),
	(9,3,0,false,'old one dropped acid',false),
	(3,4,0,false,'good old sparky',false),
	(3,5,0,false,'old ones looked like retreads',false);

COMMIT;
ROLLBACK;

