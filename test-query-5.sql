SELECT DISTINCT d.name AS dealership
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON v.VIN = i.VIN
WHERE v.make  = 'Tesla'
  AND v.model = 'Model 3'
  AND v.color = 'Black';