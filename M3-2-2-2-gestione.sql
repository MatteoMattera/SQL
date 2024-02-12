/*Seleziona tutti i clienti che non hanno un indirizzo email nella tabella Clienti.
Seleziona tutte le email dei clienti il cui nome inizia con la lettera 'A' dalla tabella Clienti.
Seleziona tutti i prezzi dei prodotti il cui nome contiene la parola 'tech' indipendentemente dalla posizione nella tabella Prodotti.
Seleziona tutti gli ordini con una quantità maggiore di 10 o con un importo totale inferiore a 100 euro dalla tabella Ordini.
Seleziona tutti i prodotti con un prezzo superiore a 50 euro dalla tabella Prodotti.
Seleziona tutti i prodotti il cui nome inizia con 'M' e termina con 'e' indipendentemente dalla lunghezza della parola nella tabella Prodotti.*/

USE GESTIONENEGOZIODB;

-- Seleziona tutti i clienti che non hanno un indirizzo email nella tabella Clienti.

SELECT *
FROM CLIENTE
WHERE EMAIL IS NULL ;

-- Seleziona tutte le email dei clienti il cui nome inizia con la lettera 'A' dalla tabella Clienti.
SELECT *
FROM CLIENTE 
WHERE EMAIL LIKE 'A%';

-- Seleziona tutti i prezzi dei prodotti il cui nome contiene la parola 'tech' indipendentemente dalla posizione nella tabella Prodotti.

SELECT PRODOTTO.PREZZO, PRODOTTO.NOME_PRODOTTO
FROM PRODOTTO
WHERE NOME_PRODOTTO LIKE '%TECH%'; 

select * FROM PRODOTTO;

-- Seleziona tutti gli ordini con una quantità maggiore di 10 o con un importo totale inferiore a 100 euro dalla tabella Ordini.

SELECT *
FROM ORDINE
JOIN DETTAGLIO_ORDINE ON ORDINE.ID_ORDINE = DETTAGLIO_ORDINE.ID_ORDINE
WHERE ORDINE.QUANTITA > 10 
	OR DETTAGLIO_ORDINE.PREZZO_TOTALE < 100 ;

-- Seleziona tutti i prodotti con un prezzo superiore a 50 euro dalla tabella Prodotti.

SELECT *
FROM PRODOTTO
WHERE PREZZO > 50;

-- Seleziona tutti i prodotti il cui nome inizia con 'M' e termina con 'e' indipendentemente dalla lunghezza della parola nella tabella Prodotti

SELECT * 
FROM PRODOTTO
WHERE NOME_PRODOTTO LIKE 'M%E';



