-- SDF STANDARD REPORT --
-- Reports all leaf tables in the workspace.
-- For all tables in the workspace, report which have
-- no downstream dependencies

SELECT from_table_id
FROM sdf.information_schema.table_lineage
WHERE table_lineage.to_table_id IS NULL;