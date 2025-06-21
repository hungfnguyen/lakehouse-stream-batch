-- WAL config
ALTER SYSTEM SET wal_level = logical;
ALTER SYSTEM SET max_replication_slots = 4;
ALTER SYSTEM SET max_wal_senders = 4;

-- CDC User
CREATE ROLE debezium WITH LOGIN PASSWORD 'debezium_pwd' REPLICATION;
GRANT CONNECT ON DATABASE pagila TO debezium;
GRANT USAGE ON SCHEMA public TO debezium;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO debezium;

-- Publication cho tất cả tables
CREATE PUBLICATION dbz_pagila_pub FOR ALL TABLES;

-- Restart required message
SELECT 'PostgreSQL needs restart for WAL settings!' as notice;