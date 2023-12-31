﻿Create Database Solmaris


Use Solmaris

CREATE TABLE Location(
LocationNum VARCHAR(50) PRIMARY KEY,
LocationName VARCHAR(50),
Address VARCHAR(50),
City VARCHAR(50),
State CHAR(2),
PostalCode INT
)


CREATE TABLE Owner(
OwnerNum VARCHAR(50) PRIMARY KEY,
LastName VARCHAR(50),
FirstName VARCHAR(50),
Address VARCHAR(50),
City VARCHAR(50),
State CHAR(2),
PostalCode INT
)
--Number 1
Query: Select OwnerNum, FirstName, LastName FROM Owner;

--Number 2
Query: Select CondoID FROM CondoUnit WHERE SqrFt > 1200;

--Number 3
Query: Select LastName, FirstName, Address FROM Owner WHERE city = 'Bowton';

--Number 4
Query: Select Owner.LastName, Owner.FirstName, Owner.City FROM CondoUnit JOIN Owner ON Owner.OwnerNum = CondoUnit.OwnerNum GROUP BY Owner.LastName,
Owner.FirstName, Owner.City HAVING COUNT(CondoUnit.OwnerNum) > 1;

--Number 5
Query: Select Owner.LastName, Owner.FirstName, Owner.City FROM CondoUnit JOIN Owner ON 
Owner.OwnerNum = CondoUnit.OwnerNum WHERE CondoFee < 200;

--Number 6
Query: Select UnitNum FROM CondoUnit WHERE LocationNum = 2;

--NUMBER 7
SELECT Owner.LastName, Owner.FirstName, CondoUnit.UnitNum FROM ServiceRequest
INNER JOIN CondoUnit ON
ServiceRequest.CondoID = CondoUnit.CondoID
JOIN Owner ON
Owner.OwnerNum = CondoUnit.OwnerNum
WHERE Status = 'Open' OR Status = 'Scheduled';

--NUMBER 8
SELECT CondoUnit.LocationNum, CondoUnit.UnitNum, CondoUnit.OwnerNum FROM
ServiceRequest
INNER JOIN CondoUnit ON
ServiceRequest.CondoID = CondoUnit.CondoID
WHERE Status = 'Open' OR Status = 'Scheduled'
GROUP BY CondoUnit.LocationNum, CondoUnit.UnitNum, CondoUnit.OwnerNum
HAVING COUNT(CondoUnit.CondoID) > 1

--Number 9
SELECT CondoUnit.CondoID, CondoUnit.SqrFt FROM ServiceRequest
JOIN CondoUnit ON
ServiceRequest.CondoID = CondoUnit.CondoID
WHERE ServiceRequest.CategoryNum = 3;

--NUMBER 10
SELECT CondoUnit.CondoID, Owner.LastName, Owner.FirstName FROM ServiceRequest
JOIN CondoUnit ON
ServiceRequest.CondoID = CondoUnit.CondoID
JOIN Owner ON
CondoUnit.OwnerNum = Owner.OwnerNum
WHERE ServiceRequest.CategoryNum = 5;

CREATE TABLE CondoUnit(
CondoID INT NOT NULL PRIMARY KEY,
LocationNum INT,
UnitNum INT,
SqrFt INT,
Bdrms INT,
Baths INT,
CondoFee money,
OwnerNum INT,
CONSTRAINT FK_LocationNum
FOREIGN KEY (LocationNum)

REFERENCES Location(LocationNum),
CONSTRAINT FK_OwnerNum

FOREIGN KEY (OwnerNum)
REFERENCES Owner(OwnerNum)
);



CREATE TABLE ServiceCategory(
CategoryNum INT NOT NULL PRIMARY KEY,
CategoryDescription VARCHAR(50)
);

CREATE TABLE ServiceRequest(
ServiceID INT NOT NULL PRIMARY KEY,
CondoID INT,
CategoryNum INT,
Description VARCHAR(200),
Status VARCHAR(200),
EstHours INT,
SpentHours INT,
NextServiceDate DATE,
CONSTRAINT FK_CondoID
FOREIGN KEY (CondoID)
REFERENCES CondoUnit(CondoID),
CONSTRAINT FK_CategoryNum
FOREIGN KEY (CategoryNum)
REFERENCES ServiceCategory(CategoryNum)
)


SELECT * FROM Location;
INSERT INTO Location
VALUES (2, 'Solmaris Bayside', '405 Bayside Blvd.', 'Glander Bay', 'FL', 31044);
ALTER TABLE Owner
ALTER COLUMN OwnerNum VARCHAR(50) NOT NULL;
ALTER TABLE CondoUnit 
ADD CONSTRAINT FK_OwnerNum
FOREIGN KEY (OwnerNum)
REFERENCES Owner(OwnerNum);
ALTER TABLE CondoUnit
ALTER COLUMN UnitNum VARCHAR(10)


