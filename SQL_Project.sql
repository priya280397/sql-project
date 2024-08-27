
use emp;
CREATE TABLE Destinations10 (DestinationID INT PRIMARY KEY,Location VARCHAR(255),Price DECIMAL(10, 2));
desc destinations10;
insert into destinations10 values(1,'banglor',20000.00),(2,'bhutan',21000.00),(3,'rajastan',1000.00),(4,'kashmir',11000.00),(5,'manali',12000.00),
(6,'jaipur',13000.00),(7,'jodhpur',14000.00),(8,'gulmrg',15000.00),(9,'goa',16000.00),(10,'ooty',17000.00),(11,'kerla',18000.00),
(12,'ladakh',19000.00),(13,'shimla',9000.00),(14,'dubai',22000.00),(15,'bali',14000.00),(16,'europe',23000.00),(17,'turki',24000.00),(18,'munnar',25000.00),
(19,'malli',26000.00),(20,'malaysia',27000.00);
select * from destinations10;
CREATE TABLE Tours17 (TourID INT PRIMARY KEY,StartDate DATE,EndDate DATE,DestinationID INT,
    FOREIGN KEY (DestinationID) REFERENCES Destinations8(DestinationID));
    desc Tours17;
    insert into Tours17 values(11,'2023-01-12','2023-01-28',1),(12,'2023-01-11','2023-01-29',2),
    (13,'2023-01-14','2023-01-30',3),(14,'2023-01-15','2023-01-31',4),
    (15,'2023-01-16','2023-02-01',5),(16,'2023-01-17','2023-02-02',6),(17,'2023-01-18','2023-02-03',7),(18,'2023-01-19','2023-02-04',8),
    (19,'2023-01-20','2023-02-05',9),(20,'2023-01-21','2023-02-06',10),(21,'2023-01-22','2023-02-07',11),(22,'2023-01-23','2023-02-08',12),
    (23,'2023-01-24','2023-02-09',13),(24,'2023-01-25','2023-02-10',14),(25,'2023-01-26','2023-02-12',15),(26,'2023-01-27','2023-02-13',16),
    (27,'2023-01-28','2023-02-14',17),(28,'2023-01-29','2023-02-8',15),(29,'2023-01-30','2023-02-16',19),(30,'2023-01-31','2023-02-18',20);
    select * from tours17;
    CREATE TABLE Travelers8(TravelerID INT PRIMARY KEY,FirstName VARCHAR(50) NOT NULL,Email VARCHAR(100) UNIQUE,Phone bigint);
    desc travelers8;
insert into travelers8 values(101,'priya','priya@11gmail.com',9929232244),(102,'riya','riya@11gmail.com',9911221122),(103,'siya','siya@11gmail.com',9929232245),
(104,'piya','piya@11gmail.com',9567532244),(105,'jaya','jaya@11gmail.com',9929238214),(106,'abhi','abhi@11gmail.com',7099232244),(107,'avi','avi@11gmail.com',9987632244),
(108,'pooja','pooja@11gmail.com',7659232244),(109,'sneha','sneha@11gmail.com',9999322447),(110,'trupti','trupti@11gmail.com',9925432144),
(111,'paru','paru@11gmail.com',9876543844),(112,'suraj','suraj@11gmail.com',879232244),(113,'supriya','spriya@11gmail.com',9921232124),
(114,'aush','aush@11gmail.com',8723132244),(115,'swara','swara@11gmail.com',8919232244),(116,'sindhu','sindhu@11gmail.com',9765392244),
(117,'rama','rama@11gmail.com',9912321944),(118,'dada','dada@11gmail.com',9657814244),(119,'siyana','siyana@11gmail.com',9988888884),
(120,'maya','maya@11gmail.com',9257914244);
select * from Travelers8;


