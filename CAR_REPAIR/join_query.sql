SELECT * FROM work_order_items; 

SELECT * FROM work_order_items wo
	JOIN repair_items ri ON wo.repair_item_id = ri.repair_item_id
	WHERE estimate_id = 3;
	
	
	
SELECT line_item_id, wo.estimate_id, item_complete, is_approved, description, parts_cost, labor_cost, user_id 
FROM work_order_items wo
JOIN estimates e ON e.estimate_id = wo.estimate_id
JOIN repair_items ri ON ri.repair_item_id = wo.repair_item_id;


