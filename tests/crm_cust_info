-- Write a query to check if any duplicates are there in pk

SELECT cst_id,count(*)
from silver.crm_cust_info
group by cst_id
having count(*) > 1;

SELECT cst_firstname from silver.crm_cust_info
where cst_firstname is null;

SELECT cst_lastname from silver.crm_cust_info
where cst_lastname is null;

-- Check for unwanted spaces in firstname values

select cst_firstname from silver.crm_cust_info
where cst_firstname != trim(cst_firstname);

-- Check for unwanted spaces in lastname values

select cst_lastname from silver.crm_cust_info
where cst_lastname != trim(cst_lastname);


-- Check for unwanted spaces in marital status values
select cst_marital_status from silver.crm_cust_info
where cst_marital_status != trim(cst_marital_status);



-- Check for unwanted spaces in gender  values
select cst_gndr from silver.crm_cust_info
where cst_gndr != trim(cst_gndr);



-- Check values in gender and status col

SELECT distinct cst_gndr from silver.crm_cust_info;

SELECT distinct cst_marital_status from silver.crm_cust_info;
