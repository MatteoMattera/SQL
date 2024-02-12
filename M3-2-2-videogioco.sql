/* 
Seleziona tutti gli impiegati con una laurea in Economia.
Seleziona gli impiegati che lavorano come Cassiere o che hanno un Diploma di Informatica.
Seleziona i nomi e i titoli degli impiegati che hanno iniziato a lavorare dopo il 1 gennaio 2023.
Seleziona i titoli di studio distinti tra gli impiegati.
Seleziona gli impiegati con un titolo di studio diverso da "Laurea in Economia".
Seleziona gli impiegati che hanno iniziato a lavorare prima del 1 luglio 2023 e sono Commessi.
Seleziona i titoli e gli sviluppatori dei videogiochi distribuiti nel 2020.
Seleziona i titoli dei videogiochi disponibili nei settori 1 o 3 del negozio 5.
Seleziona i negozi con più di 20 copie disponibili di almeno un videogioco.
*/

USE VIDEOGIOCHIDB;

-- Seleziona tutti gli impiegati con una laurea in Economia.
SELECT IMPIEGATO.NOME, IMPIEGATO.TITOLO_STUDIO
FROM IMPIEGATO
WHERE TITOLO_STUDIO = 'LAUREA IN ECONOMIA' ;

-- Seleziona gli impiegati che lavorano come Cassiere o che hanno un Diploma di Informatica.

SELECT *
FROM IMPIEGATO
JOIN SERVIZIO_IMPIEGATO ON IMPIEGATO.CF = SERVIZIO_IMPIEGATO.CF
WHERE IMPIEGATO.TITOLO_STUDIO = 'DIPLOMA DI INFORMATICA' AND SERVIZIO_IMPIEGATO.CARICA = 'CASSIERE';

-- Seleziona i nomi e i titoli degli impiegati che hanno iniziato a lavorare dopo il 1 gennaio 2023.

SELECT IMPIEGATO.NOME, IMPIEGATO.TITOLO_STUDIO
FROM IMPIEGATO
JOIN SERVIZIO_IMPIEGATO ON IMPIEGATO.CF = SERVIZIO_IMPIEGATO.CF
WHERE SERVIZIO_IMPIEGATO.DATA_INIZIO > 01-01-2023 ;

-- Seleziona i titoli di studio distinti tra gli impiegati.

SELECT DISTINCT TITOLO_STUDIO, NOME
FROM IMPIEGATO ; 

-- Seleziona gli impiegati con un titolo di studio diverso da "Laurea in Economia".

SELECT *
FROM IMPIEGATO
WHERE IMPIEGATO.TITOLO_STUDIO <> "LAUREA IN ECONOMIA" ;

-- Seleziona gli impiegati che hanno iniziato a lavorare prima del 1 luglio 2023 e sono Commessi. 

SELECT *
FROM IMPIEGATO
JOIN SERVIZIO_IMPIEGATO ON IMPIEGATO.CF = SERVIZIO_IMPIEGATO.CF
WHERE SERVIZIO_IMPIEGATO.DATA_INIZIO < '2023-07-01' AND SERVIZIO_IMPIEGATO.CARICA = 'COMMESSO'; 

-- Seleziona i titoli e gli sviluppatori dei videogiochi distribuiti nel 2020.

SELECT VIDEOGIOCO.TITOLO, VIDEOGIOCO.SVILUPPATORE
FROM VIDEOGIOCO
WHERE YEAR (VIDEOGIOCO.ANNO_DISTRIBUZIONE) = 2020 ;

-- Seleziona i titoli dei videogiochi disponibili nei settori 1 o 3 del negozio 5. DA INSERIRE

SELECT VIDEOGIOCO.TITOLO
FROM VIDEOGIOCO
JOIN STORE ON VIDEOGIOCO.CODICE_STORE = STORE.CODICE_STORE
WHERE STORE.SETTORE = 1 OR STORE.SETTORE = 3 AND STORE.NEGOZIO = 5;

-- Seleziona i negozi con più di 20 copie disponibili di almeno un videogioco.


