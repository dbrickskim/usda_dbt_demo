
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with farms_count_cte as (
    SELECT state, year, estimate as cnt_estimate FROM donghwa.mrp_bronze.arms_ingest WHERE variable_id = "kount" AND state != "all"
)

select *
from farms_count_cte

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
