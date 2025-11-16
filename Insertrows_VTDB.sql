--INSERT DATA for Virgin_Train_DB
INSERT INTO Stations (station_name, location) VALUES
('London Euston', 'London'),
('Birmingham New Street', 'Birmingham'),
('Manchester Piccadilly', 'Manchester'),
('Glasgow Central', 'Glasgow'),
('Liverpool Lime Street', 'Liverpool'),
('Preston', 'Lancashire'),
('Coventry', 'West Midlands'),
('Milton Keynes Central', 'Buckinghamshire');


--INSERT DATA for Routes
INSERT INTO Routes (start_station_id, end_station_id, distance_km) VALUES
(1, 2, 180.0),   -- London → Birmingham
(1, 3, 300.0),   -- London → Manchester
(1, 4, 640.0),   -- London → Glasgow
(1, 5, 350.0),   -- London → Liverpool
(2, 3, 140.0),   -- Birmingham → Manchester
(3, 4, 340.0),   -- Manchester → Glasgow
(2, 5, 160.0),   -- Birmingham → Liverpool
(6, 4, 320.0);   -- Preston → Glasgow


--INSERT DATA for Customers
INSERT INTO Customers (first_name, last_name, email, age) VALUES
('Emma', 'Brown', 'emma.brown@email.com', 28),
('Liam', 'Smith', 'liam.smith@email.com', 34),
('Sophia', 'Wilson', 'sophia.wilson@email.com', 41),
('Noah', 'Johnson', 'noah.johnson@email.com', 23),
('Olivia', 'Taylor', 'olivia.taylor@email.com', 36),
('Ethan', 'Anderson', 'ethan.anderson@email.com', 30),
('Ava', 'Harris', 'ava.harris@email.com', 27),
('Mason', 'White', 'mason.white@email.com', 39);


--INSERT DATA for Payment_Methods
INSERT INTO Payment_Methods (method_name) VALUES
('Credit Card'),
('Debit Card'),
('PayPal'),
('Apple Pay'),
('Cash');

--INSERT DATA for Tickets
INSERT INTO Tickets (customer_id, route_id, purchase_date, sale_channel, price, payment_id) VALUES
(1, 1, '2025-01-12', 'Online', 45.50, 1),
(2, 2, '2025-01-14', 'Station', 60.00, 5),
(3, 3, '2025-02-01', 'Online', 120.00, 2),
(4, 4, '2025-02-15', 'Online', 80.00, 3),
(5, 2, '2025-03-10', 'Online', 55.00, 1),
(6, 5, '2025-03-22', 'Station', 40.00, 5),
(7, 6, '2025-03-30', 'Online', 90.00, 4),
(8, 3, '2025-04-05', 'Station', 110.00, 2),
(1, 1, '2025-04-15', 'Online', 50.00, 3),
(2, 7, '2025-04-20', 'Station', 35.00, 5),
(3, 8, '2025-05-01', 'Online', 70.00, 1),
(4, 2, '2025-05-18', 'Online', 60.00, 4),
(5, 4, '2025-06-02', 'Station', 85.00, 5),
(6, 6, '2025-06-11', 'Online', 95.00, 2),
(7, 3, '2025-07-08', 'Online', 100.00, 1);


--INSERT DATA for Route_Costs
INSERT INTO Route_Costs (route_id, month, operational_cost) VALUES
(1, 'January', 15000.00),
(2, 'January', 20000.00),
(3, 'February', 30000.00),
(4, 'February', 22000.00),
(5, 'March', 12000.00),
(6, 'March', 18000.00),
(7, 'April', 11000.00),
(8, 'May', 16000.00);
