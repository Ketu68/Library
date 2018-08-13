/* ---------------------------------------- CREATE AND POPULATE LIBRARY DATABASE ------------------------------- */
CREATE DATABASE db_Library  /* If does not exist - Create it  */
USE db_Library

IF Exists (SELECT 1 FROM INFORMATION_SCHEMA.TABLES tbl_LIBRARY_BRANCH)
	DROP TABLE tbl_LIBRARY_BRANCH, tbl_BOOK_COPIES, tbl_BOOK_LOANS, tbl_BORROWER, tbl_BOOK, tbl_PUBLISHER, tbl_BOOK_AUTHOR

BEGIN TRY	/*  Check if the tables already exist.  If not - Create them.  If so - just skip  */
    CREATE TABLE tbl_LIBRARY_BRANCH(BranchID INT NOT NULL PRIMARY KEY, BranchName VARCHAR(50), Address VARCHAR(50))
	CREATE TABLE tbl_BOOK(BookID INT NOT NULL PRIMARY KEY, Title VARCHAR(100), Publisher_Name VARCHAR(50))
	CREATE TABLE tbl_BOOK_LOANS(BookID INT FOREIGN KEY REFERENCES tbl_BOOK(BookID), BranchID INT, CardNo INT, DateOut DATE, DueDate DATE)
	CREATE TABLE tbl_BOOK_COPIES(BookID INT FOREIGN KEY REFERENCES tbl_BOOK(BookID), BranchID INT, No_Of_Copies INT)
	CREATE TABLE tbl_BORROWER(CardNo INT, Name VARCHAR(50), Address VARCHAR(50), Phone VARCHAR(12))
	CREATE TABLE tbl_PUBLISHER(Name VARCHAR(50) NOT NULL PRIMARY KEY, Address VARCHAR(50), Phone VARCHAR(12))
	CREATE TABLE tbl_BOOK_AUTHOR(BookID INT FOREIGN KEY REFERENCES tbl_BOOK(BookID), AuthorName VARCHAR(50))
END TRY  
BEGIN CATCH  
     PRINT 'Could not create tables or tables already exist.'
END CATCH  

--/* Insert data into Library Branch Tables  */

INSERT INTO tbl_LIBRARY_BRANCH VALUES (1,'Sharpstown Branch','123 Pineapple Dr')
INSERT INTO tbl_LIBRARY_BRANCH VALUES (2,'Southside Branch','123 Maple St')
INSERT INTO tbl_LIBRARY_BRANCH VALUES (3,'Central Branch','123 Elm St')
INSERT INTO tbl_LIBRARY_BRANCH VALUES (4,'Northside Branch','123 Poplar St')

/* Insert data into Book Tables  */

INSERT INTO tbl_BOOK VALUES (1,'The Lost Tribe','Pendant Publishing')
INSERT INTO tbl_BOOK VALUES (2,'Carrie','Trident Publishing')
INSERT INTO tbl_BOOK VALUES (3,'The Shining','Trident Publishing')
INSERT INTO tbl_BOOK VALUES (4,'Book4','Pendant Publishing')
INSERT INTO tbl_BOOK VALUES (5,'Book5','Pendant Publishing')
INSERT INTO tbl_BOOK VALUES (6,'Book6','Pendant Publishing')
INSERT INTO tbl_BOOK VALUES (7,'Book7','Trident Publishing')
INSERT INTO tbl_BOOK VALUES (8,'Book8','Trident Publishing')
INSERT INTO tbl_BOOK VALUES (9,'Book9','Trident Publishing')
INSERT INTO tbl_BOOK VALUES (10,'Book10','Pendant Publishing')
INSERT INTO tbl_BOOK VALUES (11,'Book11','Pendant Publishing')
INSERT INTO tbl_BOOK VALUES (12,'Book12','Trident Publishing')
INSERT INTO tbl_BOOK VALUES (13,'Book13','Trident Publishing')
INSERT INTO tbl_BOOK VALUES (14,'Book14','Pendant Publishing')
INSERT INTO tbl_BOOK VALUES (15,'Book15','Pendant Publishing')
INSERT INTO tbl_BOOK VALUES (16,'Book16','Trident Publishing')
INSERT INTO tbl_BOOK VALUES (17,'Book17','Trident Publishing')
INSERT INTO tbl_BOOK VALUES (18,'Book18','Pendant Publishing')
INSERT INTO tbl_BOOK VALUES (19,'Book19','Pendant Publishing')
INSERT INTO tbl_BOOK VALUES (20,'Book20','Pendant Publishing')

