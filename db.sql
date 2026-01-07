CREATE DATABASE IF NOT EXISTS meta_futsal DEFAULT CHARSET=utf8mb4;
USE meta_futsal;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       fullname VARCHAR(100) NOT NULL,
                       email VARCHAR(150) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       phone VARCHAR(30)
);

CREATE TABLE fields (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        type VARCHAR(50),
                        price_per_hour DECIMAL(10,2) NOT NULL
);

CREATE TABLE bookings (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          user_id INT,
                          field_id INT,
                          booking_date DATE,
                          start_time TIME,
                          duration INT,
                          total_price DECIMAL(10,2),
                          FOREIGN KEY (user_id) REFERENCES users(id),
                          FOREIGN KEY (field_id) REFERENCES fields(id)
);

CREATE TABLE payments (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          booking_id INT,
                          method VARCHAR(50),
                          proof VARCHAR(255),
                          status VARCHAR(50),
                          FOREIGN KEY (booking_id) REFERENCES bookings(id)
);

INSERT INTO fields(name,type,price_per_hour) VALUES ('Meta Arena 1','Indoor',100000.00),('Meta Arena 2','Premium Indoor',150000.00);
