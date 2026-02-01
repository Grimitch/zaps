CREATE TABLE manufacturers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(100) NOT NULL,
  city VARCHAR(100),
  street VARCHAR(100)
);

CREATE TABLE suppliers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  category_id INT NOT NULL,
  manufacturer_id INT NOT NULL,
  supplier_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE deliveries (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT NOT NULL,
  supplier_id INT NOT NULL,
  delivery_date DATE NOT NULL,
  price DECIMAL(10,2) NOT NULL,     -- ціна поставки за одиницю
  quantity INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE sales (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT NOT NULL,
  sale_date DATE NOT NULL,
  price DECIMAL(10,2) NOT NULL,     -- ціна продажу за одиницю
  quantity INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id)
);
