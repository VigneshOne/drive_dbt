{{ config(materialized='table') }}

SELECT
    _fivetran_id as id,
    studentid,
    entry_term,
    app_date,
    coalesce(act_english, 0) as act_english,
    aid_term,
    hs_gpa,
    hs_percentile,
    state,
    city,
    county,
    zip_code,
    state_grant,
    hs_ncesid,
    _fivetran_synced as updated_ts
from {{ source('studentdata', 'student_enrollment_modeling') }}
where _fivetran_deleted = false
