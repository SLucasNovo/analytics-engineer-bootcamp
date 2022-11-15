with source as 

(select 
    cast(supplier_ids as integer) as supplier_id,
    * except(supplier_ids) 
from {{source('northwind', 'products')}} 
Where supplier_ids not like '%;%'
) 

Select *, current_timestamp() as ingestion_timestamp from source 