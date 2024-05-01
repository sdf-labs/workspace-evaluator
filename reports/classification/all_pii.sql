-- SDF STANDARD REPORT --
-- Reports all PII classifiers
-- Note: Classifiers must start with "PII."

SELECT DISTINCT
    t.table_ref,
    c.column_name,
    c.classifiers
FROM
    sdf.information_schema.tables t
    ,
    sdf.information_schema.columns c
WHERE
    t.table_ref = c.table_ref
    AND c.classifiers LIKE '%PII.%'