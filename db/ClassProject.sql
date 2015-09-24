/*

SQL Objects for Advanced Systems
09/16/2015

CRUD (C)reate, (R)ead (Select), (U)pdate, (D)Delete
are the primary operations within SQL

To execute SQL Statments - highlight with mouse and choose Execute (or F5) - be careful - if you choose F5 or execute
without selecting text then it will run all statements 

Note: Some instances of SQL are case sensitive - the default is not case sensitive

*/

-- Create the Tables
-- Each table needs a primary key and we prefer to have identity(1,1) means start with 1 and increment by 1

create table Clients
(
ClientID int identity(1,1) primary key not null,
Name varchar(100),
DateJoined datetime,
Email varchar(255),
PassW varchar(100)
)

create table Chaperones
(
ChaperoneID int identity(1,1) primary key not null,
Name varchar(100),
DateJoined datetime,
Email varchar(255),
PassW varchar(100)
)

create table Transactions
(
TransID int identity(1,1) primary key not null,
ClientID int,
ChaperoneID int,
RequestDate datetime,
ArrivalTime datetime,
DropOffTime datetime,
OrigBuildingID int,
DestBuildingID int
)

create table Buildings
(
BuildingID int identity(1,1) primary key not null,
BuildingName varchar(100) not null
)

-- STOP: Create the above tables first by selecting the above statements and choose Execute
-- Create the relationships between the tables after the creation of the tables
-- (not shown in class - the diagram option in the tree was used in class)


-- Example: ALTER TABLE (Table Name) ADD CONSTRAINT (Name for the Contraint) FOREIGN KEY ( ID in the table) references foreign key table( FK ID)
ALTER TABLE Transactions ADD CONSTRAINT fk_1 FOREIGN KEY (ClientID) references Clients(ClientID)
ALTER TABLE Transactions ADD CONSTRAINT fk_2 FOREIGN KEY (ChaperoneID) references Chaperones(ChaperoneID)
ALTER TABLE Transactions ADD CONSTRAINT fk_3 FOREIGN KEY (OrigBuildingID) references Buildings(BuildingID)
ALTER TABLE Transactions ADD CONSTRAINT fk_4 FOREIGN KEY (DestBuildingID) references Buildings(BuildingID)



-- Insert some sample data
-- Note: getdate() is a function which is today date
-- i.e. select getdate() when selected and executed would show the current date and time.

-- insert 4 buildings
insert into Buildings
(BuildingName)
select 'None'

insert into Buildings
(BuildingName)
select '100'

insert into Buildings
(BuildingName)
select '200'

insert into Buildings
(BuildingName)
select '700'

-- Clients
insert into Clients
(name, datejoined, email, passw) -- only list the columns being update (never include the identity)
select 'John', getdate(), 'john@sm.com', '1234'

insert into Clients
(name, datejoined, email, passw)
select 'Jack', getdate(), 'jack@sm.com', '1234'

-- Fred will be our first Chaperone
insert into Chaperones
(name, datejoined, email, passw)
select 'Fred', getdate(), 'fred@sm.com', '1234'

-- Review the data (Select the 3 lines and choose Execute or F5)

select * from buildings
select * from Clients
select * from Chaperones

-- Now carefully insert transactions:

-- Transactions (should be ran after relationships are created
insert into Transactions
(clientid, ChaperoneID,RequestDate, ArrivalTime, OrigBuildingID, DestBuildingID)
select 1, 1, getdate(), getdate(), 1, 2
select * from Transactions

/*

If you need to start over - delete the constraints first and then the tables

like:

ALTER TABLE Transactions DROP CONSTRAINT fk_1
ALTER TABLE Transactions DROP CONSTRAINT fk_2
ALTER TABLE Transactions DROP CONSTRAINT fk_3
ALTER TABLE Transactions DROP CONSTRAINT fk_4

drop table buildings
drop table transactions
drop table Chaperones
drop table Clients




*/


