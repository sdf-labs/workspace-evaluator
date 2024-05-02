-- SDF STANDARD REPORT --
-- Reports all undocumented models in the workspace

SELECT 
table_ref as table_ref
FROM sdf.information_schema.tables AS t
WHERE t.catalog_name != 'system'
AND t.description IS NULL