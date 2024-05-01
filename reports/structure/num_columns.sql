-- SDF STANDARD REPORT --
-- Reports the number of columns per table in descending order
select 
    distinct table_ref,
    count(column_name) as num_columns
from sdf.information_schema.columns as c
where c.catalog_name != 'system'
group by table_ref
order by num_columns desc;