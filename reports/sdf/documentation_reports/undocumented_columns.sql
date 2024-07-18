-- SDF STANDARD REPORT --
-- Reports all undocumented columns in the workspace

SELECT 
table_id,
column_name
FROM sdf.information_schema.columns AS c
WHERE c.table_purpose != 'system' AND c.table_purpose != 'external-system'
AND c.description IS NULL