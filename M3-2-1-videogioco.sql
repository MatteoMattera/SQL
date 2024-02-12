CREATE DATABASE VIDEOGIOCHIDB;
USE VIDEOGIOCHIDB;

-- creazione tabella store
CREATE TABLE STORE ( 
CODICE_STORE INT NOT NULL AUTO_INCREMENT,
INDIRIZZO_FISICO VARCHAR (50),
TELEFONO VARCHAR (15),
PRIMARY KEY (CODICE_STORE));



-- creazione tabella impiegato
CREATE TABLE IMPIEGATO (
CF VARCHAR (16),
NOME VARCHAR (30),
TITOLO_STUDIO VARCHAR (30),
EMAIL VARCHAR (30),
PRIMARY KEY (CF));

-- creazione tabella servizio_impiegato
CREATE TABLE SERVIZIO_IMPIEGATO (
ID_SERVIZIO INT NOT NULL AUTO_INCREMENT,
CODICE_STORE INT,
CF VARCHAR (16),
DATA_INIZIO DATE,
DATA_FINE DATE,
CARICA VARCHAR (30),
PRIMARY KEY (ID_SERVIZIO),
FOREIGN KEY (CODICE_STORE) REFERENCES STORE (CODICE_STORE),
FOREIGN KEY (CF) REFERENCES IMPIEGATO (CF));



-- creazione tabella videogioco
CREATE TABLE VIDEOGIOCO (
TITOLO VARCHAR (30),
SVILUPPATORE VARCHAR (30),
ANNO_DISTRIBUZIONE DATE,
PREZZO DOUBLE,
GENERE VARCHAR (30),
REMAKEDI VARCHAR (30),
CODICE_STORE INT,
PRIMARY KEY (TITOLO),
FOREIGN KEY (CODICE_STORE) REFERENCES STORE(CODICE_STORE));



-- inserimento dati tabella store
INSERT INTO STORE (CODICE_STORE, INDIRIZZO_FISICO, TELEFONO) VALUES
(1, 'Via Roma 123, Milano', '+39 02 1234567'),
(2, 'Corso Italia 456, Roma', '+39 06 7654321'),
(3, 'Piazza San Marco 789, Venezia', '+39 041 9876543'),
(4, 'Viale degli Ulivi 234, Napoli', '+39 081 3456789'),
(5, 'Via Torino 567, Torino', '+39 011 8765432'),
(6, 'Corso Vittorio Emanuele 890, Firenze', '+39 055 2345678'),
(7, 'Piazza del Duomo 123, Bologna', '+39 051 8765432'),
(8, 'Via Garibaldi 456, Genova', '+39 010 2345678'),
(9, 'Lungarno Mediceo 789, Pisa', '+39 050 8765432'),
(10, 'Corso Cavour 101, Palermo', '+39 091 2345678');

-- inserimento dati tabella impiegato
INSERT INTO IMPIEGATO (CF, NOME, TITOLO_STUDIO, EMAIL) VALUES

('ABC12345XYZ67890', 'Mario Rossi', 'Laurea in Economia', 'mario.rossi@email.com'),
('DEF67890XYZ12345', 'Anna Verdi', 'Diploma di Ragioneria', 'anna.verdi@email.com'),
('GHI12345XYZ67890', 'Luigi Bianchi', 'Laurea in Informatica', 'luigi.bianchi@email.com'),
('JKL67890XYZ12345', 'Laura Neri', 'Laurea in Lingue', 'laura.neri@email.com'),
('MNO12345XYZ67890', 'Andrea Moretti', 'Diploma di Geometra', 'andrea.moretti@email.com'),
('PQR67890XYZ12345', 'Giulia Ferrara', 'Laurea in Psicologia', 'giulia.ferrara@email.com'),
('STU12345XYZ67890', 'Marco Esposito', 'Diploma di Elettronica', 'marco.esposito@email.com'),
('VWX67890XYZ12345', 'Sara Romano', 'Laurea in Giurisprudenza', 'sara.romano@email.com'),
('YZA12345XYZ67890', 'Roberto De Luca', 'Diploma di Informatica', 'roberto.deluca@email.com'),
('BCD67890XYZ12345', 'Elena Santoro', 'Laurea in Lettere', 'elena.santoro@email.com');

-- inserimento dati tabella servizio_impiegato
INSERT INTO SERVIZIO_IMPIEGATO (ID_SERVIZIO, CF, CODICE_STORE, DATA_INIZIO, DATA_FINE, CARICA) VALUES
(1,'ABC12345XYZ67890', 1, '2023-01-01', '2023-12-31', 'Cassiere'),
(2,'DEF67890XYZ12345', 2, '2023-02-01', '2023-11-30', 'Commesso'),
(3,'GHI12345XYZ67890', 3, '2023-03-01', '2023-10-31', 'Magazziniere'),
(4,'JKL67890XYZ12345', 4, '2023-04-01', '2023-09-30', 'Addetto alle vendite'),
(5,'MNO12345XYZ67890', 5, '2023-05-01', '2023-08-31', 'Addetto alle pulizie'),
(6,'PQR67890XYZ12345', 6, '2023-06-01', '2023-07-31', 'Commesso'),
(7,'STU12345XYZ67890', 7, '2023-07-01', '2023-06-30', 'Commesso'),
(8,'VWX67890XYZ12345', 8, '2023-08-01', '2023-05-31', 'Cassiere'),
(9,'YZA12345XYZ67890', 9, '2023-09-01', '2023-04-30', 'Cassiere'),
(10,'BCD67890XYZ12345', 10, '2023-10-01', '2023-03-31', 'Cassiere');

-- inserimento dati tabella videogioco
INSERT INTO VIDEOGIOCO (TITOLO, SVILUPPATORE, ANNO_DISTRIBUZIONE, PREZZO, GENERE, REMAKEDI, CODICE_STORE) VALUES 
('Fifa 2023', 'EA Sports', '2023-01-01', 49.99, 'Calcio', NULL, 5),
('Assassin''s Creed: Valhalla', 'Ubisoft', '2020-01-01', 59.99, 'Action', NULL,2),
('Super Mario Odyssey', 'Nintendo', '2017-01-01', 39.99, 'Platform', NULL,1),
('The Last of Us Part II', 'Naughty Dog', '2020-01-01', 69.99, 'Action', NULL,4),
('Cyberpunk 2077', 'CD Projekt Red', '2020-01-01', 49.99, 'RPG', NULL,3),
('Animal Crossing: New Horizons', 'Nintendo', '2020-01-01', 54.99, 'Simulation', NULL,8),
('Call of Duty: Warzone', 'Infinity Ward', '2020-01-01', 0.00, 'FPS', NULL,7),
('The Legend of Zelda', 'Nintendo', '2017-01-01', 59.99, 'Action-Adventure', NULL,6),
('Fortnite', 'Epic Games', '2017-01-01', 0.00, 'Battle Royale', NULL,10),
('Red Dead Redemption 2', 'Rockstar Games', '2018-01-01', 39.99, 'Action-Adventure', NULL,9);


