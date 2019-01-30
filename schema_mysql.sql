
CREATE DATABASE `ecommerce`;

USE `ecommerce`;

DROP TABLE IF EXISTS users;

CREATE TABLE users(
id INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
email_id VARCHAR(100) NOT NULL UNIQUE,
password VARCHAR(100) NOT NULL);


DROP TABLE IF EXISTS profiles;

CREATE TABLE profiles(
id INT(50) PRIMARY KEY NOT NULL,
fname VARCHAR(100) NOT NULL,
lname VARCHAR(100) NOT NULL,
age INT(50) NOT NULL,
mobile VARCHAR(50) NOT NULL,
created_date DATETIME NOT NULL,
modified_date DATETIME NOT NULL,
customer_id INT NOT NULL);

  

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
order_id INT(50) PRIMARY_KEY NOT NULL,
customer_id INT(50) NOT NULL ,
created_date DATETIME NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers(id));


DROP TABLE IF EXISTS order_details;

CREATE TABLE order_details (
order_details_id INT(50) NOT NULL PRIMARY_KEY = TRUE,
order_id INT(50) NOT NULL PRIMARY_KEY = TRUE,
product_id INT(50) NOT NULL PRIMARY_KEY = TRUE,
created_date DATETIME NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders (order_id),
FOREIGN KEY (product_id) REFERENCES products (product_id));



DROP TABLE IF EXISTS products;

CREATE TABLE products (
  product_id INT(50) NOT NULL PRIMARY_KEY = TRUE,
  product_name VARCHAR(100) NOT NULL,
  created_date DATETIME NOT NULL,
  cost INT(100) NOT NULL)



