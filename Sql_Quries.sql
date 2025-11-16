--1️. Tickets sold online vs at stations each month.
SELECT 
    DATENAME(MONTH, purchase_date) AS Month,
    sale_channel,
    COUNT(ticket_id) AS Total_Tickets
FROM Tickets
GROUP BY DATENAME(MONTH, purchase_date), sale_channel
ORDER BY Month;

--2️. Total revenue from online vs station sales.
SELECT 
    sale_channel,
    SUM(price) AS Total_Revenue
FROM Tickets
GROUP BY sale_channel;

--3️.Total revenue per month.
SELECT 
    DATENAME(MONTH, purchase_date) AS Month,
    SUM(price) AS Monthly_Revenue
FROM Tickets
GROUP BY DATENAME(MONTH, purchase_date)
ORDER BY Month;

--4️. Payment methods generating highest revenue using JOIN.
SELECT 
    p.method_name,
    SUM(t.price) AS Total_Revenue
FROM Tickets t
JOIN Payment_Methods p ON t.payment_id = p.payment_id
GROUP BY p.method_name
ORDER BY Total_Revenue DESC;

--5️.Most profitable routes using JOIN and Aggregate.
SELECT 
    r.route_id,
    s1.station_name AS Start_Station,
    s2.station_name AS End_Station,
    SUM(t.price) AS Total_Revenue,
    rc.operational_cost,
    (SUM(t.price) - rc.operational_cost) AS Profit
FROM Tickets t
JOIN Routes r ON t.route_id = r.route_id
JOIN Stations s1 ON r.start_station_id = s1.station_id
JOIN Stations s2 ON r.end_station_id = s2.station_id
JOIN Route_Costs rc ON r.route_id = rc.route_id
GROUP BY r.route_id, s1.station_name, s2.station_name, rc.operational_cost
ORDER BY Profit DESC;

