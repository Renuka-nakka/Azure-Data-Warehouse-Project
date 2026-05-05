CREATE EXTERNAL TABLE dim_rider
WITH (
    LOCATION = 'dim_rider/',
    DATA_SOURCE = SynapseBlob,
    FILE_FORMAT = CSVFormat
)
AS
SELECT
    rider_id,
    first,
    last,
    address,
    birthday,
    account_start_date,
    account_end_date,
    is_member
FROM rider_ext;
