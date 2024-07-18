-- SDF STANDARD REPORT --
-- Reports all undocumented models in the workspace

SELECT 
table_id
FROM sdf.information_schema.tables AS t
WHERE t.purpose != 'system' AND t.purpose != 'external-system'
AND t.description IS NULL