CREATE TABLE Booking13(BookingID INT PRIMARY KEY,TourID INT,TravelerID INT,BookingDate DATE,
    FOREIGN KEY (TourID) REFERENCES Tours15(TourID),FOREIGN KEY (TravelerID) REFERENCES Travelers6(TravelerID));
    desc booking13;
    insert into Booking13 values(1001,11,101,'2022-11-01'),(1002,12,102,'2022-11-02'),(1003,13,103,'2022-11-03'),(1004,14,104,'2022-11-04'),
    (1005,15,105,'2022-11-05'),(1006,16,106,'2022-11-06'),(1007,17,107,'2022-11-07'),(1008,18,108,'2022-11-08'),(1009,19,109,'2022-11-09'),
    (1010,20,110,'2022-11-10'),(1011,21,111,'2022-11-11'),(1012,22,112,'2022-11-12'),(1013,23,113,'2022-11-13'),(1014,24,114,'2022-11-14'),
    (1015,25,115,'2022-11-15'),(1016,26,116,'2022-11-16'),(1017,27,117,'2022-11-17'),(1018,28,118,'2023-11-18'),(1019,29,119,'2023-01-09'),
    (1020,30,102,'2023-01-02');
    select * from Booking13;
    


SELECT location FROM Destinations10 WHERE DestinationID IN (SELECT DestinationID FROM tours17 WHERE Price < 15000);
SELECT FirstName FROM Travelers7 WHERE TravelerID IN (SELECT TravelerID FROM Booking12 WHERE YEAR(BookingDate) = 2023);
SELECT FirstName FROM Travelers7 WHERE TravelerID In(SELECT  TravelerID FROM Booking12);


SELECT T.FirstName, B.BookingDate
FROM Travelers8 T
LEFT JOIN Booking13 B ON T.TravelerID = B.TravelerID;


SELECT D.Location, T.FirstName
FROM Destinations10 D
LEFT JOIN Tours17 ON D.DestinationID = Tours17.DestinationID
LEFT JOIN Booking13 B ON Tours17.TourID = B.TourID
LEFT JOIN Travelers8 T ON B.TravelerID = T.TravelerID;



SELECT T.FirstName, T.Email, B.BookingDate
FROM Travelers8 T
INNER JOIN Booking13 B ON T.TravelerID = B.TravelerID
WHERE YEAR(B.BookingDate) = 2023;



SELECT T.FirstName
FROM Travelers8 T
LEFT JOIN Booking13 B ON T.TravelerID = B.TravelerID
WHERE B.TourID IS NULL;




        


SELECT FirstName FROM Travelers6 WHERE TravelerID  not in(SELECT DISTINCT TravelerID FROM Booking9);


SELECT T.FirstName,  D.Location, T.Phone
FROM Travelers7 T
INNER JOIN Booking12 B ON T.TravelerID = B.TravelerID
INNER JOIN Tours16 ON B.TourID = Tours16.TourID
INNER JOIN Destinations9 D ON Tours16.DestinationID = D.DestinationID
LIMIT 20;







SELECT T.FirstName,  D.Location, T.Phone
FROM Travelers7 T
LEFT JOIN Booking12 B ON T.TravelerID = B.TravelerID
LEFT JOIN Tours16 ON B.TourID = Tours16.TourID
LEFT JOIN Destinations9 D ON Tours16.DestinationID = D.DestinationID;



SELECT T.FirstName,  D.Location, T.Phone
FROM Travelers6 T
RIGHT JOIN Booking11 B ON T.TravelerID = B.TravelerID
RIGHT JOIN Tours15 ON B.TourID = Tours15.TourID
RIGHT JOIN Destinations8 D ON Tours15.DestinationID = D.DestinationID;




SELECT T.FirstName, D.Location, T.Phone
FROM Travelers7 T
LEFT JOIN Booking12 B ON T.TravelerID = B.TravelerID
LEFT JOIN Tours16 ON B.TourID = Tours16.TourID
LEFT JOIN Destinations9 D ON Tours16.DestinationID = D.DestinationID

