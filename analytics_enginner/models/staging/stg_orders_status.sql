with source as (select * from {{source('northwind', 'orders_status')}}) Select *, current_timestamp() as ingestion_timestamp from source 