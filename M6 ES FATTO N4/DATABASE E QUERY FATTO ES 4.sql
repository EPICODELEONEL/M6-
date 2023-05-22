-- Create the database
CREATE DATABASE MicroPrestitiDB;

-- Use the database
USE MicroPrestitiDB;

-- Create the tables
CREATE TABLE Articolo_Generale (
    rivista VARCHAR(50),
    edizione INT,
    anno INT,
    PRIMARY KEY (rivista, edizione)
);

CREATE TABLE Articolo_Details (
    artID INT,
    titolo VARCHAR(100),
    rivista VARCHAR(50),
    edizione INT,
    pagina_iniziale INT,
    pagina_finale INT,
    PRIMARY KEY (artID),
    FOREIGN KEY (rivista, edizione) REFERENCES Articolo_Generale(rivista, edizione)
);

CREATE TABLE Articolo_Ref (
    artID INT,
    TR_ID INT,
    PRIMARY KEY (artID),
    FOREIGN KEY (artID) REFERENCES Articolo_Details(artID)
);

CREATE TABLE Autori (
    auID INT,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    PRIMARY KEY (auID)
);

CREATE TABLE ArticoliAutori (
    artID INT,
    auID INT,
    PRIMARY KEY (artID, auID),
    FOREIGN KEY (artID) REFERENCES Articolo_Details(artID),
    FOREIGN KEY (auID) REFERENCES Autori(auID)
);
-- Insert values into Articolo_Generale
INSERT INTO Articolo_Generale (rivista, edizione, anno)
VALUES ('Rivista1', 1, 2023),
       ('Rivista2', 2, 2023),
       ('Rivista3', 1, 2022);

-- Insert values into Articolo_Details
INSERT INTO Articolo_Details (artID, titolo, rivista, edizione, pagina_iniziale, pagina_finale)
VALUES (1, 'Titolo1', 'Rivista1', 1, 10, 15),
       (2, 'Titolo2', 'Rivista2', 2, 20, 25),
       (3, 'Titolo3', 'Rivista1', 1, 30, 35);

-- Insert values into Articolo_Ref
INSERT INTO Articolo_Ref (artID, TR_ID)
VALUES (2, 100),
       (3, 101);

-- Insert values into Autori
INSERT INTO Autori (auID, nome, cognome)
VALUES (1, 'Luca', 'Crasso'),
       (2, 'Marco', 'Grosso'),
       (3, 'Carlo', 'Matuidi');

-- Insert values into ArticoliAutori
INSERT INTO ArticoliAutori (artID, auID)
VALUES (1, 1),
       (2, 2),
       (2, 3),
       (3, 1),
       (3, 3);

SELECT Autori.nome, Autori.cognome
FROM Autori
INNER JOIN ArticoliAutori ON Autori.auID = ArticoliAutori.auID
WHERE ArticoliAutori.artID = 'ID_articolo';

SELECT Articolo_Details.artID, Articolo_Details.titolo, COUNT(Autori.auID) AS num_autori
FROM Articolo_Details
LEFT JOIN ArticoliAutori ON Articolo_Details.artID = ArticoliAutori.artID
LEFT JOIN Autori ON ArticoliAutori.auID = Autori.auID
GROUP BY Articolo_Details.artID, Articolo_Details.titolo;

SELECT Articolo_Details.titolo
FROM Articolo_Details
INNER JOIN ArticoliAutori ON Articolo_Details.artID = ArticoliAutori.artID
INNER JOIN Autori ON ArticoliAutori.auID = Autori.auID
WHERE Autori.cognome LIKE '%oss%';

