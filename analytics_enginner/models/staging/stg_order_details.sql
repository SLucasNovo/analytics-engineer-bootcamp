with source as (select * from {{source('northwind', 'order_details')}}) Select *, current_timestamp() as ingestion_timestamp from source 