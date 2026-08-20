Overview
========

Hello ! This project was made for learning purposes feel free to run it in your own machine 

Project Contents
================
nyc_yellow_taxi parquet files for 2024 are loaded from my s3 in snowflake (42.2 M rows) secured by an iam role and policy.
Data was then transformed using dbt and prepared for the lakehouse in snowflake using a star schema :
- fact_trip
- dim_location
- dim_date
- dim_time
- dim_vendor
- dim_payment
- dim_ratecode
the pipeline is wrapped in a docker container using astronomer-cosmos locally
a CI pipeline was set up for dbt using github actions
a local docker container was setup to monitor dbt run and test logs and provide vizualisations using kibana
finally a report was made by connecting snowflake to looker

