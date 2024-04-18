-- Model for Product Category Dimension
{{ config(
  materialized='table'
) }}


SELECT
    cat_id,
    cat_label,
    dept_id
FROM
    {{ ref('stg_dim_prod') }}
GROUP BY
    cat_id,
    cat_label,
    dept_id;