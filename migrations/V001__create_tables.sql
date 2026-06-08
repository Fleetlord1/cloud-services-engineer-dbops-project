CREATE TABLE product (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    picture_url TEXT
);

CREATE TABLE product_info (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price NUMERIC(10,2) NOT NULL
);

CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE orders_date (
    id BIGINT PRIMARY KEY,
    date_created TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE order_product (
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order
        FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_id) REFERENCES product(id)
);