--/* Insert data into Book Copies Tables  */

INSERT INTO tbl_BOOK_COPIES VALUES (1,1,2)
INSERT INTO tbl_BOOK_COPIES VALUES (2,1,2)
INSERT INTO tbl_BOOK_COPIES VALUES (3,1,2)
INSERT INTO tbl_BOOK_COPIES VALUES (4,1,2)
INSERT INTO tbl_BOOK_COPIES VALUES (5,1,2)
INSERT INTO tbl_BOOK_COPIES VALUES (6,1,2)
INSERT INTO tbl_BOOK_COPIES VALUES (7,1,2)
INSERT INTO tbl_BOOK_COPIES VALUES (8,1,2)
INSERT INTO tbl_BOOK_COPIES VALUES (9,1,2)
INSERT INTO tbl_BOOK_COPIES VALUES (10,1,2)
INSERT INTO tbl_BOOK_COPIES VALUES (11,2,2)
INSERT INTO tbl_BOOK_COPIES VALUES (12,2,2)
INSERT INTO tbl_BOOK_COPIES VALUES (13,2,2)
INSERT INTO tbl_BOOK_COPIES VALUES (14,2,2)
INSERT INTO tbl_BOOK_COPIES VALUES (15,2,2)
INSERT INTO tbl_BOOK_COPIES VALUES (16,2,2)
INSERT INTO tbl_BOOK_COPIES VALUES (17,2,2)
INSERT INTO tbl_BOOK_COPIES VALUES (18,2,2)
INSERT INTO tbl_BOOK_COPIES VALUES (19,2,2)
INSERT INTO tbl_BOOK_COPIES VALUES (20,2,2)
INSERT INTO tbl_BOOK_COPIES VALUES (1,3,2)
INSERT INTO tbl_BOOK_COPIES VALUES (2,3,2)
INSERT INTO tbl_BOOK_COPIES VALUES (3,3,2)
INSERT INTO tbl_BOOK_COPIES VALUES (4,3,2)
INSERT INTO tbl_BOOK_COPIES VALUES (5,3,2)
INSERT INTO tbl_BOOK_COPIES VALUES (6,3,2)
INSERT INTO tbl_BOOK_COPIES VALUES (7,3,2)
INSERT INTO tbl_BOOK_COPIES VALUES (8,3,2)
INSERT INTO tbl_BOOK_COPIES VALUES (9,3,2)
INSERT INTO tbl_BOOK_COPIES VALUES (10,3,2)
INSERT INTO tbl_BOOK_COPIES VALUES (11,4,2)
INSERT INTO tbl_BOOK_COPIES VALUES (12,4,2)
INSERT INTO tbl_BOOK_COPIES VALUES (13,4,2)
INSERT INTO tbl_BOOK_COPIES VALUES (14,4,2)
INSERT INTO tbl_BOOK_COPIES VALUES (15,4,2)
INSERT INTO tbl_BOOK_COPIES VALUES (16,4,2)
INSERT INTO tbl_BOOK_COPIES VALUES (17,4,2)
INSERT INTO tbl_BOOK_COPIES VALUES (18,4,2)
INSERT INTO tbl_BOOK_COPIES VALUES (19,4,2)
INSERT INTO tbl_BOOK_COPIES VALUES (20,4,2)

--/* Insert data into Borrower Tables  */

INSERT INTO tbl_BORROWER VALUES (100,'Jim Beam','123 Avenue A','111-22-3333')
INSERT INTO tbl_BORROWER VALUES (101,'Jack Daniels','123 Avenue B','121-22-3333')
INSERT INTO tbl_BORROWER VALUES (102,'John Smith','123 Avenue C','131-22-3333')
INSERT INTO tbl_BORROWER VALUES (103,'Jack Jones','123 Avenue D','141-22-3333')
INSERT INTO tbl_BORROWER VALUES (104,'Remi Martin','123 Avenue E','511-22-3333')
INSERT INTO tbl_BORROWER VALUES (105,'Trevor Noah','123 Avenue F','611-22-3333')
INSERT INTO tbl_BORROWER VALUES (106,'Rick Springfield','123 Avenue G','171-22-3333')
INSERT INTO tbl_BORROWER VALUES (107,'Teddy D Bear','123 Avenue H','811-22-3333')

--/* Insert data into Book Loans Tables  */

