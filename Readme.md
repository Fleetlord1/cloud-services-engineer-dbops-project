# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

Создание и предоставление грантов пользователю store_user
```sql
CREATE USER store_user WITH PASSWORD 'password';

GRANT ALL PRIVILEGES ON DATABASE store TO store_user;

\c store

GRANT ALL ON SCHEMA public TO store_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO store_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO store_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT ALL ON TABLES TO store_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT ALL ON SEQUENCES TO store_user;
```

Запрос: количество проданных сосисок за каждый день предыдущей недели

```sql
SELECT 
    o.date_created AS order_date,
    SUM(op.quantity) AS total_sold
FROM orders o
JOIN order_product op 
    ON o.id = op.order_id
WHERE o.date_created >= date_trunc('week', CURRENT_DATE) - INTERVAL '1 week'
  AND o.date_created < date_trunc('week', CURRENT_DATE)
GROUP BY o.date_created
ORDER BY o.date_created;

Созданные индексы

```sql
CREATE INDEX idx_orders_date_created ON orders(date_created);
CREATE INDEX idx_order_product_order_id ON order_product(order_id);
```

До индексов:
Time: 2.891 ms

EXPLAIN ANALYSE:
Seq Scan on orders
Seq Scan on order_product
Execution Time: 2.891 ms

После создания индексов:
Time: 1.223 ms

EXPLAIN_ANALYSE:
Index Scan using idx_orders_date_created
Index Scan using idx_order_product_order_id
Execution Time: 1.223 ms


После создания индексов время выполнения запроса сократилось примерно в 2.5 раза.
Запрос перестал использовать последовательное сканирование (Seq Scan) и начал использовать Index Scan.




