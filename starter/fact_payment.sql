CREATE EXTERNAL TABLE fact_payment
WITH (
    LOCATION = 'fact_payment/',
    DATA_SOURCE = SynapseBlob,
    FILE_FORMAT = CSVFormat
)
AS
SELECT
    p.payment_id,
    p.rider_id,
    CAST(p.date AS DATE) AS payment_date,
    p.amount AS payment_amount

FROM payment_ext p
JOIN rider_ext r
    ON p.rider_id = r.rider_id;