UNION

SELECT T.FirstName, D.Location, T.Phone
FROM Travelers6 T
RIGHT JOIN Booking11 B ON T.TravelerID = B.TravelerID
RIGHT JOIN Tours15 ON B.TourID = Tours15.TourID
RIGHT JOIN Destinations8 D ON Tours15.DestinationID = D.DestinationID;




use emp;
CREATE TABLE Destinations9 (DestinationID INT PRIMARY KEY,Location VARCHAR(255),Price DECIMAL(10, 2));
desc destinations9;
insert into destinations9 values(1,'banglor',20000.00),(2,'bhutan',21000.00),(3,'rajastan',1000.00),(4,'kashmir',11000.00),(5,'manali',12000.00),
(6,'jaipur',13000.00),(7,'jodhpur',14000.00),(8,'gulmrg',15000.00),(9,'goa',16000.00),(10,'ooty',17000.00),(11,'kerla',18000.00),
(12,'ladakh',19000.00),(13,'shimla',9000.00),(14,'dubai',22000.00),(15,'bali',14000.00),(16,'europe',23000.00),(17,'turki',24000.00),(18,'munnar',25000.00),
(19,'malli',26000.00),(20,'malaysia',27000.00);
select * from destinations9;
CREATE TABLE Tours16 (TourID INT PRIMARY KEY,StartDate DATE,EndDate DATE,DestinationID INT,
    FOREIGN KEY (DestinationID) REFERENCES Destinations8(DestinationID));
    desc Tours16;
    insert into Tours16 values(11,'2023-01-12','2023-01-28',1),(12,'2023-01-11','2023-01-29',2),
    (13,'2023-01-14','2023-01-30',3),(14,'2023-01-15','2023-01-31',4),
    (15,'2023-01-16','2023-02-01',5),(16,'2023-01-17','2023-02-02',6),(17,'2023-01-18','2023-02-03',7),(18,'2023-01-19','2023-02-04',8),
    (19,'2023-01-20','2023-02-05',9),(20,'2023-01-21','2023-02-06',10),(21,'2023-01-22','2023-02-07',11),(22,'2023-01-23','2023-02-08',12),
    (23,'2023-01-24','2023-02-09',13),(24,'2023-01-25','2023-02-10',14),(25,'2023-01-26','2023-02-12',15),(26,'2023-01-27','2023-02-13',16),
    (27,'2023-01-28','2023-02-14',17),(28,'2023-01-29','2023-02-15',18),(29,'2023-01-30','2023-02-16',19),(30,'2023-01-31','2023-02-18',20);
    select * from tours16;
    CREATE TABLE Travelers7(TravelerID INT PRIMARY KEY,FirstName VARCHAR(50) NOT NULL,Email VARCHAR(100) UNIQUE,Phone bigint);
    desc travelers7;
insert into travelers7 values(101,'priya','priya@11gmail.com',9929232244),(102,'riya','riya@11gmail.com',9911221122),(103,'siya','siya@11gmail.com',9929232245),
(104,'piya','piya@11gmail.com',9567532244),(105,'jaya','jaya@11gmail.com',9929238214),(106,'abhi','abhi@11gmail.com',7099232244),(107,'avi','avi@11gmail.com',9987632244),
(108,'pooja','pooja@11gmail.com',7659232244),(109,'sneha','sneha@11gmail.com',9999322447),(110,'trupti','trupti@11gmail.com',9925432144),
(111,'paru','paru@11gmail.com',9876543844),(112,'suraj','suraj@11gmail.com',879232244),(113,'supriya','spriya@11gmail.com',9921232124),
(114,'aush','aush@11gmail.com',8723132244),(115,'swara','swara@11gmail.com',8919232244),(116,'sindhu','sindhu@11gmail.com',9765392244),
(117,'rama','rama@11gmail.com',9912321944),(118,'dada','dada@11gmail.com',9657814244),(119,'siyana','siyana@11gmail.com',9988888884),
(120,'maya','maya@11gmail.com',9257914244);
select * from Travelers7;


