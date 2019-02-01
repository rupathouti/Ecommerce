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
id INT(50) NOT NULL AUTO_INCREMENT,
fname VARCHAR(100) ,
lname VARCHAR(100) ,
age INT(50) ,
mobile VARCHAR(50) ,
created_date DATETIME NOT NULL,
modified_date DATETIME NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
order_id INT(50) NOT NULL,
user_id INT(50) NOT NULL ,
created_date DATETIME NOT NULL,
PRIMARY KEY(order_id),
FOREIGN KEY (user_id) REFERENCES users(id));


DROP TABLE IF EXISTS products;

CREATE TABLE products (
  product_id INT(50) NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100) NOT NULL,
  created_date DATETIME NOT NULL,
  cost VARCHAR(100) NOT NULL,
  PRIMARY KEY(product_id)
  );

INSERT INTO products (product_name,cost,created_date) 
  VALUES ("OnePlus 6T (Mirror Black, 6GB RAM, 128GB Storage)","37,999","2019-02-01 09:19:18");

INSERT INTO products (product_name,cost,created_date) 
  VALUES ("Redmi Note 5 Pro (Blue, 6GB RAM, 64GB Storage)","15,960","2019-02-01 09:19:18");

INSERT INTO products (product_name,cost,created_date) 
  VALUES ("Canon EOS 1500D 24.1MP Digital SLR Camera (Black) with 18-55 and 55-250mm is II Lens, 16GB Card and Carry Case","38,900","2019-02-01 09:19:18");

INSERT INTO products (product_name,cost,created_date) 
  VALUES ("Huawei ERS-B19 Band 2 Classic Activity Tracker (Black)","4,749","2019-02-01 09:19:18");

INSERT INTO products (product_name,cost,created_date) 
  VALUES ("Samsung Gear Sport Smartwatch (Black)","14,878","2019-02-01 09:19:18");

INSERT INTO products (product_name,cost,created_date) 
  VALUES ("Sony MP-CD1 Compact Pocket Size Mobile Projector (Black)","28,859","2019-02-01 09:19:18");

INSERT INTO products (product_name,cost,created_date) 
  VALUES ("JBL EON610 10-inch Powered Speaker (Black)","38,450","2019-02-01 09:19:18");

INSERT INTO products (product_name,cost,created_date) 
  VALUES ("Samsung 108 cm (43 Inches) Series 7 4K UHD LED Smart TV UA43NU7100 (Black) (2018 model)","53,540","2019-02-01 09:19:18");


INSERT INTO products (product_name,cost,created_date) 
  VALUES ("Apple iPad(6th Gen) Tablet (9.7 inch, 32GB, Wi-Fi), Space Grey","26,880","2019-02-01 09:19:18");


INSERT INTO products (product_name,cost,created_date) 
  VALUES ("Zebronics BT6590RUCF 5.1 Channel Multimedia Speakers","3,599","2019-02-01 09:19:18");


DROP TABLE IF EXISTS order_details;

CREATE TABLE order_details (
order_details_id INT(50) NOT NULL,
order_id INT(50) NOT NULL,
product_id INT(50) NOT NULL,
created_date DATETIME NOT NULL,
PRIMARY KEY(order_details_id),
FOREIGN KEY (order_id) REFERENCES orders (order_id),
FOREIGN KEY (product_id) REFERENCES products (product_id));



