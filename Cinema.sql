
DROP DATABASE IF EXISTS cinema;
CREATE DATABASE cinema;

USE cinema;


CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(15)
);


CREATE TABLE Movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    director VARCHAR(255) NOT NULL,
    cast TEXT,
    rating DECIMAL(2, 1),
    price decimal(5,2)
);

CREATE TABLE Genre (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE MovieGenre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    CONSTRAINT MovieGenre_movie_id_fk FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE,
    CONSTRAINT MovieGenre_genre_id_fk FOREIGN KEY (genre_id) REFERENCES Genre(genre_id) ON DELETE CASCADE
);


CREATE TABLE Screening (
    screening_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    screening_time DATETIME NOT NULL,
    CONSTRAINT Screening_movie_id_fk FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) 
);  

CREATE TABLE Ticket (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    screening_id INT,
    seat VARCHAR(10),
    purchase_date DATETIME NOT NULL,
    CONSTRAINT Ticket_customer_id_fk FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    CONSTRAINT Ticket_screening_id_fk FOREIGN KEY (screening_id) REFERENCES Screening(screening_id) ON DELETE CASCADE
);

CREATE TABLE Sale (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    ticket_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    sale_date DATETIME NOT NULL,
    CONSTRAINT Sale_ticket_id_fk FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id) ON DELETE CASCADE
);


CREATE TABLE SearchHistory (
    SH_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    movie_id INT,
    query VARCHAR(255),
    search_date DATETIME NOT NULL,
    CONSTRAINT SearchHistory_customer_id_fk FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
  CONSTRAINT SearchHistory_movie_id_fk FOREIGN KEY (movie_id) REFERENCES Movie(Movie_id) ON DELETE CASCADE
);


