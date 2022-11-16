tables = [
            'strings',
            'suppliers',
            'shippers',
            'purchase_orders',
            'purchase_order_status',
            'purchase_order_details',
            'products',
            'privileges',
            'orders_tax_status',
            'orders',
            'orders_status',
            'order_details_status',
            'order_details',
            'invoices',
            'inventory_transactions',
            'inventory_transaction_types',
            'employees',
            'employee_privileges',
            'customer'
]

path = 'C:/analytics-engineer-bootcamp/analytics_enginner/models/staging/'
prefix = 'stg_'
for t in tables:
    f = open(f'{path}{prefix}{t}.sql',"w+")
    query = f"with source as (select * from {{{{source('northwind', '{t}')}}}}) Select *, current_timestamp() as ingestion_timestamp from source "
    f.write(query)
    f.close()
