with source as (select * from {{source('northwind', 'shippers')}}) Select *, current_timestamp() as ingestion_timestamp from source 