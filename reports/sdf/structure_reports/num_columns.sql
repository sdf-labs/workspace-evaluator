-- SDF STANDARD REPORT --
-- Reports the number of columns per table in descending order
select 
    distinct table_id,
    count(column_name) as num_columns
from sdf.information_schema.columns as c
where c.table_purpose != 'system' and c.table_purpose != 'external-system'
group by table_id
order by num_columns desc;