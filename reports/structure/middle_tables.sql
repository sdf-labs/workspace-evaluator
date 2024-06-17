-- SDF STANDARD REPORT --
-- Reports all middle tables in the workspace.
-- For all tables in the workspace, report which have
-- both upstream and downstream dependencies

SELECT table_id
FROM sdf.information_schema.tables
WHERE CARDINALITY(tables.depends_on) != 0
AND CARDINALITY(tables.depended_on_by) != 0;