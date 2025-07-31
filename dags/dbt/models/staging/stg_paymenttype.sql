select distinct payment_type as payment_id,
case 
    when payment_type = 0 then 'Flex Fare trip'
    when payment_type = 1 then 'Credit card'
    when payment_type = 2 then 'Cash'
    when payment_type = 3 then 'No charge'
    when payment_type = 4 then 'Dispute'
    when payment_type = 5 then 'Unknown'
    else 'Voided tri'
end as payment_type
from {{source('taxi','yellow_taxi_trip')}}