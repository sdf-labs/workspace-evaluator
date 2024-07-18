-- SDF STANDARD REPORT --
-- Reports all PII classifiers
-- Note: Classifiers must start with "PII."

SELECT
    columns.table_id,
    columns.column_name,
    columns.classifiers
FROM 
    sdf.information_schema.columns
WHERE
    CONTAINS_ARRAY_VARCHAR(classifiers, 'PII.');
