-- models/fact_average_costs.sql

{{ config(
  materialized='view'
) }}

select *
from {{ source("dim", "rtlloc") }}
