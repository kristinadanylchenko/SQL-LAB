DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
USE company;

CREATE TABLE IF NOT EXISTS department (
  department_id INT NOT NULL,
  department_name VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL DEFAULT 'Lviv',
  street VARCHAR(50) NOT NULL,
  building_no INT,
  PRIMARY KEY (department_id)
);

CREATE TABLE IF NOT EXISTS employee (
  employee_id INT NOT NULL,
  user_name VARCHAR(30) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  position VARCHAR(30) NOT NULL,
  employment_date DATE NOT NULL,
  department_id INT,
  manager_id INT,
  rate FLOAT NOT NULL,
  bonus FLOAT,
  PRIMARY KEY (employee_id),
  UNIQUE (user_name)
);

CREATE TABLE IF NOT EXISTS product (
  product_id INT NOT NULL,
  product_name VARCHAR(40) NOT NULL,
  product_description VARCHAR(150) NOT NULL,
  category VARCHAR(15) NOT NULL,
  manufacture VARCHAR(30) NOT NULL,
  product_type VARCHAR(15) NOT NULL,
  amount INT NOT NULL,
  price FLOAT NOT NULL,
  PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS customer (
  customer_id INT AUTO_INCREMENT NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  gender VARCHAR(1) NOT NULL,
  birth_date DATE NOT NULL,
  phone_number BIGINT NOT NULL,
  email VARCHAR(50) NOT NULL,
  discount INT NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS invoice (
  invoice_id BIGINT NOT NULL,
  employee_id INT NOT NULL,
  customer_id INT,
  payment_method INT NOT NULL,
  transaction_moment DATETIME NOT NULL,
  status VARCHAR(10) NOT NULL,
  PRIMARY KEY (invoice_id)
);

CREATE TABLE IF NOT EXISTS orders (
  orders_id INT AUTO_INCREMENT NOT NULL,
  product_id INT NOT NULL,
  invoice_id BIGINT NOT NULL,
  order_datetime DATETIME NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (orders_id)
);

ALTER TABLE employee
  ADD CONSTRAINT employee_fk6 FOREIGN KEY (department_id) REFERENCES department(department_id);

ALTER TABLE employee
  ADD CONSTRAINT employee_fk7 FOREIGN KEY (manager_id) REFERENCES employee(employee_id);

ALTER TABLE invoice
  ADD CONSTRAINT invoice_fk1 FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

ALTER TABLE invoice
  ADD CONSTRAINT invoice_fk2 FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE orders
  ADD CONSTRAINT orders_fk2 FOREIGN KEY (product_id) REFERENCES product(product_id);

ALTER TABLE orders
  ADD CONSTRAINT orders_fk4 FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);

INSERT INTO department (department_id, department_name, city, street, building_no) VALUES
(1, 'Sales', 'Lviv', 'Shevchenka', 10),
(2, 'IT',    'Lviv', 'Horodotska', 25),
(3, 'HR',    'Lviv', 'Bandery',    7);

INSERT INTO employee (employee_id, user_name, first_name, last_name, position, employment_date, department_id, manager_id, rate, bonus) VALUES
(1, 'admin', 'Ivan',   'Petrenko', 'Manager', '2022-01-10', 1, NULL, 20000, 3000),
(2, 'user2', 'Oksana', 'Ivanenko', 'Seller',  '2022-02-15', 1, 1,    15000, 1500),
(3, 'user3', 'Taras',  'Koval',    'HR',      '2022-03-01', 3, 1,    16000, 1000);

INSERT INTO customer (first_name, last_name, gender, birth_date, phone_number, email, discount) VALUES
('Anna',   'Koval',  'F', '2003-05-12', 380971112233, 'anna@gmail.com',   5),
('Andrii', 'Bondar', 'M', '2001-11-03', 380931234567, 'andrii@gmail.com', 10);

INSERT INTO product (product_id, product_name, product_description, category, manufacture, product_type, amount, price) VALUES
(42, 'Phone',  'Smartphone',      'Tech', 'Samsung', 'Device', 100, 12000),
(73, 'Laptop', 'Notebook',        'Tech', 'HP',      'Device',  50, 25000),(86, 'TV',     'Smart TV',        'Tech', 'LG',      'Device',  30, 22000),
(80, 'Tablet', 'Android tablet',  'Tech', 'Lenovo',  'Device',  40, 11000),
(15, 'Mouse',  'Wireless mouse',  'Tech', 'Logitech','Access', 200,   900),
(61, 'Watch',  'Smart watch',     'Tech', 'Xiaomi',  'Device',  70,  3500),
(68, 'Camera', 'Digital camera',  'Tech', 'Canon',   'Device',  15, 18000),
(48, 'Printer','Laser printer',   'Tech', 'HP',      'Device',  20,  8000);

INSERT INTO invoice (invoice_id, employee_id, customer_id, payment_method, transaction_moment, status) VALUES
(20220902081028, 1, 1, 1, '2022-09-02 14:18:33', 'PAID'),
(20220903091341, 2, 2, 2, '2022-09-03 09:13:41', 'PAID'),
(20220904085624, 2, 1, 1, '2022-09-04 08:56:24', 'PAID'),
(20220905010747, 1, 2, 2, '2022-09-05 01:07:47', 'PAID'),
(20220906092712, 3, 1, 1, '2022-09-06 09:27:12', 'PAID');

INSERT INTO orders (product_id, invoice_id, order_datetime, quantity) VALUES
(42, 20220902081028, '2022-09-02 14:18:33', 1),
(42, 20220902081028, '2022-09-02 16:46:07', 2),
(73, 20220902081028, '2022-09-02 16:46:07', 1),
(86, 20220903091341, '2022-09-03 09:13:41', 3),
(80, 20220903091341, '2022-09-03 16:25:38', 4),
(15, 20220904085624, '2022-09-04 08:56:24', 5),
(61, 20220905010747, '2022-09-05 10:17:47', 4),
(42, 20220905010747, '2022-09-05 11:08:51', 4),
(42, 20220905010747, '2022-09-05 16:38:11', 3),
(68, 20220906092712, '2022-09-06 09:27:12', 5),
(48, 20220906092712, '2022-09-06 09:40:47', 5);

SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM customer;
SELECT * FROM product;
SELECT * FROM invoice;
SELECT * FROM orders;