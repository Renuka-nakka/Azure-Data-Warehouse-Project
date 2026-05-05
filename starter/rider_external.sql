CREATE DATABASE udacitydb;
GO

USE udacitydb;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'StrongPassword123!';
GO

CREATE DATABASE SCOPED CREDENTIAL SynapseCred
WITH IDENTITY = 'Managed Identity';
GO

CREATE EXTERNAL DATA SOURCE SynapseBlob
WITH (
    LOCATION = 'https://project29storage.blob.core.windows.net/synapsedata',
    CREDENTIAL = SynapseCred
);
GO

CREATE EXTERNAL FILE FORMAT CSVFormat
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2
    )
);
GO

CREATE EXTERNAL TABLE rider_ext (
    rider_id INT,
    first VARCHAR(50),
    last VARCHAR(50),
    address VARCHAR(100),
    birthday VARCHAR(50),
    account_start_date VARCHAR(50),
    account_end_date VARCHAR(50),
    is_member BIT
)
WITH (
    LOCATION = 'public.rider.csv',
    DATA_SOURCE = SynapseBlob,
    FILE_FORMAT = CSVFormat
);
GO
