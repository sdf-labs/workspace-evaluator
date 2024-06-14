-- SDF STANDARD REPORT --
-- Reports all columns with the most direct downstream dependencies
-- in descending order

SELECT table_id, LENGTH(depended_on_by) AS downstream_dep_count
FROM sdf.information_schema.tables
ORDER BY downstream_dep_count DESC;