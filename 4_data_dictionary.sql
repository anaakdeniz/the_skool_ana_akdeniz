-- Data dictionary: information om tabellen myh_2025 från Oracles systemtabeller

SET SQLFORMAT ansiconsole

PROMPT Tabellens struktur
DESC myh_2025

PROMPT Kolumner, datatyper och om de får vara NULL (USER_TAB_COLUMNS)
SELECT column_name, data_type, data_length, nullable
FROM user_tab_columns
WHERE table_name = 'MYH_2025'
ORDER BY column_id;

PROMPT Restriktioner på tabellen, t.ex. primärnyckeln (USER_CONSTRAINTS)
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'MYH_2025';

PROMPT Antal rader och tabeller i schemat (USER_TABLES)
SELECT table_name, num_rows
FROM user_tables
WHERE table_name = 'MYH_2025';

EXIT
