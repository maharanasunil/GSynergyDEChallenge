
-- Model for Product Style Dimension
{{ config(
  materialized='table'
) }}

SELECT
    styl_id,
    styl_label,
    subcat_id
FROM
    {{ ref('stg_dim_prod') }}
GROUP BY
    styl_id,
    styl_label,
    subcat_id;
