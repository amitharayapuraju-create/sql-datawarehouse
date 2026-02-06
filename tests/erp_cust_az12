
-- Checking when cid isnt match with cst_key from crm_cust_info table
SELECT *
from bronze.erp_cust_az12
where cid not like 'NAS%'

-- Checking if any person's bdate is greater than today

select distinct
bdate
from bronze.erp_cust_az12
where bdate > getdate() or bdate <= '1926-02-06'

-- QC - on gen

select distinct 
gen
from bronze.erp_cust_az12;
