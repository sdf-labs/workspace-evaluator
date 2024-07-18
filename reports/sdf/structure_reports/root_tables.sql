-- SDF STANDARD REPORT --
-- Reports all root tables in the workspace
-- Root tables are defined as: Tables which have no upstream dependencies, 
-- but do have downstream dependents

SELECT to_table_id
FROM sdf.information_schema.table_lineage
WHERE table_lineage.from_table_id IS NULL;