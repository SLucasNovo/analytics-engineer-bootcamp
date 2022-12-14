

Select 

fpo.purchase_order_id,
fpo.product_id,
fpo.quantity,
fpo.unit_cost,
fpo.date_received,
fpo.posted_to_inventory,
fpo.inventory_id,
fpo.supplier_id,
fpo.created_by,
fpo.submitted_date,
fpo.creation_date,
fpo.status_id,
fpo.expected_date,
fpo.shipping_fee,
fpo.taxes,
fpo.payment_date,
fpo.payment_amount,
fpo.payment_method,
fpo.notes,
fpo.approved_by,
fpo.approved_date,
fpo.submitted_by,
dc.customer_id,
dc.company as customer_company,
dc.last_name as customer_last_name,
dc.first_name as customer_first_name,
dc.email_address as customer_email_address,
dc.job_title as customer_job_title,
dc.business_phone as customer_business_phone,
dc.home_phone as customer_home_phone,
dc.mobile_phone as customer_mobile_phone,
dc.fax_number as customer_fax_number,
dc.address as customer_address,
dc.city as customer_city,
dc.state_province as customer_state_province,
dc.zip_postal_code as customer_zip_postal_code,
dc.country_region as customer_country_region,
dc.web_page as customer_web_page,
dc.notes as customer_notes,
dc.attachments as customer_attachments,
de.employee_id,
de.company as employee_company,
de.last_name as employee_last_name,
de.first_name as employee_first_name,
de.email_address as employee_email_address,
de.job_title as employee_job_title,
de.business_phone as employee_business_phone,
de.home_phone as employee_home_phone,
de.mobile_phone as employee_mobile_phone,
de.fax_number as employee_fax_number,
de.address as employee_address,
de.city as employee_city,
de.state_province as employee_state_province,
de.zip_postal_code as employee_zip_postal_code,
de.country_region as employee_country_region,
de.web_page as employee_web_page,
de.notes as employee_notes,
de.attachments as employee_attachments,
--dp.product_id,
dp.product_code,
dp.product_name,
dp.description as products_description,
dp.supplier_company as products_supplier_company,
dp.standard_cost as products_standard_cost,
dp.list_price as products_list_price,
dp.reorder_level as products_reorder_level,
dp.target_level as products_target_level,
dp.quantity_per_unit as products_quantity_per_unit,
dp.discontinued as products_discontinued,
dp.minimum_reorder_quantity as products_minimum_reorder_quantity,
dp.category as products_category,
dp.attachments as products_attachments,
current_timestamp() as insertion_timestamp



from {{ ref ('fact_purchase_order')}} fpo
left join {{ ref ('dim_customer')}} dc on dc.customer_id = fpo.customer_id
left join {{ ref ('dim_employee')}} de on de.employee_id = fpo.employee_id
left join {{ ref ('dim_products')}} dp on dp.product_id = fpo.product_id