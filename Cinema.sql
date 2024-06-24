-- Drop the database if it exists to start fresh
DROP DATABASE IF EXISTS cinema;

-- Create the cinema database
CREATE DATABASE cinema;

-- Switch to the cinema database
USE cinema;

-- Create the Customer table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(15),
    registration_date DATE NOT NULL
);

-- Create the Movie table
CREATE TABLE Movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    director VARCHAR(255) NOT NULL,
    cast TEXT,
    rating DECIMAL(2, 1)
);

-- Create the Genre table
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create the MovieGenre table
CREATE TABLE MovieGenre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    CONSTRAINT MovieGenre_movie_id_fk FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE,
    CONSTRAINT MovieGenre_genre_id_fk FOREIGN KEY (genre_id) REFERENCES Genre(genre_id) ON DELETE CASCADE
);

-- Create the Screening table
CREATE TABLE Screening (
    screening_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    screening_time DATETIME NOT NULL,
    hall VARCHAR(50),
    CONSTRAINT Screening_movie_id_fk FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) 
);

-- Create the Ticket table
CREATE TABLE Ticket (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    screening_id INT,
    seat VARCHAR(10),
    purchase_date DATETIME NOT NULL,
    CONSTRAINT Ticket_customer_id_fk FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    CONSTRAINT Ticket_screening_id_fk FOREIGN KEY (screening_id) REFERENCES Screening(screening_id) ON DELETE CASCADE
);

-- Create the Sale table
CREATE TABLE Sale (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    ticket_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    sale_date DATETIME NOT NULL,
    CONSTRAINT Sale_ticket_id_fk FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id) ON DELETE CASCADE
);

