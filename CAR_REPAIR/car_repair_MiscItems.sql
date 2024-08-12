-- this is just a scratch pad for sql stuff

SELECT * FROM estimates
SELECT * FROM user_detail ORDER BY user_id asc
SELECT * FROM vehicle

SELECT * FROM users

SELECT * FROM user_detail 


For Later:

--- pull all user data
SELECT * FROM user_detail ud INNER JOIN users u 
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



