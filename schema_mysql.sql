DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE ecommerce;

USE `ecommerce`;

select * from users

DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id INT NOT NULL AUTO_INCREMENT,
    email_id VARCHAR(500) NOT NULL UNIQUE,
    password  VARCHAR(1000) NOT NULL,
    PRIMARY KEY(id)
);



DROP TABLE IF EXISTS profiles;

CREATE TABLE profiles(
id INT NOT NULL AUTO_INCREMENT,
fname VARCHAR(100) ,
lname VARCHAR(100) ,
age INT ,
mobile VARCHAR(50) ,
created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
modified_date DATETIME ON UPDATE CURRENT_TIMESTAMP,
user_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
id INT NOT NULL,
user_id INT NOT NULL ,
created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(id),
FOREIGN KEY (user_id) REFERENCES users(id));


DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(250) NOT NULL,
  created_date DATETIME DEFAULT CURRENT_TIMESTAMP ,
  modified_date DATETIME ON UPDATE CURRENT_TIMESTAMP,
  cost INT NOT NULL DEFAULT 0,
  PRIMARY KEY(id)
  );

INSERT INTO products (product_name,cost) 
  VALUES ("OnePlus 6T (Mirror Black, 6GB RAM, 128GB Storage)",37000);

INSERT INTO products (product_name,cost) 
  VALUES ("Redmi Note 5 Pro (Blue, 6GB RAM, 64GB Storage)",37000);

INSERT INTO products (product_name,cost) 
  VALUES ("Canon EOS 1500D 24.1MP Digital SLR Camera (Black) with 18-55 and 55-250mm is II Lens, 16GB Card and Carry Case",37000);

INSERT INTO products (product_name,cost) 
  VALUES ("Huawei ERS-B19 Band 2 Classic Activity Tracker (Black)",37000);

INSERT INTO products (product_name,cost) 
  VALUES ("Samsung Gear Sport Smartwatch (Black)",37000);

INSERT INTO products (product_name,cost) 
  VALUES ("Sony MP-CD1 Compact Pocket Size Mobile Projector (Black)",37000);

INSERT INTO products (product_name,cost) 
  VALUES ("JBL EON610 10-inch Powered Speaker (Black)",37000);

INSERT INTO products (product_name,cost) 
  VALUES ("Samsung 108 cm (43 Inches) Series 7 4K UHD LED Smart TV UA43NU7100 (Black) (2018 model)",37000);


INSERT INTO products (product_name,cost) 
  VALUES ("Apple iPad(6th Gen) Tablet (9.7 inch, 32GB, Wi-Fi), Space Grey",37000);


INSERT INTO products (product_name,cost) 
  VALUES ("Zebronics BT6590RUCF 5.1 Channel Multimedia Speakers",37000);
  
INSERT INTO products (product_name, cost) values ("dellllll ", 45);

INSERT INTO products (product_name,cost) 
  VALUES ("Samsung Washing Machine ",7855);

select * from products;
DROP TABLE IF EXISTS order_details;

CREATE TABLE order_details (
id INT NOT NULL,
order_id INT NOT NULL,
product_id INT NOT NULL,
created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(id),
FOREIGN KEY (order_id) REFERENCES orders (id),
FOREIGN KEY (product_id) REFERENCES products (id));


select * from products

CREATE DEFINER=`root`@`localhost` PROCEDURE `test`(IN cnt int)
BEGIN
select * from products;
END
