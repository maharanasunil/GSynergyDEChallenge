{{ config(
  materialized='view'
) }}

select
fscldt_id,
sku_id,
average_unit_standardcost,
average_unit_landedcost
from 
  {{ source("fct", "averagecosts") }}