INSERT INTO tbl_BOOK_LOANS VALUES (1,1,101,'10/01/18','11/01/18')
INSERT INTO tbl_BOOK_LOANS VALUES (2,1,101,'07/01/18','08/02/18')
INSERT INTO tbl_BOOK_LOANS VALUES (3,1,102,'07/01/18','08/02/18')
INSERT INTO tbl_BOOK_LOANS VALUES (4,1,103,'10/04/18','11/04/18')
INSERT INTO tbl_BOOK_LOANS VALUES (5,1,104,'01/01/00','01/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (6,1,105,'01/01/00','01/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (7,1,106,'01/01/00','02/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (8,1,107,'10/08/18','11/08/18')

INSERT INTO tbl_BOOK_LOANS VALUES (11,2,101,'10/01/18','11/01/18')
INSERT INTO tbl_BOOK_LOANS VALUES (12,2,101,'07/01/18','08/02/18')
INSERT INTO tbl_BOOK_LOANS VALUES (13,2,102,'07/01/18','08/02/18')
INSERT INTO tbl_BOOK_LOANS VALUES (14,2,103,'10/04/18','11/04/18')
INSERT INTO tbl_BOOK_LOANS VALUES (15,2,104,'01/01/00','01/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (16,2,105,'01/01/00','01/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (17,2,106,'01/01/00','02/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (18,2,107,'10/08/18','11/08/18')

INSERT INTO tbl_BOOK_LOANS VALUES (1,3,101,'10/01/18','11/01/18')
INSERT INTO tbl_BOOK_LOANS VALUES (2,3,101,'07/01/18','08/02/18')
INSERT INTO tbl_BOOK_LOANS VALUES (3,3,102,'07/01/18','08/02/18')
INSERT INTO tbl_BOOK_LOANS VALUES (4,3,103,'10/04/18','11/04/18')
INSERT INTO tbl_BOOK_LOANS VALUES (5,3,104,'01/01/00','01/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (6,3,105,'01/01/00','01/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (7,3,106,'01/01/00','02/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (8,3,107,'10/08/18','11/08/18')

INSERT INTO tbl_BOOK_LOANS VALUES (11,4,101,'10/01/18','11/01/18')
INSERT INTO tbl_BOOK_LOANS VALUES (12,4,101,'07/01/18','08/02/18')
INSERT INTO tbl_BOOK_LOANS VALUES (13,4,102,'07/01/18','08/02/18')
INSERT INTO tbl_BOOK_LOANS VALUES (14,4,103,'10/04/18','11/04/18')
INSERT INTO tbl_BOOK_LOANS VALUES (15,4,104,'01/01/00','01/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (16,4,105,'01/01/00','01/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (17,4,106,'01/01/00','02/01/00')
INSERT INTO tbl_BOOK_LOANS VALUES (18,4,107,'10/08/18','11/08/18')

/* Insert data into Publisher Tables  */

INSERT INTO tbl_PUBLISHER VALUES ('Trident Publishing', '123 Blackrock Ave', '212-545-1234')
INSERT INTO tbl_PUBLISHER VALUES ('Pendant Publishing', '456 Whitestone Dr', '424-431-9876')
INSERT INTO tbl_PUBLISHER VALUES ('Publisher 3', '123 Ave A', '212-111-2222')
INSERT INTO tbl_PUBLISHER VALUES ('Publisher 4', '456 Ave B', '424-222-3333')
INSERT INTO tbl_PUBLISHER VALUES ('Publisher 5', '123 Ave C', '212-333-4444')
INSERT INTO tbl_PUBLISHER VALUES ('Publisher 6', '456 Ave D', '424-444-5555')

/* Insert data into Book Author Tables  */

INSERT INTO tbl_BOOK_AUTHOR VALUES (1, 'Stephen King')
INSERT INTO tbl_BOOK_AUTHOR VALUES (2, 'Dean Koontz')
INSERT INTO tbl_BOOK_AUTHOR VALUES (3, 'Jerry Seinfeld')
INSERT INTO tbl_BOOK_AUTHOR VALUES (4, 'Abraham Lincoln')
INSERT INTO tbl_BOOK_AUTHOR VALUES (5, 'Whiskey Pete')
INSERT INTO tbl_BOOK_AUTHOR VALUES (6, 'Bobby Flay')
INSERT INTO tbl_BOOK_AUTHOR VALUES (7, 'Michael Symon')
INSERT INTO tbl_BOOK_AUTHOR VALUES (8, 'Kirk Douglas')
INSERT INTO tbl_BOOK_AUTHOR VALUES (9, 'Captain Kirk')
INSERT INTO tbl_BOOK_AUTHOR VALUES (10, 'Doctor Spock')

/* ---------------------------------------------- QUERIES --------------------------------------------- */     

/* 1) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?  */

SELECT * FROM tbl_BOOK
INNER JOIN tbl_BOOK_COPIES ON tbl_BOOK_COPIES.BookID = tbl_BOOK.BookID
INNER JOIN tbl_LIBRARY_BRANCH ON tbl_LIBRARY_BRANCH.BranchID = tbl_BOOK_COPIES.BranchID
WHERE tbl_BOOK.Title = 'The Lost Tribe' AND tbl_LIBRARY_BRANCH.BranchName = 'Sharpstown Branch'

/* 2) How many copies of the book titled "The Lost Tribe" are owned by each library branch? */

SELECT * FROM tbl_BOOK_COPIES
INNER JOIN tbl_BOOK ON tbl_BOOK_COPIES.BookID = tbl_BOOK.BookID AND tbl_BOOK.Title = 'The Lost Tribe'
INNER JOIN tbl_LIBRARY_BRANCH ON tbl_LIBRARY_BRANCH.BranchID = tbl_BOOK_COPIES.BranchID
WHERE tbl_BOOK.Title = 'The Lost Tribe'

/* 3) Retrieve the names of all borrowers who do not have any books checked out. */

SELECT Name FROM tbl_BORROWER
FULL OUTER JOIN tbl_BOOK_LOANS ON tbl_BOOK_LOANS.CardNo = tbl_BORROWER.CardNo
WHERE tbl_BOOK_LOANS.CardNo IS NULL

/* 4) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. */

SELECT tbl_BOOK.Title, tbl_BORROWER.Name, tbl_BORROWER.Address FROM tbl_BORROWER
INNER JOIN tbl_BOOK_LOANS ON tbl_BORROWER.CardNo = tbl_BOOK_LOANS.CardNo
INNER JOIN tbl_BOOK ON tbl_BOOK.BookID = tbl_BOOK_LOANS.BookID
INNER JOIN tbl_LIBRARY_BRANCH ON tbl_BOOK_LOANS.BranchID = tbl_LIBRARY_BRANCH.BranchID
WHERE tbl_BOOK_LOANS.DueDate = '08/02/2018'

/* 5) For each library branch, retrieve the branch name and the total number of books loaned out from that branch. */

SELECT COUNT(*) AS BOOKSOUT, tbl_LIBRARY_BRANCH.BranchName FROM tbl_LIBRARY_BRANCH
INNER JOIN tbl_BOOK_LOANS ON tbl_BOOK_LOANS.BranchID = tbl_LIBRARY_BRANCH.BranchID
GROUP BY tbl_LIBRARY_BRANCH.BranchName

/* 6) Retrieve the names, addresses, and the number of books checked out for all borrowers who have > 5 books checked out */

SELECT * FROM tbl_BOOK_LOANS

SELECT COUNT(tbl_BORROWER.CardNo), tbl_BORROWER.Name, tbl_BORROWER.Address
FROM tbl_BORROWER
INNER JOIN tbl_BOOK_LOANS ON tbl_BOOK_LOANS.CardNo = tbl_BORROWER.CardNo
GROUP BY tbl_BORROWER.Name, tbl_BORROWER.Address 
HAVING COUNT(tbl_BORROWER.CardNo) > 4

/* 7) For each book authored by "Stephen King", retrieve the title and number of copies owned by library branch "Central". */

SELECT tbl_BOOK.Title, tbl_BOOK_COPIES.No_Of_Copies, tbl_BOOK_AUTHOR.AuthorName, tbl_LIBRARY_BRANCH.BranchName FROM tbl_BOOK_AUTHOR
INNER JOIN tbl_BOOK ON tbl_BOOK.BookID = tbl_BOOK_AUTHOR.BookID
INNER JOIN tbl_BOOK_COPIES ON tbl_BOOK_COPIES.BookID = tbl_BOOK_AUTHOR.BookID
INNER JOIN tbl_LIBRARY_BRANCH ON tbl_LIBRARY_BRANCH.BranchID = tbl_BOOK_COPIES.BranchID
WHERE tbl_BOOK_AUTHOR.AuthorName = 'Stephen King' AND tbl_LIBRARY_BRANCH.BranchName = 'Central Branch'