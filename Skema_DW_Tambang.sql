-- ========================================================
-- DDL SQL: SKEMA DATA WAREHOUSE (3 STAR SCHEMA)
-- STUDI KASUS: INDUSTRI PERTAMBANGAN
-- SEAN KENNETH TOMMY KELEYAN - 2702751694
-- ========================================================

-- 1. PEMBUATAN TABEL DIMENSI (MASTER DATA)

CREATE TABLE Dim_Machine (
    asset_tag VARCHAR(50) PRIMARY KEY,
    asset_number VARCHAR(50),
    machine_type VARCHAR(100),
    criticality VARCHAR(10)
);

CREATE TABLE Dim_Part (
    part_no VARCHAR(50) PRIMARY KEY,
    part_family VARCHAR(100),
    unit_cost_inr DECIMAL(15, 2),
    uom VARCHAR(20)
);

CREATE TABLE Dim_Plant (
    plant_code VARCHAR(50) PRIMARY KEY,
    plant_name VARCHAR(100)
);

CREATE TABLE Dim_Date (
    Date_ID INT PRIMARY KEY,
    transaction_date DATE,
    Year INT,
    Month INT,
    Day INT
);

-- 2. PEMBUATAN TABEL FAKTA 

-- Fact Table 1: Logistik & Inventori
CREATE TABLE Fact_Demand (
    Demand_ID INT AUTO_INCREMENT PRIMARY KEY,
    Date_ID INT,
    asset_tag VARCHAR(50),
    part_no VARCHAR(50),
    plant_code VARCHAR(50),
    qty_issued INT,
    issue_value_inr DECIMAL(15, 2),
    FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID),
    FOREIGN KEY (asset_tag) REFERENCES Dim_Machine(asset_tag),
    FOREIGN KEY (part_no) REFERENCES Dim_Part(part_no),
    FOREIGN KEY (plant_code) REFERENCES Dim_Plant(plant_code)
);

-- Fact Table 2: Telemetri Mesin & Sensor
CREATE TABLE Fact_Telemetry (
    Telemetry_ID INT AUTO_INCREMENT PRIMARY KEY,
    Date_ID INT,
    asset_tag VARCHAR(50),
    plant_code VARCHAR(50),
    temp_bearing_degC DECIMAL(10, 2),
    total_vibration_mms DECIMAL(10, 2),
    load_pct DECIMAL(10, 2),
    Machine_Stress_Level VARCHAR(50),
    FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID),
    FOREIGN KEY (asset_tag) REFERENCES Dim_Machine(asset_tag),
    FOREIGN KEY (plant_code) REFERENCES Dim_Plant(plant_code)
);

-- Fact Table 3: Histori Kerusakan (Breakdown)
CREATE TABLE Fact_Breakdown (
    Breakdown_ID INT AUTO_INCREMENT PRIMARY KEY,
    Date_ID INT,
    asset_tag VARCHAR(50),
    plant_code VARCHAR(50),
    breakdown_flag INT,
    wo_type VARCHAR(100),
    FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID),
    FOREIGN KEY (asset_tag) REFERENCES Dim_Machine(asset_tag),
    FOREIGN KEY (plant_code) REFERENCES Dim_Plant(plant_code)
);