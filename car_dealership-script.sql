# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          Car Dearlership                                 #
# ---------------------------------------------------------------------- #

DROP DATABASE IF EXISTS car_dealership;

CREATE DATABASE IF NOT EXISTS car_dealership;

USE car_dealership;

DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Sales_contracts;
DROP TABLE IF EXISTS Lease_contracts;
DROP TABLE IF EXISTS Dealerships;
DROP TABLE IF EXISTS Vehicles;

# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `Vehicles` (
    `VIN` VARCHAR(17) PRIMARY KEY,
    `make` VARCHAR(50) NOT NULL,
    `model` VARCHAR(50) NOT NULL,
    `year` INT NOT NULL,
    `SOLD` BOOLEAN DEFAULT FALSE NOT NULL,
    `color` VARCHAR(50),
    `vehicleType` VARCHAR(50),
    `odometer` INT NOT NULL,
    `price` DOUBLE NOT NULL
);

# ---------------------------------------------------------------------- #
# Add table "Dealerships"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `Dealerships` (
`dealership_id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
`address` VARCHAR(50) NOT NULL,
`phone` VARCHAR(12)
);

# ---------------------------------------------------------------------- #
# Add table "Inventory"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `Inventory` (
    `dealership_id` INT NOT NULL,
    `VIN` VARCHAR(17) NOT NULL,
    FOREIGN KEY (dealership_id) REFERENCES Dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Add table "Sales Contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `Sales_Contracts` (
    `contract_id` INT AUTO_INCREMENT PRIMARY KEY,
    `VIN` VARCHAR(17) NOT NULL,
    `sale_date` DATE,
    `price` DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Add table "Lease Contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `Lease_Contracts` (
    `contract_id` INT AUTO_INCREMENT PRIMARY KEY,
    `VIN` VARCHAR(17) NOT NULL, 
    `lease_start` DATE NOT NULL,
    `lease_end` DATE NOT NULL,
    `monthly_payment` DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #
INSERT INTO vehicles (VIN, make, model, year, SOLD, color, vehicleType, odometer, price) VALUES
('1HGCM82633A004352', 'Honda', 'Civic', 2020, FALSE, 'Blue', 'Sedan', 25000, 18000),
('1J4FA49S01P123456', 'Jeep', 'Wrangler', 2021, FALSE, 'Red', 'SUV', 15000, 35000),
('WAUZZZF41JA123789', 'Audi', 'A4', 2019, FALSE, 'White', 'Sedan', 33000, 24000),
('5YJ3E1EA7JF123111', 'Tesla', 'Model 3', 2022, FALSE, 'Black', 'Electric', 5000, 42000),
('1FTFW1EG5HFA12345', 'Ford', 'F-150', 2020, FALSE, 'Gray', 'Truck', 40000, 37000);

# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #
INSERT INTO dealerships (name, address, phone) VALUES
('Sunrise Auto Mall', '100 Main St', '555-111-2222'),
('Highway Motors', '250 Industrial Rd', '555-444-8888'),
('Premium Auto House', '980 Capital Ave', '555-666-7777');

# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A004352'),
(1, '1J4FA49S01P123456'),
(2, 'WAUZZZF41JA123789'),
(3, '5YJ3E1EA7JF123111'),
(2, '1FTFW1EG5HFA12345');

# ---------------------------------------------------------------------- #
# Add info into "Sales Contracts"                                        #
# ---------------------------------------------------------------------- #
INSERT INTO sales_contracts (VIN, sale_date, price) VALUES
('1HGCM82633A004352', '2024-01-18', 17500),
('WAUZZZF41JA123789', '2024-02-03', 23000);

# ---------------------------------------------------------------------- #
# Add info into "Lease Contracts"                                        #
# ---------------------------------------------------------------------- #
INSERT INTO lease_contracts (VIN, lease_start, lease_end, monthly_payment) VALUES
('1J4FA49S01P123456', '2024-01-01', '2026-01-01', 499.00),
('5YJ3E1EA7JF123111', '2024-03-01', '2027-03-01', 699.00);

