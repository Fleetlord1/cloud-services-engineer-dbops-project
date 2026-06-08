# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

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
