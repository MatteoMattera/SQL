USE CHINOOK ;



-- Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”.

SELECT TRACK.NAME AS TRACK_NAME, GENRE.NAME AS GENERE_NAME
FROM TRACK
JOIN genre ON TRACK.GenreId = genre.GenreId 
WHERE genre.Name IN ('POP', 'ROCK');

-- Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”.

SELECT DISTINCT ARTIST.NAME AS ARTISTA, ALBUM.TITLE AS ALBUM_TITOLO
FROM ARTIST
LEFT JOIN ALBUM ON ARTIST.ARTISTID = ALBUM.ARTISTID
WHERE (ARTIST.NAME  LIKE "A%" OR ALBUM.TITLE LIKE "A%") AND ALBUM.TITLE IS NOT NULL;

-- Recuperate i nomi degli album o degli artisti che abbiano pubblicazioni precedenti all’anno 2000.

SELECT ALBUM.TITLE AS TITOLO, ARTIST.NAME AS ARTISTA
FROM ALBUM
LEFT JOIN ARTIST ON ALBUM.ARTISTID = ARTIST.ARTISTID;
--  LA QUERY NON PUO' ESSERE FATTA IN QUANTO MANCA LA COLONNA ANNO PUBBLICAZIONE


-- Elencate tutte le tracce che hanno come genere “Jazz” o che durano meno di 3 minuti.

SELECT TRACK.NAME AS TITOLO, TRACK.Milliseconds/60000 DURATA, GENRE.NAME
FROM TRACK
LEFT JOIN GENRE ON TRACK.GENREID = TRACK.GENREID
WHERE GENRE.NAME IN ("JAZZ") OR TRACK.MILLISECONDS/60000 < 3 ;

SELECT track.Name AS Name, genre.Name AS Genre,
           CONCAT(FLOOR(TRACK.Milliseconds / 60000),':',
		   LPAD(FLOOR((TRACK.Milliseconds % 60000) / 1000), 2,'0')) AS Durata
FROM track
JOIN genre ON genre.GenreId = track.GenreId
WHERE genre.Name = 'Rock' OR TRACK.Milliseconds < 180000 ;

-- Recuperate tutte le tracce più lunghe della durata media

SELECT Name,
    CONCAT(FLOOR(Milliseconds / 60000), ':', 
    LPAD(FLOOR((Milliseconds % 60000) / 1000), 2, '0')) AS Durata
FROM track
WHERE Milliseconds > (SELECT AVG(Milliseconds) FROM track);

-- Individuate i generi che hanno tracce con una durata media maggiore di 4 minuti

SELECT GENRE.NAME AS GENERE
FROM  TRACK
JOIN GENRE ON TRACK.GENREID = GENRE.GENREID
GROUP BY GENRE.NAME
HAVING AVG ( TRACK.MILLISECONDS) > 24000;

-- Individuate gli artisti che hanno rilasciato più di un album.
SELECT ARTIST.NAME AS ARTISTNAME, COUNT(ALBUM.ALBUMID) AS ALBUMRELEASED
FROM ARTIST
JOIN ALBUM ON ARTIST.ARTISTID = ALBUM.ARTISTID
GROUP BY ARTIST.NAME
HAVING COUNT(ALBUM.ALBUMID) > 1 ; -- L'HAVING VA PER ULTIMO

-- TROVATE LA TRACCIA PIU LUNGA DI OGNI ALBUM

SELECT A.TITLE AS ALBUM, T.NAME AS TRACK, T.MILLISECONDS / 60000 AS DURATA_IN_MINUTI
FROM ALBUM A
JOIN TRACK T ON A.ALBUMID = T.ALBUMID
JOIN (
	SELECT ALBUMID, MAX(MILLISECONDS) AS MAXDURATION
	FROM TRACK 
	GROUP BY ALBUMID
) AS MAXTRACK ON T.ALBUMID = MAXTRACK.ALBUMID AND T.MILLISECONDS = MAXTRACK.MAXDURATION;

--  Individuate la durata media delle tracce per ogni album.

SELECT ALBUM.TITLE, ROUND(AVG(TRACK.Milliseconds)/1000 , 2)  AS AVG_TRACK_SECONDS
FROM ALBUM 
JOIN TRACK ON ALBUM.ALBUMID = TRACK.ALBUMID
GROUP BY ALBUM.TITLE ;

-- Individuate gli album che hanno più di 20 tracce e
-- mostrate il nome dell’album e il numero di tracce in esso contenute


    
    

    
    