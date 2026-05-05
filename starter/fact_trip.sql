CREATE EXTERNAL TABLE fact_trip
WITH (
    LOCATION = 'fact_trip/',
    DATA_SOURCE = SynapseBlob,
    FILE_FORMAT = CSVFormat
)
AS
SELECT
    t.trip_id,
    t.rider_id,
    t.start_station_id,
    t.end_station_id,

   
    DATEDIFF(MINUTE, t.start_at, t.ended_at) AS trip_duration,

  
    DATEDIFF(YEAR, r.birthday, t.start_at) AS rider_age_at_trip,

    
    CAST(t.start_at AS DATE) AS trip_date

FROM trip_ext t
JOIN rider_ext r
    ON t.rider_id = r.rider_id;
