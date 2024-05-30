-- SDF STANDARD REPORT --
-- Reports all dead columns in the workspace.
-- For all models in the workspace with both upstream & downstream dependencies,
-- find columns which are unused.

WITH tables_with_lineage AS (
   SELECT 
      tl.table_id
   FROM  
      sdf.information_schema.tables tl
   WHERE LENGTH_ARRAY(tl.depends_on) != 0 
   AND LENGTH_ARRAY(tl.depended_on_by) != 0
   AND (tl.purpose != 'system' AND tl.purpose != 'external-system')
)

SELECT
   table_id, from_column_id AS dead_column_id
FROM 
   tables_with_lineage
JOIN
   sdf.information_schema.column_lineage cl ON cl.from_table_id = tables_with_lineage.table_id
WHERE
   cl.to_table_id IS NULL;