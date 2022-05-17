CREATE DATABASE chuckle_hotel;

-- In database chuckle_hotel
CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL, description TEXT NOT NULL, price NUMERIC NOT NULL);
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60) NOT NULL, password VARCHAR(60) NOT NULL, username VARCHAR(60) NOT NULL);