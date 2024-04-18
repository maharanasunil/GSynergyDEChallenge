{{ config(
  materialized='view'
) }}

select *
from {{ source("dim", "invloc") }}