SELECT * FROM Owner
INSERT INTO Owner
VALUES('AD057', 'Adney', 'Bruce and Jean', '100 Ocean Ave.', 'Bowton', 'FL',
31313);
INSERT INTO Owner
VALUES('AN175', 'Anderson', 'Bill', '18 Wilcox St.', 'Brunswick', 'GA', 31522);
INSERT INTO Owner
VALUES('BL720', 'Blake', 'Jack', '2672 Condor St.', 'Mills', 'SC', 29707);
INSERT INTO Owner
VALUES('EL025', 'Elend', 'Bill and Sandy', '100 Ocean Ave.', 'Bowton', 'FL',
31313);
INSERT INTO Owner
VALUES('FE182', 'Feenstra', 'Daniel', '7822 Coventry Dr.', 'Rivard', 'FL', 31062);
INSERT INTO Owner
VALUES('JU092', 'Juarez', 'Maria', '892 Oak St.', 'Kaleva', 'FL', 31521);
INSERT INTO Owner
VALUES('KE122', 'Kelly', 'Alyssa', '527 Waters St.', 'Norton', 'MI', 49441);
INSERT INTO Owner
VALUES('NO225', 'Norton', 'Peter and Caitlin', '281 Lakewood Ave.', 'Lawndale',
'PA', 19111);
INSERT INTO Owner
VALUES('RO123', 'Robinson', 'Mike and Jane', '900 Spring Lake Dr.', 'Springs',
'MI', 49456);
INSERT INTO Owner
VALUES('SM072', 'Smeltz', 'Jim and Cathy', '922 Garland Dr.', 'Lewiston', 'FL',
32765);
INSERT INTO Owner
VALUES('TR222', 'Trent', 'Michael', '405 Bayside Blvd.', 'Glander Bay', 'FL',
31044);
INSERT INTO Owner
VALUES('WS032', 'Wilson', 'Henry and Karen', '25 Nichols St.', 'Lewiston', 'FL',
32765);

SELECT * FROM CondoUnit
INSERT INTO CondoUnit
VALUES(1, 1, 102, 675, 1, 1, 475, 'AD057');
INSERT INTO CondoUnit
VALUES(2, 1, '201', 1030, 2, 1, 550, 'EL025');
INSERT INTO CondoUnit
VALUES(3, 1, '306', 1575, 3, 2, 625, 'AN175');
INSERT INTO CondoUnit
VALUES(4, 1, '204', 1164, 2, 2, 575, 'BL720');
INSERT INTO CondoUnit
VALUES(5, 1, '405', 1575, 3, 2, 625, 'FE182');
INSERT INTO CondoUnit
VALUES(6, 1, '401', 1030, 2, 2, 550, 'KE122');
INSERT INTO CondoUnit
VALUES(7, 1, '502', 745, 1, 1, 490, 'JU092');
INSERT INTO CondoUnit
VALUES(8, 1, '503', 1680, 3, 3, 670, 'RO123');
INSERT INTO CondoUnit
VALUES(9, 2, 'A03', 725, 1, 1, 190, 'TR222');
INSERT INTO CondoUnit
VALUES(10, 2, 'A01', 1084, 2, 1, 235, 'NO225');
INSERT INTO CondoUnit
VALUES(11, 2, 'B01', 1084, 2, 2, 250, 'SM072');
INSERT INTO CondoUnit
VALUES(12, 2, 'C01', 750, 1, 1, 190, 'AN175');
INSERT INTO CondoUnit
VALUES(13, 2, 'C02', 1245, 2, 2, 250, 'WS032');
INSERT INTO CondoUnit
VALUES(14, 2, 'C06', 1540, 3, 2, 300, 'RO123');


SELECT * FROM ServiceCategory
INSERT INTO ServiceCategory
VALUES(1, 'Plumbing')
INSERT INTO ServiceCategory
VALUES(2, 'Heating/Air Conditioning')
INSERT INTO ServiceCategory
VALUES(3, 'Painting')
INSERT INTO ServiceCategory
VALUES(4, 'Electrical Systems')
INSERT INTO ServiceCategory
VALUES(5, 'Carpentry')
INSERT INTO ServiceCategory
VALUES(6, 'Janitorial')

SELECT Owner.LastName, Owner.FirstName, Owner.City FROM CondoUnit
JOIN Owner ON
Owner.OwnerNum = CondoUnit.OwnerNum
GROUP BY Owner.LastName, Owner.FirstName, Owner.City
HAVING COUNT(CondoUnit.OwnerNum) > 1;
SELECT Owner.LastName, Owner.FirstName, Owner.City FROM CondoUnit
JOIN Owner ON
Owner.OwnerNum = CondoUnit.OwnerNum
WHERE CondoFee < 200;
SELECT * FROM ServiceRequest
INSERT INTO ServiceRequest
VALUES(1, 2, 1, 'Back wall in pantry has mold indicating water seepage...',
'Service rep has verified the problem.', 4, 2, '10/12/2015')
INSERT INTO ServiceRequest
VALUES(2, 5, 2, 'Air conditioning doesnt cool',
'Service rep has verified the problem.', 3, 1, '10/12/2015')
INSERT INTO ServiceRequest
VALUES(3, 4, 6, 'Hardwood floors must be refinished',
'Service call has been scheduled', 8, 0, '10/16/2015')
INSERT INTO ServiceRequest
VALUES(4, 1, 4, 'Switches in kitchen and adjoining dining room are reversed',
'Open', 1, 0, '10/13/2015')
INSERT INTO ServiceRequest
VALUES(5, 2, 5, 'Molding in pantry must be replaced.',
'Cannot schedule until water leak is corrected', 2, 0, NULL)
INSERT INTO ServiceRequest
VALUES(6, 14, 3, 'Unit needs to be repainted due to previous tenant damage',
'Scheduled', 7, 0, '10/19/2015')
INSERT INTO ServiceRequest
VALUES(7, 11, 4, 'Tenant complained that using microwave caused short circuits on
two occasions',
'Service Rep unable to duplicate problem...', 1, 1, NULL)
INSERT INTO ServiceRequest
VALUES(8, 9, 3, 'Kitched must be repainted. Walls discolored due to kitchen fire',
'Scheduled', 5, 0, '10/16/2015')
INSERT INTO ServiceRequest
VALUES(9, 7, 6, 'Shampoo all carpets',
'Open', 5, 0, '10/19/2015')
INSERT INTO ServiceRequest
VALUES(10, 9, 5, 'Repair window sills',
'Scheduled', 4, 0, '10/20/2015')



