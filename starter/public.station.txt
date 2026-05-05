CREATE EXTERNAL TABLE station_ext (
    station_id VARCHAR(50),
    name VARCHAR(100),
    latitude FLOAT,
    longitude FLOAT
)
WITH (
    LOCATION = 'public.station.csv',
    DATA_SOURCE = SynapseBlob,
    FILE_FORMAT = CSVFormat
);
GO