INSERT INTO Movie (title, release_date, director, cast, rating,price) VALUES
('The Matrix', '1999-03-31', 'Lana Wachowski, Lilly Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 8.7,450.00),
('Inception', '2010-07-16', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page', 8.8,400.00),
('The Dark Knight', '2008-07-18', 'Christopher Nolan', 'Christian Bale, Heath Ledger, Aaron Eckhart', 9.0,500.00),
('Pulp Fiction', '1994-10-14', 'Quentin Tarantino', 'John Travolta, Uma Thurman, Samuel L. Jackson', 8.9,350.00),
('Interstellar', '2014-11-07', 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway, Jessica Chastain', 8.6,500.00),
('The Shawshank Redemption', '1994-10-14', 'Frank Darabont', 'Tim Robbins, Morgan Freeman, Bob Gunton', 9.3,450.00),
('Fight Club', '1999-10-15', 'David Fincher', 'Brad Pitt, Edward Norton, Helena Bonham Carter', 8.8,470.00),
('Forrest Gump', '1994-07-06', 'Robert Zemeckis', 'Tom Hanks, Robin Wright, Gary Sinise', 8.8,500.00),
('Goodfellas', '1990-09-19', 'Martin Scorsese', 'Robert De Niro, Ray Liotta, Joe Pesci', 8.7,350.00),
('The Godfather', '1972-03-24', 'Francis Ford Coppola', 'Marlon Brando, Al Pacino, James Caan', 9.2,500.00),
('The Godfather: Part II', '1974-12-20', 'Francis Ford Coppola', 'Al Pacino, Robert De Niro, Robert Duvall', 9.0,600.00),
('The Lord of the Rings: The Return of the King', '2003-12-17', 'Peter Jackson', 'Elijah Wood, Viggo Mortensen, Ian McKellen', 8.9,500.00),
('Schindler''s List', '1994-12-15', 'Steven Spielberg', 'Liam Neeson, Ben Kingsley, Ralph Fiennes', 8.9,300.00),
('Inglourious Basterds', '2009-08-21', 'Quentin Tarantino', 'Brad Pitt, Christoph Waltz, Mélanie Laurent', 8.3,450.00),
('The Silence of the Lambs', '1991-02-14', 'Jonathan Demme', 'Jodie Foster, Anthony Hopkins, Scott Glenn', 8.6,400.00),
('Saving Private Ryan', '1998-07-24', 'Steven Spielberg', 'Tom Hanks, Matt Damon, Tom Sizemore', 8.6,400.00),
('The Departed', '2006-10-06', 'Martin Scorsese', 'Leonardo DiCaprio, Matt Damon, Jack Nicholson', 8.5,350.00),
('Gladiator', '2000-05-05', 'Ridley Scott', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen', 8.5,620.00),
('The Prestige', '2006-10-20', 'Christopher Nolan', 'Christian Bale, Hugh Jackman, Scarlett Johansson', 8.5,500.00),
('The Green Mile', '1999-12-10', 'Frank Darabont', 'Tom Hanks, Michael Clarke Duncan, David Morse', 8.6,630.00),
('The Usual Suspects', '1995-09-15', 'Bryan Singer', 'Kevin Spacey, Gabriel Byrne, Chazz Palminteri', 8.5,700.00),
('Memento', '2001-05-25', 'Christopher Nolan', 'Guy Pearce, Carrie-Anne Moss, Joe Pantoliano', 8.4,650.00),
('American History X', '1998-10-30', 'Tony Kaye', 'Edward Norton, Edward Furlong, Beverly D''Angelo', 8.5,450.00),
('The Sixth Sense', '1999-08-06', 'M. Night Shyamalan', 'Bruce Willis, Haley Joel Osment, Toni Collette', 8.1,500.00);

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



INSERT INTO Customer (name, email, phone) VALUES
('Joe Mama', 'Jojomama@gmail.com', '+1234567890'),
('Walter White', 'DaOne.Who.Cooks2024h@gmail.com', '+1987654321'),
('Bob Johnson', 'bob.johnson@gmail.com', '+1765432987'),
('Emily Brown', 'emily.brown@gmail.com', '+1654321890'),
('Michael Wilson', 'michael.wilson@gmail.com', '+1876543210'),
('Sophia Lee', 'sophia.lee@gmail.com', '+1987654321'),
('William Taylor', 'william.taylor@gmail.com', '+1876543210'),
('Olivia Martinez', 'olivia.martinez@gmail.com', '+1654321890'),
('James Garcia', 'james.garcia@gmail.com', '+1234567890'),
('Emma Robinson', 'emma.robinson@gmail.com', '+1987654321' ),
('Daniel Hernandez', 'daniel.hernandez@gmail.com', '+1765432987'),
('Ava Lopez', 'ava.lopez@gmail.com', '+1654321890'),
('Alexander Hill', 'alexander.hill@gmail.com', '+1234567890'),
('Mia Scott', 'mia.scott@gmail.com', '+1876543210'),
('David Green', 'david.green@gmail.com', '+1654321890'),
('Ella Adams', 'ella.adams@gmail.com', '+1987654321'),
('Matthew Baker', 'matthew.baker@gmail.com', '+1234567890'),
('Sofia Hall', 'sofia.hall@gmail.com', '+1765432987'),
('Benjamin Young', 'benjamin.young@gmail.com', '+1987654321'),
('Chloe King', 'chloe.king@gmail.com', '+1654321890'),
('Jackson Wright', 'jackson.wright@gmail.com', '+1234567890'),
('Grace Clark', 'grace.clark@gmail.com', '+1876543210'),
('Lucas Adams', 'lucas.adams@gmail.com', '+1765432987'),
('Adolphus Hilter', 'Reich.Back@gmail.com', '+7544533256'),
('Mark Anthony', 'egypt.was.mine555@yahoo.com', '+667627870'),
('Allison White', 'Walter.White@gmail.com', '+154545730'),
('Jesoph Stanil', 'USSR.Rebord324@yahoo.com', '+1654321890'),
('Quenny Kimbetsu', 'queeny.things@gmail.com', '+76761890'),
('Gaeming Quanxi', 'Gae.mer435@gmail.com', '+54645390'),
('Levi Asher', 'Levi.4sher@gmail.com', '+554325390'),
('Jinshin Luofong', 'kuro.games23@gmail.com', '+43235390');
    

INSERT INTO Screening (movie_id, screening_time) VALUES
(1, '2024-07-01 18:00:00'),
(2, '2024-07-02 15:30:00'),
(3, '2024-07-03 20:00:00'),
(4, '2024-07-04 19:15:00'),
(5, '2024-07-05 17:45:00'),
(6, '2024-07-06 21:00:00'),
(7, '2024-07-07 16:30:00'),
(8, '2024-07-08 19:00:00'),
(9, '2024-07-09 18:45:00'),
(10, '2024-07-10 20:30:00'),
(11, '2024-07-11 17:15:00'),
(12, '2024-07-12 15:45:00'),
(13, '2024-07-13 18:00:00'),
(14, '2024-07-14 21:30:00'),
(15, '2024-07-15 16:00:00'),
(16, '2024-07-16 19:45:00'),
(17, '2024-07-17 20:15:00'),
(18, '2024-07-18 17:30:00'),
(19, '2024-07-19 15:45:00'),
(20, '2024-07-20 18:30:00'),
(21, '2024-07-21 21:00:00'),
(22, '2024-07-22 16:45:00'),
(23, '2024-07-23 15:20:00'),
(24, '2024-07-24 18:30:00');



INSERT INTO Ticket (customer_id, screening_id, seat, purchase_date) VALUES
(1, 1, 'D3', '2024-07-01 18:00:00'),
(2, 1, 'A5', '2024-07-01 18:00:00'),
(3, 1, 'C4', '2024-07-01 18:00:00'),
(4, 1, 'B3', '2024-07-01 18:00:00'),
(5, 1, 'A6', '2024-07-01 18:00:00'),

(1, 2, 'A3', '2024-07-02 15:30:00'),
(2, 2, 'A2', '2024-07-02 15:30:00'),
(3, 2, 'B6', '2024-07-02 15:30:00'),
(4, 2, 'C5', '2024-07-02 15:30:00'),
(5, 2, 'B8', '2024-07-02 15:30:00'),

(1, 3, 'A8', '2024-07-03 20:00:00'),
(2, 3, 'A1', '2024-07-03 20:00:00'),
(3, 3, 'B4', '2024-07-03 20:00:00'),
(4, 3, 'B6', '2024-07-03 20:00:00'),
(5, 3, 'B5', '2024-07-03 20:00:00'),
    
(6, 4, 'B3', '2024-07-04 19:15:00'),
(7, 4, 'B6', '2024-07-04 19:15:00'),
(8, 4, 'C1', '2024-07-04 19:15:00'),
(9, 4, 'A3', '2024-07-04 19:15:00'),
(10, 4, 'B5', '2024-07-04 19:15:00'),

(6, 5, 'C3', '2024-07-05 17:45:00'),
(7, 5, 'B8', '2024-07-05 17:45:00'),
(8, 5, 'A4', '2024-07-05 17:45:00'),
(9, 5, 'B4', '2024-07-05 17:45:00'),
(10, 5, 'B5', '2024-07-05 17:45:00'),

(6, 6, 'C4', '2024-07-06 21:00:00'),
(7, 6, 'C2', '2024-07-06 21:00:00'),
(8, 6, 'B1', '2024-07-06 21:00:00'),
(9, 6, 'B6', '2024-07-06 21:00:00'),
(10, 6, 'D5', '2024-07-06 21:00:00'),
    
(11, 7, 'A1', '2024-07-07 16:30:00'),
(12, 7, 'C8', '2024-07-07 16:30:00'),
(13, 7, 'B7', '2024-07-07 16:30:00'),
(14, 7, 'D1', '2024-07-07 16:30:00'),
(15, 7, 'A3', '2024-07-07 16:30:00'),

(11, 8, 'C5', '2024-07-08 19:00:00'),
(12, 8, 'D5', '2024-07-08 19:00:00'),
(13, 8, 'A4', '2024-07-08 19:00:00'),
(14, 8, 'A5', '2024-07-08 19:00:00'),
(15, 8, 'A8', '2024-07-08 19:00:00'),
    
(11, 9, 'C5', '2024-07-09 18:45:00'),
(12, 9, 'C8', '2024-07-09 18:45:00'),
(13, 9, 'B3', '2024-07-09 18:45:00'),
(14, 9, 'A6', '2024-07-09 18:45:00'),
(15, 9, 'B6', '2024-07-09 18:45:00'),
    
(16, 10, 'B1', '2024-07-10 20:30:00'),
(17, 10, 'D2', '2024-07-10 20:30:00'),
(18, 10, 'C3', '2024-07-10 20:30:00'),
(19, 10, 'A4', '2024-07-10 20:30:00'),
(20, 10, 'B5', '2024-07-10 20:30:00'),

(16, 11, 'A1', '2024-07-11 17:15:00'),
(17, 11, 'B5', '2024-07-11 17:15:00'),
(18, 11, 'C3', '2024-07-11 17:15:00'),
(19, 11, 'D5', '2024-07-11 17:15:00'),
(20, 11, 'D6', '2024-07-11 17:15:00'),

(16, 12, 'A3', '2024-07-12 15:45:00'),
(17, 12, 'A8', '2024-07-12 15:45:00'),
(18, 12, 'B7', '2024-07-12 15:45:00'),
(19, 12, 'B8', '2024-07-12 15:45:00'),
(20, 12, 'D5', '2024-07-12 15:45:00'),

    
(21, 13, 'A1', '2024-07-13 18:00:00'),
(22, 13, 'B2', '2024-07-13 18:00:00'),
(23, 13, 'C5', '2024-07-13 18:00:00'),
(24, 13, 'C4', '2024-07-13 18:00:00'),
(25, 13, 'D1', '2024-07-13 18:00:00'),


(21, 14, 'D3', '2024-07-14 21:30:00'),
(22, 14, 'C4', '2024-07-14 21:30:00'),
(23, 14, 'A3', '2024-07-14 21:30:00'),
(24, 14, 'A4', '2024-07-14 21:30:00'),
(25, 14, 'A5', '2024-07-14 21:30:00'),

(21, 15, 'C1', '2024-07-15 16:00:00'),
(22, 15, 'B2', '2024-07-15 16:00:00'),
(23, 15, 'C5', '2024-07-15 16:00:00'),
(24, 15, 'D1', '2024-07-15 16:00:00'),
(25, 15, 'C7', '2024-07-15 16:00:00'),

(1, 16, 'A3', '2024-07-16 19:45:00'),
(2, 16, 'A7', '2024-07-16 19:45:00'),
(3, 16, 'B4', '2024-07-16 19:45:00'),
(4, 16, 'C4', '2024-07-16 19:45:00'),
(5, 16, 'D5', '2024-07-16 19:45:00'),

(1, 17, 'A1', '2024-07-17 20:15:00'),
(2, 17, 'C6', '2024-07-17 20:15:00'),
(3, 17, 'C3', '2024-07-17 20:15:00'),
(4, 17, 'D4', '2024-07-17 20:15:00'),
(5, 17, 'A5', '2024-07-17 20:15:00'),

(1, 18, 'B1', '2024-07-17 20:15:00'),
(2, 18, 'B2', '2024-07-17 20:15:00'),
(3, 18, 'C1', '2024-07-17 20:15:00'),
(4, 18, 'D7', '2024-07-17 20:15:00'),
(5, 18, 'A8', '2024-07-17 20:15:00'),
    
(6, 19, 'B1', '2024-07-17 20:15:00'),
(7, 19, 'B2', '2024-07-17 20:15:00'),
(8, 19, 'C2', '2024-07-17 20:15:00'),
(9, 19, 'D4', '2024-07-17 20:15:00'),
(10, 19, 'D5', '2024-07-17 20:15:00'),

(6, 20, 'A1', '2024-07-20 18:30:00'),
(7, 20, 'B7', '2024-07-20 18:30:00'),
(8, 20, 'D3', '2024-07-20 18:30:00'),
(9, 20, 'C6', '2024-07-20 18:30:00'),
(10, 20, 'D5', '2024-07-20 18:30:00'),

(6, 21, 'A1', '2024-07-21 21:00:00'),
(7, 21, 'C7', '2024-07-21 21:00:00'),
(8, 21, 'A3', '2024-07-21 21:00:00'),
(9, 21, 'D2', '2024-07-21 21:00:00'),
(10, 21, 'D3', '2024-07-21 21:00:00'),
    
(11, 22, 'C5', '2024-07-21 21:00:00'),
(12, 22, 'B1', '2024-07-21 21:00:00'),
(13, 22, 'A3', '2024-07-21 21:00:00'),
(14, 22, 'D3', '2024-07-21 21:00:00'),
(15, 22, 'B6', '2024-07-21 21:00:00'),

(11, 23, 'C1', '2024-07-23 15:20:00'),
(12, 23, 'C2', '2024-07-23 15:20:00'),
(13, 23, 'D2', '2024-07-23 15:20:00'),
(14, 23, 'B8', '2024-07-23 15:20:00'),
(15, 23, 'B7', '2024-07-23 15:20:00'),
    
(11, 24, 'D1', '2024-07-23 15:20:00'),
(12, 24, 'D2', '2024-07-23 15:20:00'),
(13, 24, 'C6', '2024-07-23 15:20:00'),
(14, 24, 'C7', '2024-07-23 15:20:00'),
(15, 24, 'A4', '2024-07-23 15:20:00');



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
(22, 16.50, '2024-07-22 15:45:00');


INSERT INTO SearchHistory (customer_id, movie_id, search_date) VALUES
(1, 1, '2024-07-01 10:30:00'),
(2, 2, '2024-07-02 11:45:00'),
(3, 3, '2024-07-03 12:00:00'),
(4, 4, '2024-07-04 13:15:00'),
(5, 5, '2024-07-05 14:30:00'),
(6, 6, '2024-07-06 15:45:00'),
(7,7, '2024-07-07 16:00:00'),
(8,8, '2024-07-08 17:15:00'),
(9, 10, '2024-07-09 18:30:00'),
(10, 9, '2024-07-10 19:45:00'),
(11,12, '2024-07-11 20:00:00'),
(12,13, '2024-07-12 21:15:00'),
(13,11, '2024-07-13 14:30:00'),
(14, 15, '2024-07-14 15:45:00'),
(15, 14, '2024-07-15 16:00:00'),
(16,17, '2024-07-16 17:15:00'),
(17, 16, '2024-07-17 18:30:00'),
(18, 24, '2024-07-18 19:45:00'),
(19,23, '2024-07-19 20:00:00'),
(20, 22, '2024-07-20 21:15:00'),
(21, 11, '2024-07-21 14:30:00'),
(22, 15, '2024-07-22 15:45:00');
