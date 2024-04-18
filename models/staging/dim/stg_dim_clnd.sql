{{ config(
  materialized='view'
) }}

select 
fscldt_id,
fscldt_label,
fsclwk_id,
fsclwk_label,
fsclmth_id,
fsclmth_label,
fsclqrtr_id,
fsclqrtr_label,
fsclyr_id,
fsclyr_label,
ssn_id,
ssn_label,
ly_fscldt_id,
lly_fscldt_id,
fscldow,
fscldom,
fscldoq,
fscldoy,
fsclwoy,
fsclmoy,
fsclqoy,
date
from {{ source("dim", "clnd") }}
