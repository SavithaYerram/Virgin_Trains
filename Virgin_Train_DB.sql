CREATE DATABASE Virgin_Train_DB;
GO

USE Virgin_Train_DB;
GO
CREATE TABLE Stations (
    station_id INT IDENTITY(1,1) PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(150)
);

CREATE TABLE Routes (
    route_id INT IDENTITY(1,1) PRIMARY KEY,
    start_station_id INT NOT NULL,
    end_station_id INT NOT NULL,
    distance_km DECIMAL(6,2) CHECK (distance_km > 0),

    CONSTRAINT FK_Routes_StartStation 
        FOREIGN KEY (start_station_id) REFERENCES Stations(station_id),
    CONSTRAINT FK_Routes_EndStation 
        FOREIGN KEY (end_station_id) REFERENCES Stations(station_id)
);

CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 0)
);
CREATE TABLE Payment_Methods (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Tickets (
    ticket_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    route_id INT NOT NULL,
    purchase_date DATE NOT NULL,
    sale_channel VARCHAR(20) CHECK (sale_channel IN ('Online', 'Station')),
    price DECIMAL(10,2) CHECK (price > 0),
    payment_id INT NOT NULL,

    CONSTRAINT FK_Tickets_Customer 
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT FK_Tickets_Route 
        FOREIGN KEY (route_id) REFERENCES Routes(route_id),
    CONSTRAINT FK_Tickets_Payment 
        FOREIGN KEY (payment_id) REFERENCES Payment_Methods(payment_id)
);

CREATE TABLE Route_Costs (
    cost_id INT IDENTITY(1,1) PRIMARY KEY,
    route_id INT NOT NULL,
    month VARCHAR(20) NOT NULL,
    operational_cost DECIMAL(12,2) CHECK (operational_cost >= 0),

    CONSTRAINT FK_RouteCosts_Route 
        FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);
