-- SDF STANDARD REPORT --
-- Reports the percentage of columns that have descriptions


WITH columns_with_description AS (
   SELECT 
       1 as idx,
       count(column_name) as c_desc
    FROM sdf.information_schema.columns AS c
    WHERE c.catalog_name != 'system'
    AND c.description IS NOT NULL
),
columns_with_no_description AS (
   SELECT 
        1 as idx,
        count(column_name) as c_no_desc
    FROM sdf.information_schema.columns AS c
    WHERE c.catalog_name != 'system'
    AND c.description IS NULL
)

SELECT
    c_desc as cols_w_desc,
    c_no_desc as cols_w_no_desc,
    (CAST (c_desc AS REAL) / CAST(c_no_desc AS REAL)) as col_desc_pct,
    c_desc + c_no_desc as total_cols
from columns_with_description cw join columns_with_no_description cd USING (idx)
