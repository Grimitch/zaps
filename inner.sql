--1
SELECT p.name AS product_name, c.name AS category_name
FROM products p
INNER JOIN categories c ON c.id = p.category_id
INNER JOIN suppliers s ON s.id = p.supplier_id
WHERE s.name IN ('ООО "Паньки"', 'ООО "Які люди"');
--2
SELECT p.*, s.name AS supplier_name
FROM products p
INNER JOIN suppliers s ON s.id = p.supplier_id
INNER JOIN manufacturers m ON m.id = p.manufacturer_id
INNER JOIN categories c ON c.id = p.category_id
WHERE m.name NOT REGEXP '[АКМ]'
  AND c.name <> 'Крупи';
--3
SELECT
  p.name AS product_name,
  c.name AS category_name,
  s.name AS supplier_name,
  m.country AS manufacturer_country
FROM deliveries d
INNER JOIN products p ON p.id = d.product_id
INNER JOIN categories c ON c.id = p.category_id
INNER JOIN suppliers s ON s.id = d.supplier_id
INNER JOIN manufacturers m ON m.id = p.manufacturer_id
WHERE m.country NOT IN ('Україна', 'Молдова', 'Польща')
  AND d.price < 50
  AND d.delivery_date BETWEEN '2025-02-10' AND CURDATE();
--4
SELECT
  p.name AS product_name,
  c.name AS category_name,
  SUM(sa.quantity) AS total_sold,
  s.name AS supplier_name,
  m.name AS manufacturer_name,
  m.country
FROM sales sa
INNER JOIN products p ON p.id = sa.product_id
INNER JOIN categories c ON c.id = p.category_id
INNER JOIN suppliers s ON s.id = p.supplier_id
INNER JOIN manufacturers m ON m.id = p.manufacturer_id
WHERE c.name IN ('Кондитерські', 'Безалкогольні')
GROUP BY p.id, p.name, c.name, s.name, m.name, m.country
HAVING SUM(sa.quantity) > 100;
--5
SELECT
  p.name AS product_name,
  s.name AS supplier_name,
  c.name AS category_name,
  d.delivery_date,
  (d.price * d.quantity) AS total_delivery_cost
FROM deliveries d
INNER JOIN products p ON p.id = d.product_id
INNER JOIN suppliers s ON s.id = d.supplier_id
INNER JOIN categories c ON c.id = p.category_id
WHERE s.name IN ('Постачальник 1', 'Постачальник 2', 'Постачальник 3')
ORDER BY p.name ASC;
--6
SELECT
  p.name AS product_name,
  m.name AS manufacturer_name,
  CONCAT(m.country, ', ', m.city, ', ', m.street) AS full_address,
  c.name AS category_name,
  sa.sale_date,
  (sa.price * sa.quantity) AS total_sale_cost
FROM sales sa
INNER JOIN products p ON p.id = sa.product_id
INNER JOIN manufacturers m ON m.id = p.manufacturer_id
INNER JOIN categories c ON c.id = p.category_id
WHERE m.name NOT IN ('Виробник 1', 'Виробник 2')
ORDER BY total_sale_cost DESC;
