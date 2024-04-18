
-- Model for Product Style Color Dimension
{{ config(
  materialized='table'
) }}

SELECT
    stylclr_id,
    stylclr_label,
    styl_id
FROM
    {{ ref('stg_dim_prod') }}
GROUP BY
    stylclr_id,
    stylclr_label,
    styl_id;
