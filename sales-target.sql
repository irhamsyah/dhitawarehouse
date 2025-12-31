ALTER TABLE `users` 
ADD COLUMN `sales_target` decimal(22, 4) NULL DEFAULT 0.0000 AFTER `cmmsn_percent`,
ADD COLUMN `remaining_target` decimal(22, 4) NULL DEFAULT 0.0000 AFTER `sales_target`;

ALTER TABLE `product_locations` 
ADD COLUMN `sales_target` decimal(22, 4) NULL DEFAULT 0.0000 AFTER `location_id`,
ADD COLUMN `remaining_target` decimal(22, 4) NULL DEFAULT 0.0000 AFTER `sales_target`;