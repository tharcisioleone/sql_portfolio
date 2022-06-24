/* Author: Tharcisio Leone */
/* Database: Users */


		/********** 1. MANAGE DATABASES **********/

-- Creating the new database called myNewDB
CREATE DATABASE users; 

-- Visualize all the databases
SHOW DATABASES; 

-- Excluding the new database
DROP DATABASE users;


		/********** 2. TABLE USERS **********/

-- Creating table Users
CREATE TABLE Users ( 
  UserID INT, 
  LastName VARCHAR(255), 
  FirstName VARCHAR(255), 
  Address VARCHAR(255), 
  City VARCHAR(255)
);

-- Showing table with no values
SELECT * FROM Users;

-- Including a new column to the table
ALTER TABLE Users
ADD COLUMN Birthday DATE;

-- Excluding the created new column
ALTER TABLE Users 
DROP COLUMN Birthday;

-- Adding new columns to the table with string data
ALTER TABLE Users 
ADD COLUMN MiddleName VARCHAR(255),
ADD COLUMN Email VARCHAR(255),
ADD COLUMN Suffix VARCHAR(64), 
ADD COLUMN BadgeID VARCHAR(255);

-- Excluding columns NickName and Suffix
ALTER TABLE Users 
DROP COLUMN NickName, 
DROP COLUMN Suffix;

-- Renaming the columns
ALTER TABLE USERS 
RENAME COLUMN MiddleName TO Initial;

-- Showing all the columns and setting of the table
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'Users';




/********** 3. TABLE STUDENTS **********/

-- Creating table
CREATE TABLE Students
( 
  StudentID INT,
  StudentName VARCHAR(255), 
  Address VARCHAR(255), 
  City VARCHAR(255), 
  PostalCode VARCHAR(255), 
  Country VARCHAR(255)
);

-- Showing all the columns
SELECT * FROM Students;

-- Including the records of the variables
INSERT INTO Students(StudentID, StudentName, Address, City, PostalCode, Country)
VALUES(1, 'Jane Doe', '57 Union St', 'Glassgow', 'G13RB', 'Scotland');

-- Updating the records
UPDATE Students
SET City = 'Edinburgh';

-- Updating the records, but with check
UPDATE Students 
SET City = 'Edinburgh'
WHERE Country = 'Scotland';

-- Updating the records, but with double check
UPDATE Students 
SET City = 'Edinburgh', Country = 'Scotland' 
WHERE StudentID = 35;

-- Excluding records
DELETE FROM Students
WHERE Country = 'Scotland';

-- Excluding all the records in the table
DELETE FROM Students