CREATE TABLE Booking12(BookingID INT PRIMARY KEY,TourID INT,TravelerID INT,BookingDate DATE,
    FOREIGN KEY (TourID) REFERENCES Tours15(TourID),FOREIGN KEY (TravelerID) REFERENCES Travelers6(TravelerID));
    desc booking12;
    insert into Booking12 values(1001,11,101,'2022-11-01'),(1002,12,102,'2022-11-02'),(1003,13,103,'2022-11-03'),(1004,14,104,'2022-11-04'),
    (1005,15,105,'2022-11-05'),(1006,16,106,'2022-11-06'),(1007,17,107,'2022-11-07'),(1008,18,108,'2022-11-08'),(1009,19,109,'2022-11-09'),
    (1010,20,110,'2022-11-10'),(1011,21,111,'2022-11-11'),(1012,22,112,'2022-11-12'),(1013,23,113,'2022-11-13'),(1014,24,114,'2022-11-14'),
    (1015,25,115,'2022-11-15'),(1016,26,116,'2022-11-16'),(1017,27,117,'2022-11-17'),(1018,28,118,'2023-11-18'),(1019,29,119,'2023-01-09'),
    (1020,30,102,'2023-01-02');
    select * from Booking12;
    


SELECT location FROM Destinations9 WHERE DestinationID IN (SELECT DestinationID FROM tours16 WHERE Price < 15000);
SELECT FirstName FROM Travelers7 WHERE TravelerID IN (SELECT TravelerID FROM Booking12 WHERE YEAR(BookingDate) = 2023);
SELECT FirstName FROM Travelers7 WHERE TravelerID   in(SELECT  TravelerID FROM Booking12);




        


SELECT FirstName FROM Travelers6 WHERE TravelerID  not in(SELECT DISTINCT TravelerID FROM Booking9);


SELECT T.FirstName,  D.Location, T.Phone
FROM Travelers7 T
INNER JOIN Booking12 B ON T.TravelerID = B.TravelerID
INNER JOIN Tours16 ON B.TourID = Tours16.TourID
INNER JOIN Destinations9 D ON Tours16.DestinationID = D.DestinationID
LIMIT 20;







SELECT T.FirstName,  D.Location, T.Phone
FROM Travelers7 T
LEFT JOIN Booking12 B ON T.TravelerID = B.TravelerID
LEFT JOIN Tours16 ON B.TourID = Tours16.TourID
LEFT JOIN Destinations9 D ON Tours16.DestinationID = D.DestinationID;



SELECT T.FirstName,  D.Location, T.Phone
FROM Travelers6 T
RIGHT JOIN Booking11 B ON T.TravelerID = B.TravelerID
RIGHT JOIN Tours15 ON B.TourID = Tours15.TourID
RIGHT JOIN Destinations8 D ON Tours15.DestinationID = D.DestinationID;




SELECT T.FirstName, D.Location, T.Phone
FROM Travelers7 T
LEFT JOIN Booking12 B ON T.TravelerID = B.TravelerID
LEFT JOIN Tours16 ON B.TourID = Tours16.TourID
LEFT JOIN Destinations9 D ON Tours16.DestinationID = D.DestinationID

UNION

SELECT T.FirstName, D.Location, T.Phone
FROM Travelers6 T
RIGHT JOIN Booking11 B ON T.TravelerID = B.TravelerID
RIGHT JOIN Tours15 ON B.TourID = Tours15.TourID
RIGHT JOIN Destinations8 D ON Tours15.DestinationID = D.DestinationID;



SELECT T.FirstName, T.Email, B.BookingDate
FROM Travelers6 T
INNER JOIN Booking9 B ON T.TravelerID = B.TravelerID
WHERE YEAR(B.BookingDate) = 2022;
