ALTER TABLE product
ADD COLUMN price DOUBLE PRECISION;

ALTER TABLE orders
ADD COLUMN date_created DATE DEFAULT CURRENT_DATE;

ALTER TABLE product
ADD CONSTRAINT product_pkey PRIMARY KEY (id);

ALTER TABLE orders
ADD CONSTRAINT orders_pkey PRIMARY KEY (id);

ALTER TABLE order_product
ADD CONSTRAINT order_product_pkey PRIMARY KEY (order_id, product_id);

ALTER TABLE order_product
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id) REFERENCES orders(id);

ALTER TABLE order_product
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES product(id);

DROP TABLE product_info;

DROP TABLE orders_date;
