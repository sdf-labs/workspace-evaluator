-- SDF STANDARD REPORT --
-- Reports all middle tables in the workspace.
-- For all tables in the workspace, report which have
-- both upstream and downstream dependencies

SELECT table_id
FROM sdf.information_schema.tables
WHERE LENGTH_ARRAY(tables.depends_on) != 0
AND LENGTH_ARRAY(tables.depended_on_by) != 0;