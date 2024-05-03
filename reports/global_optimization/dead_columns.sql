-- SDF STANDARD REPORT --
-- Reports all dead columns in the workspace.
-- For all models in the workspace with both upstream & downstream dependencies,
-- find columns which are unused.

-- INEFFICIENT QUERY!!


-- WITH prefiltered_tables AS (
--    SELECT * FROM sdf.information_schema.tables it
--    WHERE EXISTS (
--     SELECT 1
--     FROM sdf.information_schema.tables downstream_tables
--     WHERE downstream_tables.dependencies ILIKE '%' || it.table_ref || '%' 
--    ) AND it.dependencies IS NOT NULL
-- )

-- SELECT ic.column_name, ic.table_ref
-- FROM sdf.information_schema.columns ic
-- JOIN prefiltered_tables it ON ic.table_ref = it.table_ref
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM sdf.information_schema.columns downstream
--     JOIN sdf.information_schema.tables downstream_tables ON downstream.table_ref = downstream_tables.table_ref
--     WHERE (downstream.lineage_copy ILIKE '%' || ic.column_name || '%'
--        OR downstream.lineage_modify ILIKE '%' || ic.column_name || '%'
--        OR downstream_tables.lineage_scan ILIKE '%' || ic.column_name || '%')
-- );