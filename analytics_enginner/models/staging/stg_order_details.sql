with source as (select * from {{source('northwind', 'order_details')}}) Select * from source 