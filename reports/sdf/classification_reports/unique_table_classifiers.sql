-- SDF STANDARD REPORT --
-- Reports all unique table classifiers in the workspace

SELECT DISTINCT classifier
FROM sdf.information_schema.tables
CROSS JOIN UNNEST(classifiers) AS t(classifier);