-- Model for Product Department Dimension
{{ config(
  materialized='table'
) }}

SELECT
    dept_id,
    dept_label
FROM
    {{ ref('stg_dim_prod') }}
GROUP BY
    dept_id,
    dept_label;
