-- SDF STANDARD REPORT --
-- Reports the most used table classifiers in the workspace

SELECT classifier, COUNT(*) AS usage_count
FROM (
    SELECT classifier
    FROM sdf.information_schema.tables, 
    UNNEST(classifiers) AS t(classifier)
) unnested
GROUP BY classifier
ORDER BY usage_count DESC;
    