-- Create the SearchHistory table
CREATE TABLE SearchHistory (
    SH_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    query VARCHAR(255),
    search_date DATETIME NOT NULL,
    CONSTRAINT SearchHistory_customer_id_fk FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

-- Insert data into the Movie table
INSERT INTO Movie (title, release_date, director, cast, rating) VALUES
('The Matrix', '1999-03-31', 'Lana Wachowski, Lilly Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 8.7),
('Inception', '2010-07-16', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page', 8.8),
('The Dark Knight', '2008-07-18', 'Christopher Nolan', 'Christian Bale, Heath Ledger, Aaron Eckhart', 9.0),
('Pulp Fiction', '1994-10-14', 'Quentin Tarantino', 'John Travolta, Uma Thurman, Samuel L. Jackson', 8.9),
('Interstellar', '2014-11-07', 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway, Jessica Chastain', 8.6),
('The Shawshank Redemption', '1994-10-14', 'Frank Darabont', 'Tim Robbins, Morgan Freeman, Bob Gunton', 9.3),
('Fight Club', '1999-10-15', 'David Fincher', 'Brad Pitt, Edward Norton, Helena Bonham Carter', 8.8),
('Forrest Gump', '1994-07-06', 'Robert Zemeckis', 'Tom Hanks, Robin Wright, Gary Sinise', 8.8),
('Goodfellas', '1990-09-19', 'Martin Scorsese', 'Robert De Niro, Ray Liotta, Joe Pesci', 8.7),
('The Godfather', '1972-03-24', 'Francis Ford Coppola', 'Marlon Brando, Al Pacino, James Caan', 9.2),
('The Godfather: Part II', '1974-12-20', 'Francis Ford Coppola', 'Al Pacino, Robert De Niro, Robert Duvall', 9.0),
('The Lord of the Rings: The Return of the King', '2003-12-17', 'Peter Jackson', 'Elijah Wood, Viggo Mortensen, Ian McKellen', 8.9),
('Schindler''s List', '1994-12-15', 'Steven Spielberg', 'Liam Neeson, Ben Kingsley, Ralph Fiennes', 8.9),
('Inglourious Basterds', '2009-08-21', 'Quentin Tarantino', 'Brad Pitt, Christoph Waltz, Mélanie Laurent', 8.3),
('The Silence of the Lambs', '1991-02-14', 'Jonathan Demme', 'Jodie Foster, Anthony Hopkins, Scott Glenn', 8.6),
('Saving Private Ryan', '1998-07-24', 'Steven Spielberg', 'Tom Hanks, Matt Damon, Tom Sizemore', 8.6),
('The Departed', '2006-10-06', 'Martin Scorsese', 'Leonardo DiCaprio, Matt Damon, Jack Nicholson', 8.5),
('Gladiator', '2000-05-05', 'Ridley Scott', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen', 8.5),
('The Prestige', '2006-10-20', 'Christopher Nolan', 'Christian Bale, Hugh Jackman, Scarlett Johansson', 8.5),
('The Green Mile', '1999-12-10', 'Frank Darabont', 'Tom Hanks, Michael Clarke Duncan, David Morse', 8.6),
('The Usual Suspects', '1995-09-15', 'Bryan Singer', 'Kevin Spacey, Gabriel Byrne, Chazz Palminteri', 8.5),
('Memento', '2001-05-25', 'Christopher Nolan', 'Guy Pearce, Carrie-Anne Moss, Joe Pantoliano', 8.4),
('American History X', '1998-10-30', 'Tony Kaye', 'Edward Norton, Edward Furlong, Beverly D''Angelo', 8.5),
('The Sixth Sense', '1999-08-06', 'M. Night Shyamalan', 'Bruce Willis, Haley Joel Osment, Toni Collette', 8.1);

-- Insert data into the Genre table
INSERT INTO Genre (name) VALUES
('Action'),
('Adventure'),
('Comedy'),
('Crime'),
('Drama'),
('Fantasy'),
('Horror'),
('Mystery'),
('Romance'),
('Sci-Fi'),
('Thriller'),
('Animation'),
('Biography'),
('Documentary'),
('Family'),
('History'),
('Music'),
('Musical'),
('Sport'),
('War'),
('Western'),
('Superhero'),
('Spy'),
('Psychological'),
('Noir');

-- Insert data into the MovieGenre table
INSERT INTO MovieGenre (movie_id, genre_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 2), (2, 4), (2, 5),
(3, 3), (3, 6), (3, 7),
(4, 4), (4, 8), (4, 9),
(5, 5), (5, 10), (5, 11),
(6, 6), (6, 12), (6, 13),
(7, 7), (7, 14), (7, 15),
(8, 8), (8, 16), (8, 17),
(9, 9), (9, 18), (9, 19),
(10, 10), (10, 20), (10, 21),
(11, 1), (11, 2), (11, 3),
(12, 4), (12, 5), (12, 6),
(13, 7), (13, 8), (13, 9),
(14, 10), (14, 11), (14, 12),
(15, 13), (15, 14), (15, 15),
(16, 16), (16, 17), (16, 18),
(17, 19), (17, 20), (17, 21),
(18, 1), (18, 2), (18, 3),
(19, 4), (19, 5), (19, 6),
(20, 7), (20, 8), (20, 9),
(21, 10), (21, 11), (21, 12),
(22, 13), (22, 14), (22, 15),
(23, 16), (23, 17), (23, 18),
(24, 19), (24, 20), (24, 21);


-- Insert data into the Customer table
INSERT INTO Customer (name, email, phone, registration_date) VALUES
('John Doe', 'johndoe@example.com', '+1234567890', '2023-01-15'),
('Alice Smith', 'alice.smith@example.com', '+1987654321', '2023-02-20'),
('Bob Johnson', 'bob.johnson@example.com', '+1765432987', '2023-03-10'),
('Emily Brown', 'emily.brown@example.com', '+1654321890', '2023-04-05'),
('Michael Wilson', 'michael.wilson@example.com', '+1876543210', '2023-05-12'),
('Sophia Lee', 'sophia.lee@example.com', '+1987654321', '2023-06-18'),
('William Taylor', 'william.taylor@example.com', '+1876543210', '2023-07-22'),
('Olivia Martinez', 'olivia.martinez@example.com', '+1654321890', '2023-08-30'),
('James Garcia', 'james.garcia@example.com', '+1234567890', '2023-09-14'),
('Emma Robinson', 'emma.robinson@example.com', '+1987654321', '2023-10-05'),
('Daniel Hernandez', 'daniel.hernandez@example.com', '+1765432987', '2023-11-08'),
('Ava Lopez', 'ava.lopez@example.com', '+1654321890', '2023-12-17'),
('Alexander Hill', 'alexander.hill@example.com', '+1234567890', '2024-01-22'),
('Mia Scott', 'mia.scott@example.com', '+1876543210', '2024-02-04'),
('David Green', 'david.green@example.com', '+1654321890', '2024-03-09'),
('Ella Adams', 'ella.adams@example.com', '+1987654321', '2024-04-14'),
('Matthew Baker', 'matthew.baker@example.com', '+1234567890', '2024-05-18'),
('Sofia Hall', 'sofia.hall@example.com', '+1765432987', '2024-06-25'),
('Benjamin Young', 'benjamin.young@example.com', '+1987654321', '2024-07-30'),
('Chloe King', 'chloe.king@example.com', '+1654321890', '2024-08-05'),
('Jackson Wright', 'jackson.wright@example.com', '+1234567890', '2024-09-12'),
('Grace Clark', 'grace.clark@example.com', '+1876543210', '2024-10-17'),
('Lucas Adams', 'lucas.adams@example.com', '+1765432987', '2024-11-20'),
('Lily Turner', 'lily.turner@example.com', '+1654321890', '2024-12-25');

-- Insert data into the Screening table
INSERT INTO Screening (movie_id, screening_time, hall) VALUES
(1, '2024-07-01 18:00:00', 'Hall A'),
(2, '2024-07-02 15:30:00', 'Hall B'),
(3, '2024-07-03 20:00:00', 'Hall C'),
(4, '2024-07-04 19:15:00', 'Hall D'),
(5, '2024-07-05 17:45:00', 'Hall E'),
(6, '2024-07-06 21:00:00', 'Hall A'),
(7, '2024-07-07 16:30:00', 'Hall B'),
(8, '2024-07-08 19:00:00', 'Hall C'),
(9, '2024-07-09 18:45:00', 'Hall D'),
(10, '2024-07-10 20:30:00', 'Hall E'),
(11, '2024-07-11 17:15:00', 'Hall A'),
(12, '2024-07-12 15:45:00', 'Hall B'),
(13, '2024-07-13 18:00:00', 'Hall C'),
(14, '2024-07-14 21:30:00', 'Hall D'),
(15, '2024-07-15 16:00:00', 'Hall E'),
(16, '2024-07-16 19:45:00', 'Hall A'),
(17, '2024-07-17 20:15:00', 'Hall B'),
(18, '2024-07-18 17:30:00', 'Hall C'),
(19, '2024-07-19 15:45:00', 'Hall D'),
(20, '2024-07-20 18:30:00', 'Hall E'),
(21, '2024-07-21 21:00:00', 'Hall A'),
(22, '2024-07-22 16:45:00', 'Hall B'),
(23, '2024-07-23 19:15:00', 'Hall C'),
(24, '2024-07-24 20:30:00', 'Hall D'),
(25, '2024-07-25 17:00:00', 'Hall E');

-- Insert data into the Ticket table
INSERT INTO Ticket (customer_id, screening_id, seat, purchase_date) VALUES
(1, 1, 'A1', '2024-07-01 10:00:00'),
(2, 2, 'B3', '2024-07-02 11:15:00'),
(3, 3, 'C5', '2024-07-03 12:30:00'),
(4, 4, 'D2', '2024-07-04 13:45:00'),
(5, 5, 'E4', '2024-07-05 14:00:00'),
(6, 6, 'A3', '2024-07-06 15:30:00'),
(7, 7, 'B5', '2024-07-07 16:45:00'),
(8, 8, 'C1', '2024-07-08 17:00:00'),
(9, 9, 'D4', '2024-07-09 18:15:00'),
(10, 10, 'E2', '2024-07-10 19:30:00'),
(11, 11, 'A5', '2024-07-11 20:45:00'),
(12, 12, 'B2', '2024-07-12 21:00:00'),
(13, 13, 'C4', '2024-07-13 14:00:00'),
(14, 14, 'D3', '2024-07-14 15:15:00'),
(15, 15, 'E1', '2024-07-15 16:30:00'),
(16, 16, 'A4', '2024-07-16 17:45:00'),
(17, 17, 'B1', '2024-07-17 18:00:00'),
(18, 18, 'C3', '2024-07-18 19:15:00'),
(19, 19, 'D5', '2024-07-19 20:30:00'),
(20, 20, 'E3', '2024-07-20 21:45:00'),
(21, 21, 'A2', '2024-07-21 14:00:00'),
(22, 22, 'B4', '2024-07-22 15:15:00'),
(23, 23, 'C2', '2024-07-23 16:30:00'),
(24, 24, 'D1', '2024-07-24 17:45:00'),
(25, 25, 'E5', '2024-07-25 18:00:00');


-- Insert data into the Sale table
INSERT INTO Sale (ticket_id, amount, sale_date) VALUES
(1, 15.00, '2024-07-01 10:30:00'),
(2, 12.50, '2024-07-02 11:45:00'),
(3, 10.00, '2024-07-03 12:00:00'),
(4, 14.00, '2024-07-04 13:15:00'),
(5, 13.50, '2024-07-05 14:30:00'),
(6, 11.00, '2024-07-06 15:45:00'),
(7, 16.00, '2024-07-07 16:00:00'),
(8, 9.50, '2024-07-08 17:15:00'),
(9, 18.00, '2024-07-09 18:30:00'),
(10, 20.00, '2024-07-10 19:45:00'),
(11, 12.00, '2024-07-11 20:00:00'),
(12, 14.50, '2024-07-12 21:15:00'),
(13, 11.50, '2024-07-13 14:30:00'),
(14, 17.00, '2024-07-14 15:45:00'),
(15, 16.50, '2024-07-15 16:00:00'),
(16, 10.00, '2024-07-16 17:15:00'),
(17, 15.50, '2024-07-17 18:30:00'),
(18, 13.00, '2024-07-18 19:45:00'),
(19, 19.00, '2024-07-19 20:00:00'),
(20, 18.50, '2024-07-20 21:15:00'),
(21, 14.00, '2024-07-21 14:30:00'),
(22, 16.50, '2024-07-22 15:45:00'),
(23, 12.50, '2024-07-23 16:00:00'),
(24, 15.00, '2024-07-24 17:15:00'),
(25, 17.50, '2024-07-25 18:30:00');

-- Insert data into the SearchHistory table
INSERT INTO SearchHistory (customer_id, query, search_date) VALUES
(1, 'Action movies', '2024-07-01 10:30:00'),
(2, 'Comedy movies', '2024-07-02 11:45:00'),
(3, 'Drama movies', '2024-07-03 12:00:00'),
(4, 'Sci-fi movies', '2024-07-04 13:15:00'),
(5, 'Thriller movies', '2024-07-05 14:30:00'),
(6, 'Romantic movies', '2024-07-06 15:45:00'),
(7, 'Horror movies', '2024-07-07 16:00:00'),
(8, 'Family movies', '2024-07-08 17:15:00'),
(9, 'Adventure movies', '2024-07-09 18:30:00'),
(10, 'Animated movies', '2024-07-10 19:45:00'),
(11, 'Fantasy movies', '2024-07-11 20:00:00'),
(12, 'Documentary movies', '2024-07-12 21:15:00'),
(13, 'Action movies', '2024-07-13 14:30:00'),
(14, 'Comedy movies', '2024-07-14 15:45:00'),
(15, 'Drama movies', '2024-07-15 16:00:00'),
(16, 'Sci-fi movies', '2024-07-16 17:15:00'),
(17, 'Thriller movies', '2024-07-17 18:30:00'),
(18, 'Romantic movies', '2024-07-18 19:45:00'),
(19, 'Horror movies', '2024-07-19 20:00:00'),
(20, 'Family movies', '2024-07-20 21:15:00'),
(21, 'Adventure movies', '2024-07-21 14:30:00'),
(22, 'Animated movies', '2024-07-22 15:45:00'),
(23, 'Fantasy movies', '2024-07-23 16:00:00'),
(24, 'Documentary movies', '2024-07-24 17:15:00'),
(25, 'Action movies', '2024-07-25 18:30:00');
