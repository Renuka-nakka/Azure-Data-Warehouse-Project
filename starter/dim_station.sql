CREATE EXTERNAL TABLE dim_station
WITH (
    LOCATION = 'dim_station/',
    DATA_SOURCE = SynapseBlob,
    FILE_FORMAT = CSVFormat
)
AS
SELECT
    station_id,
    name,
    latitude,
    longitude
FROM station_ext;
