select distinct vendorid as vendor_id,
case 
    when vendorid = 1 then 'Creative Mobile Technologies, LLC' 
    when vendorid = 2 then 'Curb Mobility, LLC'
    when vendorid = 6 then 'Myle Technologies Inc'
    else 'Helix'
end as tpep_provider
from {{source('taxi','yellow_taxi_trip')}}