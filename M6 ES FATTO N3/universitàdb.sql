use universitàdb;
CREATE TABLE Studente (
    Matricola VARCHAR(10) PRIMARY KEY,
    NomeStudente VARCHAR(50),
    AnnoLaurea INT,
    TitoloStudio VARCHAR(50),
    VotoLaurea int
);
CREATE TABLE Dipartimento (
    CodiceDipartimento VARCHAR(10) PRIMARY KEY,
    NomeDipartimento VARCHAR(50),
    SettoreScientifico VARCHAR(50),
    NumDocenti INT
);
CREATE TABLE ConcorsoMaster (
    CodiceMaster VARCHAR(10) PRIMARY KEY,
    CodiceDipartimento VARCHAR(10),
    DataPubblicazione DATE,
    DataScadenza DATE,
    NumPostiDisponibili INT,
    FOREIGN KEY (CodiceDipartimento) REFERENCES Dipartimento(CodiceDipartimento)
);
CREATE TABLE PartecipaConcorsoMaster (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CodiceDipartimento VARCHAR(10),
    CodiceMaster VARCHAR(10),
    MatricolaStudente VARCHAR(10),
    DataInvioDomanda DATE,
    UNIQUE KEY (CodiceDipartimento, CodiceMaster, MatricolaStudente, ID),
    FOREIGN KEY (CodiceDipartimento, CodiceMaster) REFERENCES ConcorsoMaster(CodiceDipartimento, CodiceMaster),
    FOREIGN KEY (MatricolaStudente) REFERENCES Studente(Matricola)
);

);

INSERT INTO Studente (Matricola, NomeStudente, AnnoLaurea, TitoloStudio, VotoLaurea)
VALUES
    ('1', 'Mario Rossi', 2022, 'Laurea Magistrale', 110),
    ('2', 'Luca Bianchi', 2021, 'Laurea Triennale', 95),
    ('3', 'Giulia Verdi', 2023, 'Laurea Magistrale', 105),
    ('4', 'Anna Russo', 2022, 'Laurea Triennale', 100),
    ('5', 'Marco Gialli', 2023, 'Laurea Magistrale', 98),
    ('6', 'Laura Neri', 2021, 'Laurea Magistrale', 115),
    ('7', 'Simone Esposito', 2022, 'Laurea Triennale', 90),
    ('8', 'Chiara Rizzo', 2023, 'Laurea Magistrale', 103),
    ('9', 'Francesco Leone', 2022, 'Laurea Magistrale', 105),
    ('10', 'Sara Ferrari', 2021, 'Laurea Triennale', 97);
    
    
INSERT INTO Dipartimento (CodiceDipartimento, NomeDipartimento, SettoreScientifico, NumDocenti)
VALUES
    ('D1', 'Dipartimento di Informatica', 'Informatica', 15),
    ('D2', 'Dipartimento di Fisica', 'Fisica', 10),
    ('D3', 'Dipartimento di Matematica', 'Matematica', 12),
    ('D4', 'Dipartimento di Chimica', 'Chimica', 8),
    ('D5', 'Dipartimento di Economia', 'Economia', 20),
    ('D6', 'Dipartimento di Lingue', 'Lingue', 18),
    ('D7', 'Dipartimento di Storia', 'Storia', 7),
    ('D8', 'Dipartimento di Giurisprudenza', 'Giurisprudenza', 14),
    ('D9', 'Dipartimento di Medicina', 'Medicina', 25),
    ('D10', 'Dipartimento di Ingegneria', 'Ingegneria', 22);

INSERT INTO ConcorsoMaster (CodiceMaster, CodiceDipartimento, DataPubblicazione, DataScadenza, NumPostiDisponibili)
VALUES
    ('CM1', 'D1', '2021-12-01', '2022-02-28', 5),
    ('CM2', 'D3', '2021-12-15', '2023-06-30', 10),
    ('CM3', 'D5', '2021-12-20', '2023-05-31', 8),
    ('CM4', 'D2', '2021-12-31', '2023-01-31', 12),
    ('CM5', 'D8', '2022-01-01', '2023-04-30', 6),
    ('CM6', 'D9', '2022-01-10', '2022-12-31', 15),
    ('CM7', 'D4', '2022-01-15', '2023-03-31', 9),
    ('CM8', 'D6', '2022-01-20', '2023-07-31', 11),
    ('CM9', 'D10', '2022-02-01', '2023-01-31', 7),
    ('CM10', 'D7', '2022-02-10', '2023-04-30', 14);

INSERT INTO partecipaconcorsomaster2 (CodiceDipartimento, CodiceMaster, MatricolaStudente, DataInvioDomanda)
SELECT pcm.CodiceDipartimento, pcm.CodiceMaster, pcm.MatricolaStudente, pcm.DataInvioDomanda
FROM (
    SELECT 'D1' AS CodiceDipartimento, 'CM1' AS CodiceMaster, '1' AS MatricolaStudente, '2022-01-15' AS DataInvioDomanda
    UNION ALL
    SELECT 'D1', 'CM2', '1', '2023-05-05'
    UNION ALL
    SELECT 'D1', 'CM3', '1', '2023-04-20'
    UNION ALL
    SELECT 'D3', 'CM2', '2', '2023-05-10'
    UNION ALL
    SELECT 'D3', 'CM3', '2', '2023-04-25'
    UNION ALL
    SELECT 'D3', 'CM4', '2', '2022-12-25'
    UNION ALL
    SELECT 'D5', 'CM3', '3', '2023-04-25'
    UNION ALL
    SELECT 'D5', 'CM4', '3', '2022-12-25'
    UNION ALL
    SELECT 'D5', 'CM5', '3', '2023-03-20'
    UNION ALL
    SELECT 'D2', 'CM4', '4', '2022-12-25'
) AS pcm
INNER JOIN concorsomaster AS cm ON pcm.CodiceDipartimento = cm.CodiceDipartimento AND pcm.CodiceMaster = cm.CodiceMaster;



