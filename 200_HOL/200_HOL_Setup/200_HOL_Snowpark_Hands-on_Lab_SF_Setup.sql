-- Create Database Roles, Database, Schema, Warehouse
use role ACCOUNTADMIN;

CREATE OR REPLACE DATABASE snowpark_workshop;

CREATE OR REPLACE SCHEMA snowpark_workshop.campaign_demo;

CREATE OR REPLACE WAREHOUSE snowparkws_wh WITH
WAREHOUSE_SIZE = 'XLarge' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 10 INITIALLY_SUSPENDED = TRUE AUTO_RESUME = TRUE MIN_CLUSTER_COUNT = 1 MAX_CLUSTER_COUNT = 1;

CREATE OR REPLACE ROLE snowpark_workshop_role;

GRANT ROLE snowpark_workshop_role TO ROLE sysadmin;
GRANT ROLE snowpark_workshop_role TO USER <username>;

-- Create Tables, Load Data, and Setup Stages

-- Create table "campaign_spend" from data hosted on publicly accessible S3 bucket

CREATE OR REPLACE FILE FORMAT csvformat SKIP_HEADER = 1
TYPE = 'CSV';

CREATE OR REPLACE STAGE campaign_data_stage
FILE_FORMAT = csvformat
URL = 's3://sfquickstarts/Summit 2022 Keynote Demo/campaign_spend/';

CREATE OR REPLACE TABLE campaign_spend (CAMPAIGN VARCHAR(60),
CHANNEL VARCHAR(60),
DATE DATE,
TOTAL_CLICKS NUMBER(38,0), TOTAL_COST NUMBER(38,0), ADS_SERVED NUMBER(38,0)
);

COPY INTO campaign_spend FROM @campaign_data_stage;

-- Create table "monthly_revenue" from data hosted on publicly accessible S3 bucket
CREATE OR REPLACE STAGE monthly_revenue_data_stage
FILE_FORMAT = csvformat
URL = 's3://sfquickstarts/Summit 2022 Keynote Demo/monthly_revenue/';

CREATE OR REPLACE TABLE monthly_revenue ( YEAR NUMBER(38,0),
MONTH NUMBER(38,0),
REVENUE FLOAT
);

COPY INTO monthly_revenue FROM @monthly_revenue_data_stage;

-- Create table "budget_allocations_and_roi" that holds the last six months of budget allocations and ROI
CREATE OR REPLACE TABLE budget_allocations_and_roi ( MONTH varchar(30),
SEARCHENGINE integer,
SOCIALMEDIA integer,
VIDEO integer, EMAIL integer, ROI float
);

INSERT INTO budget_allocations_and_roi (MONTH, SEARCHENGINE, SOCIALMEDIA, VIDEO, EMAIL, ROI)
VALUES
('January',35,50,35,85,8.22),
('February',75,50,35,85,13.90), ('March',15,50,35,15,7.34), ('April',25,80,40,90,13.23), ('May',95,95,10,95,6.246), ('June',35,50,35,85,8.22);

-- Create stages required for Stored Procedures, UDFs, and saving model files.

CREATE OR REPLACE STAGE demo_sprocs;
CREATE OR REPLACE STAGE demo_models;
CREATE OR REPLACE STAGE demo_udfs;

-- Finish Grants on DB Objects;
GRANT USAGE ON DATABASE snowpark_workshop TO ROLE snowpark_workshop_role;
GRANT USAGE ON SCHEMA snowpark_workshop.campaign_demo TO ROLE snowpark_workshop_role;
GRANT USAGE ON ALL FILE FORMATS IN DATABASE snowpark_workshop TO ROLE snowpark_workshop_role;
GRANT ALL PRIVILEGES ON ALL STAGES IN DATABASE snowpark_workshop TO ROLE snowpark_workshop_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN DATABASE snowpark_workshop TO ROLE snowpark_workshop_role;
GRANT CREATE FUNCTION ON SCHEMA snowpark_workshop.campaign_demo TO ROLE snowpark_workshop_role;
GRANT CREATE PROCEDURE ON SCHEMA snowpark_workshop.campaign_demo TO ROLE snowpark_workshop_role;
GRANT CREATE TABLE ON SCHEMA snowpark_workshop.campaign_demo TO ROLE snowpark_workshop_role;
GRANT CREATE VIEW ON SCHEMA snowpark_workshop.campaign_demo TO ROLE snowpark_workshop_role;
GRANT ALL ON WAREHOUSE snowparkws_wh TO ROLE snowpark_workshop_role;
