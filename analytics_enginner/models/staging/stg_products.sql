with source as (select * from {{source('northwind', 'products')}}) Select * from source 