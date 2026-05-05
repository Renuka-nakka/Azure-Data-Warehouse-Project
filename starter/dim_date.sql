CREATE EXTERNAL TABLE dim_date
WITH (
    LOCATION = 'dim_date/',
    DATA_SOURCE = SynapseBlob,
    FILE_FORMAT = CSVFormat
)
AS
SELECT DISTINCT
    date
FROM payment_ext;
