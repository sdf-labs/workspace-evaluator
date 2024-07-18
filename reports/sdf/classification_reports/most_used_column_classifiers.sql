-- SDF STANDARD REPORT --
-- Reports the most used column classifiers in the workspace

SELECT classifier, COUNT(*) AS usage_count
FROM (
    SELECT classifier
    FROM sdf.information_schema.columns, 
    UNNEST(classifiers) AS t(classifier)
) unnested
GROUP BY classifier
ORDER BY usage_count DESC;