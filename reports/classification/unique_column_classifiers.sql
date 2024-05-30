-- SDF STANDARD REPORT --
-- Reports all unique column classifiers in the workspace

SELECT DISTINCT classifier
FROM sdf.information_schema.columns
CROSS JOIN UNNEST(classifiers) AS t(classifier);