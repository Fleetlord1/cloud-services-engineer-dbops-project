INSERT INTO product (name, picture_url, price)
VALUES 
('Sausage 1', 'url1', 100.0),
('Sausage 2', 'url2', 150.0);

INSERT INTO orders (status, date_created)
VALUES 
('NEW', CURRENT_DATE),
('DONE', CURRENT_DATE);

INSERT INTO order_product (quantity, order_id, product_id)
VALUES 
(2, 1, 1),
(1, 2, 2);
