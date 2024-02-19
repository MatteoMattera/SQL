USE CHINOOK ;

-- Fate un elenco di tutte le tabelle
SHOW TABLES ;

SELECT * FROM ALBUM;

-- MOSTRA LE PRIME 10 RIGHE DELLA TABELLA ALBUM
SELECT *
FROM ALBUM
LIMIT 10 ;

-- Trovate il numero totale di canzoni della tabella Tracks.
SELECT COUNT(*)
FROM track 

-- Trovate i diversi generi presenti nella tabella Genere

SELECT DISTINCT NAME
FROM genre ;

-- Recuperate il nome di tutte le tracce e del genere associato

SELECT TRACK.NAME AS TRACKNAME, GENRE.NAME AS GENERENAME 
FROM TRACK
JOIN GENRE ON TRACK.GenreId =genre.GenreId
ORDER BY GENERENAME ;

-- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database.
SELECT DISTINCT ARTIST.NAME
FROM ARTIST
JOIN ALBUM ON ARTIST.ARTISTID = ALBUM.ARTISTID ;


-- Esistono artisti senza album nel database?

SELECT DISTINCT artist.Name AS ARTISTNAME, ALBUM.ALBUMID
FROM album
RIGHT JOIN artist ON ARTIST.ArtistId = album.ArtistId
WHERE ALBUMID IS NULL ;


 
 
SELECT artist.Name FROM artist
WHERE EXISTS (SELECT album.AlbumId FROM album WHERE artist.ArtistId = album.ArtistId)
ORDER BY 1;

/*Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media.
Esiste un modo per recuperare il nome della tipologia di media?*/

SELECT TRACK.NAME AS TRACKNAME, genre.Name AS GENERENAME, mediatype.Name AS MEDIATYPENAME
FROM TRACK
JOIN genre ON TRACK.GenreId = genre.GenreId
JOIN mediatype ON TRACK.MediaTypeId = mediatype.MediaTypeId;


-- Elencate i nomi di tutti gli artisti e dei loro album.

SELECT artist.Name, album.Title
FROM ARTIST
JOIN ALBUM ON ARTIST.ARTISTID = ALBUM.ARTISTID ;


