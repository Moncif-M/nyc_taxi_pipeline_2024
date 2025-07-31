select distinct ratecodeid as ratecode_id,
case
    when ratecodeid = 1 then 'standard rate'
    when ratecodeid = 2 then 'JFK'
    when ratecodeid = 3 then 'Newark'
    when ratecodeid = 4 then 'Nassau or Westchester'
    when ratecodeid = 5 then 'Negotiated fare'
    when ratecodeid = 6 then 'Group ride'
    else Null
end as ratecode
from {{source('taxi','yellow_taxi_trip')}}
where ratecodeid is not null