drop database if EXISTS cinema;
CREATE DATABASE cinema;
USE cinema;

CREATE TABLE Movie (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    director VARCHAR(255) NOT NULL,
    cast TEXT,
    synopsis TEXT,
    rating DECIMAL(2, 1),
    critic_reviews TEXT
);

CREATE TABLE Genre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE MovieGenre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

CREATE TABLE Customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(15),
    registration_date DATE NOT NULL
);

CREATE TABLE Screening (
    id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    screening_time DATETIME NOT NULL,
    hall VARCHAR(50),
    FOREIGN KEY (movie_id) REFERENCES Movie(id)
);

CREATE TABLE Ticket (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    screening_id INT,
    seat VARCHAR(10),
    purchase_date DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (screening_id) REFERENCES Screening(id)
);

CREATE TABLE Sale (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ticket_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    sale_date DATETIME NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES Ticket(id)
);

CREATE TABLE SearchHistory (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    query VARCHAR(255),
    search_date DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);


 


