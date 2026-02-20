CREATE DATABASE MechanicalWorkshop;
USE MechanicalWorkshop;

CREATE TABLE State (
    idRegion INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    FU VARCHAR(45) NOT NULL
);

CREATE TABLE Cities (
    idCities INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    idRegion INT,
    FOREIGN KEY (idRegion) REFERENCES State(idRegion)
);

CREATE TABLE Employees (
    idEmployee INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(45),
    MiddleName VARCHAR(45),
    LastName VARCHAR(45),
    TaxID VARCHAR(45),
    Profession VARCHAR(45),
    Specialization VARCHAR(45),
    Address VARCHAR(45),
    ZipCode VARCHAR(45),
    Phone VARCHAR(45),
    Email VARCHAR(45),
    idCities INT,
    FOREIGN KEY (idCities) REFERENCES Cities(idCities)
);

CREATE TABLE Teams (
    idTeams INT PRIMARY KEY AUTO_INCREMENT,
    idEmployee INT,
    FOREIGN KEY (idEmployee) REFERENCES Employees(idEmployee)
);

CREATE TABLE Clients (
    idClients INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(45),
    MiddleName VARCHAR(45),
    LastName VARCHAR(45),
    TaxID VARCHAR(45),
    Address VARCHAR(45),
    ZipCode VARCHAR(45),
    City VARCHAR(45),
    Phone VARCHAR(45),
    Email VARCHAR(45),
    idCities INT,
    FOREIGN KEY (idCities) REFERENCES Cities(idCities)
);

CREATE TABLE Vehicles (
    idVehicles INT PRIMARY KEY AUTO_INCREMENT,
    Model VARCHAR(45),
    Color VARCHAR(45),
    Year VARCHAR(45),
    LicencePlate VARCHAR(45),
    Type VARCHAR(45),
    idClients INT,
    FOREIGN KEY (idClients) REFERENCES Clients(idClients)
);

CREATE TABLE Services (
    idServices INT PRIMARY KEY AUTO_INCREMENT,
    TypeOfService VARCHAR(45),
    Price FLOAT,
    Duration INT,
    Description VARCHAR(45)
);

CREATE TABLE StockParts (
    idParts INT PRIMARY KEY AUTO_INCREMENT,
    Parts VARCHAR(45),
    SalePrice FLOAT,
    PurchasePrice FLOAT,
    Quantity INT,
    ExpirationDate DATE,
    LeadTime INT
);

CREATE TABLE Orders (
    idOrder INT PRIMARY KEY AUTO_INCREMENT,
    Status VARCHAR(45),
    ValuationDateStart DATE,
    ValuationDateEnd DATE,
    AuthorizationDate DATE,
    StartDate DATE,
    EndDate DATE,
    TotalPrice FLOAT,
    PaymentDate DATE,
    idVehicles INT,
    idTeams INT,
    idClients INT,
    FOREIGN KEY (idVehicles) REFERENCES Vehicles(idVehicles),
    FOREIGN KEY (idTeams) REFERENCES Teams(idTeams),
    FOREIGN KEY (idClients) REFERENCES Clients(idClients)
);

CREATE TABLE OMServices (
    idServices INT,
    idOrder INT,
    PRIMARY KEY (idServices, idOrder),
    FOREIGN KEY (idServices) REFERENCES Services(idServices),
    FOREIGN KEY (idOrder) REFERENCES Orders(idOrder)
);

CREATE TABLE OMParts (
    idParts INT,
    idOrder INT,
    PRIMARY KEY (idParts, idOrder),
    FOREIGN KEY (idParts) REFERENCES StockParts(idParts),
    FOREIGN KEY (idOrder) REFERENCES Orders(idOrder)
);

INSERT INTO State (Name, FU) VALUES
('São Paulo','SP'),
('Rio de Janeiro','RJ');

INSERT INTO Cities (Name, idRegion) VALUES
('São Paulo',1),
('Campinas',1),
('Rio de Janeiro',2);

INSERT INTO Employees (FirstName, LastName, Profession, Specialization, idCities)
VALUES
('Carlos','Silva','Mecânico','Motor',1),
('Ana','Souza','Mecânico','Suspensão',2);

INSERT INTO Teams (idEmployee) VALUES (1),(2);

INSERT INTO Clients (FirstName, LastName, Phone, idCities)
VALUES
('João','Pereira','11999999999',1),
('Marcos','Almeida','21988888888',3);

INSERT INTO Vehicles (Model, Color, Year, LicencePlate, Type, idClients)
VALUES
('Civic','Preto','2018','ABC1234','Carro',1),
('Gol','Branco','2015','XYZ9999','Carro',2);

INSERT INTO Services (TypeOfService, Price, Duration, Description)
VALUES
('Troca de Óleo',150,60,'Troca completa'),
('Alinhamento',200,90,'Alinhamento 4 rodas');

INSERT INTO StockParts (Parts, SalePrice, PurchasePrice, Quantity, ExpirationDate, LeadTime)
VALUES
('Filtro de Óleo',50,30,100,'2026-12-31',5),
('Pneu',400,300,20,'2028-12-31',10);

INSERT INTO Orders (Status, StartDate, EndDate, TotalPrice, idVehicles, idTeams, idClients)
VALUES
('Concluído','2025-01-10','2025-01-12',350,1,1,1),
('Em andamento','2025-02-01',NULL,400,2,2,2);

INSERT INTO OMServices VALUES (1,1),(2,1),(2,2);
INSERT INTO OMParts VALUES (1,1),(2,2);

-- Pergunta: Quais são todos os clientes cadastrados?
SELECT * FROM Clients;

-- Pergunta: Quais ordens estão concluídas?
SELECT idOrder, Status FROM Orders WHERE Status = 'Concluído';

-- Pergunta: Qual a margem de lucro das peças?
SELECT Parts, (SalePrice - PurchasePrice) AS Profit FROM StockParts;

-- Pergunta: Quais serviços são mais caros?
SELECT TypeOfService, Price FROM Services ORDER BY Price DESC;

-- Pergunta: Quais clientes possuem mais de uma ordem?
SELECT idClients, COUNT(*) AS TotalOrders FROM Orders GROUP BY idClients HAVING COUNT(*) > 1;

-- Pergunta: Quais serviços foram realizados em cada ordem?
SELECT o.idOrder, s.TypeOfService, s.Price FROM Orders o
	JOIN OMServices os ON o.idOrder = os.idOrder
	JOIN Services s ON os.idServices = s.idServices;
