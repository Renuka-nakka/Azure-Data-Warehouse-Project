CREATE EXTERNAL TABLE payment_ext (
    payment_id INT,
    date VARCHAR(50),
    amount FLOAT,
    rider_id INT
)
WITH (
    LOCATION = 'public.payment.csv',
    DATA_SOURCE = SynapseBlob,
    FILE_FORMAT = CSVFormat
);
GO
