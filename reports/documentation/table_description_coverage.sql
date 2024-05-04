-- SDF STANDARD REPORT --
-- Reports the percentage of tables that have descriptions


WITH tables_with_description AS (
   SELECT 
       1 as idx,
       count(table_name) as t_desc
    FROM sdf.information_schema.tables AS t
    WHERE t.catalog_name != 'system'
    AND t.description IS NOT NULL
),
tables_with_no_description AS (
   SELECT 
        1 as idx,
        count(table_name) as t_no_desc
    FROM sdf.information_schema.tables AS t
    WHERE t.catalog_name != 'system'
    AND t.description IS NULL
)

SELECT
    t_desc as tables_w_desc,
    t_no_desc as tables_w_no_desc,
    (CAST (t_desc AS REAL) / CAST(t_no_desc AS REAL)) as table_desc_pct,
    t_desc + t_no_desc as total_tables
from tables_with_description tw join tables_with_no_description td USING (idx)
