-- SDF STANDARD REPORT --
-- Reports all dead tables in the workspace.
-- For all tables in the workspace, report which have
-- no downstream dependencies

SELECT 
    table_ref,
    table_name
FROM sdf.information_schema.tables it
WHERE NOT EXISTS (
    SELECT 1
    FROM sdf.information_schema.tables downstream_tables
    WHERE downstream_tables.dependencies ILIKE '%' || it.table_ref || '%' 
    ) 
AND it.dependencies IS NULL
AND it.catalog_name != 'system'
