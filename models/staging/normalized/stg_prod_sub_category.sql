
-- Model for Product Subcategory Dimension
{{ config(
  materialized='table'
) }}

SELECT
    subcat_id,
    subcat_label,
    cat_id
FROM
    {{ ref('stg_dim_prod') }}
GROUP BY
    subcat_id,
    subcat_label,
    cat_id;