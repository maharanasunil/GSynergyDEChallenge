{{ config(
  materialized='view'
) }}

select *
from {{ source("fct", "averagecosts") }}
