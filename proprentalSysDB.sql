DROP TABLE Rentals;
DROP TABLE Tenants;
DROP TABLE Properties;
DROP TABLE Counties;
DROP TABLE PropertyTypes;
DROP TABLE Staff;
DROP TABLE Owners;





CREATE TABLE Counties
(County_Code char(2) NOT NULL,
 Name varchar(15) NOT NULL,
CONSTRAINT pk_countyCode PRIMARY KEY (County_Code));

INSERT INTO Counties
VALUES('CK', 'Cork');
INSERT INTO Counties
VALUES('CE', 'Clare');
INSERT INTO Counties
VALUES('Cn', 'Cavan');
INSERT INTO Counties
VALUES('CW', 'Carlow');
INSERT INTO Counties
VALUES('DN', 'Dublin');
INSERT INTO Counties
VALUES('DL', 'Donegal');
INSERT INTO Counties
VALUES('GL', 'Galway');
INSERT INTO Counties
VALUES('KE', 'Kildare');
INSERT INTO Counties
VALUES('KK', 'Kilkenny');
INSERT INTO Counties
VALUES('KY', 'Kerry');	
INSERT INTO Counties
VALUES('LD', 'Longford');
INSERT INTO Counties
VALUES('LH', 'Louth');
INSERT INTO Counties
VALUES('LK', 'Limerick');
INSERT INTO Counties
VALUES('LM', 'Leitrim');
INSERT INTO Counties
VALUES('LS', 'Laois');
INSERT INTO Counties
VALUES('MH', 'Meath');
INSERT INTO Counties
VALUES('MN', 'Monaghan');
INSERT INTO Counties
VALUES('MY', 'Mayo');
INSERT INTO Counties
VALUES('OY', 'Offaly');
INSERT INTO Counties
VALUES('RN', 'Roscommon');
INSERT INTO Counties
VALUES('SN', 'Sligo');
INSERT INTO Counties
VALUES('TN', 'Typperary');
INSERT INTO Counties
VALUES('WD', 'Waterford');
INSERT INTO Counties
VALUES('WH', 'Westmeath');
INSERT INTO Counties
VALUES('WW', 'Wicklow');
INSERT INTO Counties
VALUES('WX', 'Wexford');


CREATE TABLE PropertyTypes
(TypeCode varchar(1) NOT NULL,
Description varchar(10) NOT NULL,
CONSTRAINT pk_TypeCode PRIMARY KEY (TypeCode));

INSERT INTO PropertyTypes
VALUES('H', 'House');
INSERT INTO PropertyTypes
VALUES('A', 'Appartment');
INSERT INTO PropertyTypes
VALUES('B', 'Bungalow');


CREATE TABLE Staff
(StaffId numeric(2) NOT NULL,
forename varchar(10) NOT NULL,
surname varchar(10) NOT NULL,
status varchar(1) DEFAULT 'A',
CONSTRAINT pk_StaffId PRIMARY KEY (StaffId));

INSERT INTO Staff
VALUES(1,'SMITH','JOHN','A');
INSERT INTO Staff
VALUES(2,'FOLEY','Mark','A');
INSERT INTO Staff
VALUES(3,'Walsh','Jack','A');
INSERT INTO Staff
VALUES(4,'JONES','JOHN','A');
INSERT INTO Staff
VALUES(5,'ADAMS','JOHN','U');
INSERT INTO Staff
VALUES(6,'Mikulasko','Peter','A');


CREATE TABLE Owners
(OwnerId numeric(3) NOT NULL,
forename varchar(10) NOT NULL,
surname varchar(10) NOT NULL,
ownerTelNo varchar(15) NOT NULL,
CONSTRAINT pk_ownerId PRIMARY KEY (OwnerId));

insert into Owners 
values(1,'Peter','Mikulasko',012345678);	
insert into Owners 
values(2,'Jack','Conor',087652148);	
insert into Owners 
values(3,'John','Conor',087354148);






CREATE TABLE PROPERTIES
(propertyId numeric(3) NOT NULL,
street varchar(20) NOT NULL,
town varchar(15) NOT NULL,
County_Code char(2) NOT NULL,
rent numeric(5) NOT NULL,
TypeCode varchar(1) NOT NULL,
StatusId varchar(1) NOT NULL,
noOfBeds numeric(1) NOT NULL,
noOfBaths numeric(1) NOT NULL,
StaffId numeric(2) NOT NULL,
OwnerId numeric(3) NOT NULL,
CONSTRAINT pk_propertyId PRIMARY KEY (propertyId),
CONSTRAINT fk_Prop_Counties FOREIGN KEY (County_Code) REFERENCES Counties,
CONSTRAINT fk_Prop_Types FOREIGN KEY (TypeCode) REFERENCES PropertyTypes,
CONSTRAINT fk_Prop_Staff FOREIGN KEY (StaffId) REFERENCES Staff,
CONSTRAINT fk_Prop_Owners FOREIGN KEY (OwnerId) REFERENCES Owners);

insert into Properties
values(1,'Street','Town','LK',350,'A','U',3,1,2,1);
insert into Properties
values(2,'1 Main Street','Killarney','KY',250,'B','U',2,1,5,2);
insert into Properties
values(3,'Fairway Heights','Tralee','KY',270,'H','U',3,2,4,2);
insert into Properties
values(4,'Times square','Cork','CK',370,'A','A',2,2,3,2);
insert into Properties
values(5,'Elm Street','Tralee','KY',470,'A','A',3,2,3,3);



CREATE TABLE Tenants
(TenantId numeric(3) NOT NULL,
Surname varchar(10) NOT NULL,
Forename varchar(10) NOT NULL,
TelNo varchar(15) NOT NULL,
ppsNum varchar(9) NOT NULL,
CONSTRAINT pk_tenantId PRIMARY KEY (tenantId));

INSERT INTO Tenants
values(1,'Crowe','Russell',0861598894,'01234567I');

CREATE TABLE Rentals
(RentId numeric(5) NOT NULL,
DateFrom date NOT NULL,
DateTo Date NOT NULL,
Deposit numeric(4) NOT NULL,
PropertyId numeric(3) NOT NULL,
TenantId numeric(3) NOT NULL,
CONSTRAINT pk_rentId PRIMARY KEY (rentId),
CONSTRAINT fk_Rent_Properties FOREIGN KEY (PropertyId) REFERENCES Properties,
CONSTRAINT fk_Rent_Tenants FOREIGN KEY (TenantId) REFERENCES Tenants);

INSERT INTO Rentals (RentId,DateFrom,DateTo,Deposit,PropertyId,TenantId)
VALUES(1,to_date('15/05/2013','DD.MM.YYYY.'),to_date('15/05/2014','DD.MM.YYYY.'),800,1,1);

COMMIT;
