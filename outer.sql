--1
SELECT
  p.name AS product_name,
  m.name AS manufacturer_name
FROM manufacturers m
LEFT JOIN products p ON p.manufacturer_id = m.id
ORDER BY m.name;
--2
SELECT c.name AS category_name
FROM categories c
LEFT JOIN products p ON p.category_id = c.id
WHERE p.id IS NULL;
--3
SELECT
  p.name AS product_name,
  d.delivery_date,
  s.name AS supplier_name
FROM suppliers s
LEFT JOIN deliveries d ON d.supplier_id = s.id
LEFT JOIN products p ON p.id = d.product_id
ORDER BY s.name, d.delivery_date;
--4
SELECT c.name AS category_name
FROM categories c
WHERE NOT EXISTS (
  SELECT 1
  FROM products p
  INNER JOIN suppliers s ON s.id = p.supplier_id
  WHERE p.category_id = c.id
    AND s.name = 'ООО "Ні Ю"'
);
--5
SELECT m.name AS manufacturer_name
FROM manufacturers m
WHERE NOT EXISTS (
  SELECT 1
  FROM products p
  INNER JOIN categories c ON c.id = p.category_id
  WHERE p.manufacturer_id = m.id
    AND c.name = 'Молочні'
);
