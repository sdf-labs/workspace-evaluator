-- SDF STANDARD REPORT --
-- Reports all island tables in the workspace.
-- Island tables do not have any upstream or downstream dependencies

SELECT table_id
FROM sdf.information_schema.tables
WHERE LENGTH(tables.depends_on) = 0
AND LENGTH(tables.depended_on_by) = 0
AND purpose != 'system' AND purpose != 'external-system';