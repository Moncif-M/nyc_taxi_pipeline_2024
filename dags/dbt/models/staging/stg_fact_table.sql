select 
vendorid as vendor_id,
to_char(readable_tpep_pickup_datetime, 'HH24') || to_char(readable_tpep_pickup_datetime, 'mi') || to_char(readable_tpep_pickup_datetime, 'ss') as pickup_time_id,
to_char(readable_tpep_dropoff_datetime, 'HH24') || to_char(readable_tpep_dropoff_datetime, 'mi') || to_char(readable_tpep_dropoff_datetime, 'ss') as dropoff_time_id,
date_part(epoch_microsecond,(to_char(readable_tpep_pickup_datetime,'yyyy')|| '-' || to_char(readable_tpep_pickup_datetime,'mm')|| '-' || to_char(readable_tpep_pickup_datetime,'dd'))::timestamp_ntz)::varchar as date_id,
passenger_count,
trip_distance,
ratecodeid as ratecode_id,
store_and_fwd_flag,
pulocationid as pulocation_id,
dolocationid as dolocation_id,
payment_type as payment_id,
abs(fare_amount) as fare_amount,
abs(extra) as extra,
abs(mta_tax) as mta_tax,
abs(tip_amount) as tip_amount,
abs(tolls_amount) as tolls_amount,
abs(improvement_surcharge) as improvement_surcharge,
abs(total_amount) as total_amount,
{{dbt_utils.generate_surrogate_key(['pickup_time_id', 'dropoff_time_id','date_id','pulocation_id','dolocation_id']) }} as trip_id,
abs(congestion_surcharge) as congestion_surcharge
from {{source('taxi','yellow_taxi_trip')}}
where to_char(readable_tpep_pickup_datetime,'yyyy') = '2024' and to_char(readable_tpep_pickup_datetime,'mm')::int between 1 and 12
 and to_char(readable_tpep_pickup_datetime,'dd')::int between 1 and 31    