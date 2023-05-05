create database Lavoroibrido;
use Lavoroibrido;
CREATE TABLE ALLOGGIO (
  CodA INT PRIMARY KEY,
  Indirizzo VARCHAR(50),
  Città VARCHAR(50),
  Superficie DECIMAL(5,2),
  CostoAffittoMensile DECIMAL(8,2)
);

CREATE TABLE CONTRATTO_AFFITTO (
  Codc INT PRIMARY KEY,
  DataInizio DATE,
  DataFine DATE,
  NomePersona VARCHAR(50),
  CodA INT,
  FOREIGN KEY (CodA) REFERENCES ALLOGGIO(CodA)
);

CREATE TABLE AEREO (
  Aid INT PRIMARY KEY,
  ANome VARCHAR(50),
  Autonomia DECIMAL(5,2)
);

CREATE TABLE CERTIFICATO (
  Did INT PRIMARY KEY,
  Aid INT,
  FOREIGN KEY (Aid) REFERENCES AEREO(Aid)
);

CREATE TABLE DIPENDENTE (
  Did INT PRIMARY KEY,
  DNome VARCHAR(50),
  Stipendio DECIMAL(8,2)
);

INSERT INTO ALLOGGIO (CodA, Indirizzo, Città, Superficie, CostoAffittoMensile)
VALUES 
  (1, 'Via Roma 1', 'Milano', 80.00, 1000.00),
  (2, 'Piazza del Popolo 2', 'Roma', 120.50, 1500.00),
  (3, 'Corso Vittorio Emanuele 3', 'Napoli', 65.75, 800.00),
  (4, 'Via dei Mille 4', 'Firenze', 90.25, 1200.00),
  (5, 'Piazza San Marco 5', 'Venezia', 110.00, 1800.00),
  (6, 'Piazza del Campo 6', 'Siena', 75.50, 950.00),
  (7, 'Via Garibaldi 7', 'Genova', 95.00, 1300.00),
  (8, 'Piazza del Duomo 8', 'Catania', 60.25, 750.00),
  (9, 'Via Toledo 9', 'Napoli', 85.00, 1100.00),
  (10, 'Via XX Settembre 10', 'Bologna', 100.00, 1400.00);
  
INSERT INTO CONTRATTO_AFFITTO (Codc, DataInizio, DataFine, NomePersona, CodA)
VALUES
  (1, '2022-01-01', '2022-12-31', 'Mario Rossi', 1),
  (2, '2022-01-15', '2022-06-30', 'Luca Bianchi', 2),
  (3, '2022-03-01', '2022-08-31', 'Giulia Verdi', 3),
  (4, '2022-05-01', '2022-10-31', 'Sara Neri', 4),
  (5, '2022-06-01', '2022-11-30', 'Paolo Gialli', 5),
  (6, '2022-08-01', '2022-12-31', 'Valeria Amato', 6),
  (7, '2022-09-01', '2023-02-28', 'Alessandro Bianchi', 7),
  (8, '2022-10-15', '2023-03-31', 'Martina Verdi', 8),
  (9, '2023-01-01', '2023-06-30', 'Giuseppe Neri', 9),
  (10, '2023-03-01', '2023-08-31', 'Simona Gialli', 10);
  
  INSERT INTO AEREO (Aid, ANome, Autonomia)
VALUES 
  (1, 'Boeing 747', 12.5),
  (2, 'Airbus A380', 13.75),
  (3, 'Cessna 172', 4.75),
  (4, 'Embraer E175', 5.75),
  (5, 'Bombardier Global 7500', 14.5),
  (6, 'Dassault Falcon 7X', 11.5),
  (7, 'Gulfstream G650ER', 13.25),
  (8, 'Beechcraft King Air 350i', 6.5),
  (9, 'Pilatus PC-12', 4.5),
  (10, 'Cirrus SR22', 2.5);
  
  INSERT INTO CERTIFICATO (Did, Aid)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

INSERT INTO DIPENDENTE (Did, DNome, Stipendio)
VALUES
  (1, 'Mario Rossi', 5000.00),
  (2, 'Luca Bianchi', 4800.00),
  (3, 'Giulia Verdi', 4500.00),
  (4, 'Sara Neri', 4700.00),
  (5, 'Paolo Gialli', 5200.00),
  (6, 'Valeria Azzurri', 4900.00),
  (7, 'Simone Bianchi', 5300.00),
  (8, 'Carla Rossini', 4600.00),
  (9, 'Marco Verdi', 4400.00),
  (10, 'Linda Neri', 4800.00);
   


USE Lavoroibrido;
CREATE TABLE Prodotti (
  CodP INT PRIMARY KEY,
  NomeP VARCHAR(50),
  Taglia VARCHAR(10),
  Colore VARCHAR(20),
  Magazzino VARCHAR(50)
);


CREATE TABLE Fornitori (
  Codf INT PRIMARY KEY,
  NomeF VARCHAR(50),
  NSoci INT,
  Sede VARCHAR(50)
);


CREATE TABLE FP (
  CodF INT,
  CodP INT,
  QTA INT,
  PRIMARY KEY (CodF, CodP),
  FOREIGN KEY (CodF) REFERENCES Fornitori(Codf),
  FOREIGN KEY (CodP) REFERENCES Prodotti(CodP)
);



INSERT INTO Prodotti (CodP, NomeP, Taglia, Colore, Magazzino)
VALUES
(1, 'Maglietta', 'M', 'Rosso', 'Magazzino A'),
(2, 'Pantaloni', 'L', 'Blu', 'Magazzino A'),
(3, 'Giacca', 'XL', 'Nero', 'Magazzino B'),
(4, 'Scarpe', '42', 'Marrone', 'Magazzino B'),
(5, 'Cappello', 'Unica', 'Verde', 'Magazzino C'),
(6, 'Gonna', 'S', 'Giallo', 'Magazzino D'),
(7, 'Polo', 'M', 'Bianco', 'Magazzino E'),
(8, 'Felpa', 'L', 'Grigio', 'Magazzino E'),
(9, 'Jeans', '36', 'Nero', 'Magazzino F'),
(10, 'T-shirt', 'XL', 'Arancione', 'Magazzino F');


INSERT INTO Fornitori (Codf, NomeF, NSoci, Sede)
VALUES
(1, 'Fornitore 1', 890, 'Milano'),
(2, 'Fornitore 2', 901, 'Roma'),
(3, 'Fornitore 3', 012, 'Napoli'),
(4, 'Fornitore 4', 123, 'Firenze'),
(5, 'Fornitore 5', 234, 'Venezia'),
(6, 'Fornitore 6', 345, 'Bologna'),
(7, 'Fornitore 7', 456, 'Torino'),
(8, 'Fornitore 8',567, 'Palermo'),
(9, 'Fornitore 9',678, 'Genova'),
(10, 'Fornitore 10',789, 'Catania');


INSERT INTO FP (CodF, CodP, QTA)
VALUES
(1, 1, 100),
(2, 2, 150),
(3, 3, 200),
(4, 4, 75),
(5, 5, 50),
(6, 6, 100),
(7, 7, 125),
(8, 8, 75),
(9, 9, 150),
(10, 10, 200);