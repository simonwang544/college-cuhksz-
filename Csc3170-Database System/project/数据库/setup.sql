DROP SCHEMA IF EXISTS `proj` ;
CREATE SCHEMA IF NOT EXISTS `proj` DEFAULT CHARACTER SET utf8 ;
USE `proj` ;

-- Creating table for User
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    UserAddress VARCHAR(255)
);

CREATE TABLE ExpressStation (
    StationID INT PRIMARY KEY,
    StationLocation VARCHAR(255),
    Capacity INT,
    OpeningHours VARCHAR(15)
);

CREATE TABLE Store (
    StoreID INT PRIMARY KEY,
    StoreLocation VARCHAR(255),
    Capacity INT,
    StoreName VARCHAR(255)
);

-- Creating table for Staff
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(255),
    JoinDate DATE,
    Salary DECIMAL(10, 2),
    TeleNum VARCHAR(20),
    WorkingHours INT
);

CREATE TABLE Deliveryman (
    StaffID INT PRIMARY KEY,
    PreferredArea VARCHAR(255),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Saleperson (
    StaffID INT PRIMARY KEY,
    SalesCommissionRatio DECIMAL(4, 4),
    StoreID INT,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
);

CREATE TABLE Responsible (
    StaffID INT,
    StationID INT,
    PRIMARY KEY (StaffID, StationID),
    FOREIGN KEY (StaffID) REFERENCES Deliveryman(StaffID),
    FOREIGN KEY (StationID) REFERENCES ExpressStation(StationID)
);

-- Creating table for Product
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Price DECIMAL(10, 2),
    ProductCondition VARCHAR(50)
);
CREATE TABLE Book (
    ProductID INT PRIMARY KEY,
    ISBN VARCHAR(20),
    Title VARCHAR(255),
    PublicationYear INT,
    Genre VARCHAR(255),
    Author VARCHAR(255),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Note (
    ProductID INT PRIMARY KEY,
    TargetCourse VARCHAR(255),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Creating table for Order
CREATE TABLE POrder (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    OrderStatus VARCHAR(50),
    OrderType VARCHAR(50),
    TotalPrice DECIMAL(10, 2),

    SalepersonID INT,
    UserID INT,
    DeliverID INT,
    StationID INT,
    FOREIGN KEY (SalepersonID) REFERENCES Saleperson(StaffID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (DeliverID) REFERENCES Deliveryman(StaffID),
    FOREIGN KEY (StationID) REFERENCES ExpressStation(StationID)
);

-- Creating table for Order-Product Relationship
CREATE TABLE OrderProduct (
    OrderID INT,
    ProductID INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES POrder(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);