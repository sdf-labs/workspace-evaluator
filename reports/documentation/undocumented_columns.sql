-- SDF STANDARD REPORT --
-- Reports all undocumented columns in the workspace

SELECT 
table_ref,
column_name
FROM sdf.information_schema.columns AS c
WHERE c.catalog_name != 'system'
AND c.description IS NULL