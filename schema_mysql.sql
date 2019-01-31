DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE ecommerce;

USE `ecommerce`;

DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id INT NOT NULL AUTO_INCREMENT,
    email_id VARCHAR(500) NOT NULL UNIQUE,
    password  VARCHAR(1000) NOT NULL,
    PRIMARY KEY(id)
);

--By registering data inserted in the users table

DROP TABLE IF EXISTS profiles;

CREATE TABLE profiles(
id INT(50) NOT NULL,
fname VARCHAR(100) NOT NULL,
lname VARCHAR(100) NOT NULL,
age INT(50) NOT NULL,
mobile VARCHAR(50) NOT NULL,
created_date DATETIME NOT NULL,
modified_date DATETIME NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
order_id INT(50) NOT NULL AUTO_INCREMENT,
user_id INT(50) NOT NULL ,
created_date DATETIME NOT NULL,
PRIMARY KEY(order_id),
FOREIGN KEY (user_id) REFERENCES users(id));


DROP TABLE IF EXISTS products;

CREATE TABLE products (
  product_id INT(50) NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  created_date DATETIME NOT NULL,
  cost INT(100) NOT NULL,
  PRIMARY KEY(product_id)
  );


DROP TABLE IF EXISTS order_details;

CREATE TABLE order_details (
order_details_id INT(50) NOT NULL,
order_id INT(50) NOT NULL,
product_id INT(50) NOT NULL,
created_date DATETIME NOT NULL,
PRIMARY KEY(order_details_id),
FOREIGN KEY (order_id) REFERENCES orders (order_id),
FOREIGN KEY (product_id) REFERENCES products (product_id));



