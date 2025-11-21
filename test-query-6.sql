SELECT d.name AS dealership, v.make, v.model, sc.sale_date, sc.price
FROM sales_contracts sc
JOIN vehicles v ON v.VIN = sc.VIN
JOIN inventory i ON i.VIN = sc.VIN
JOIN dealerships d ON d.dealership_id = i.dealership_id
WHERE d.dealership_id = 2
  AND sc.sale_date BETWEEN '2024-01-01' AND '2024-12-31';