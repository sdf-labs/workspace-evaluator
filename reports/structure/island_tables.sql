-- SDF STANDARD REPORT --
-- Reports all island tables in the workspace.
-- Island tables do not have any upstream or downstream dependencies

SELECT table_id
FROM sdf.information_schema.tables
WHERE CARDINALITY(tables.depends_on) = 0
AND CARDINALITY(tables.depended_on_by) = 0
AND purpose != 'system' AND purpose != 'external-system';