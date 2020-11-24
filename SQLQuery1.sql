/* 3. Write a SELECT query that lists all the songs in the Song table and include the Artist name

SELECT * FROM Song
JOIN Artist on Song.ArtistId = Artist.Id; 

*/


/* 4. Write a SELECT query that lists all the Artists that have a Pop Album

SELECT * FROM Artist a
JOIN Album al on a.Id = al.ArtistId
JOIN Genre g on al.GenreId = g.Id
WHERE g.Label = 'Pop'

*/

/* 5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album

SELECT * FROM Artist a
JOIN Album al on a.Id = al.ArtistId
JOIN Genre g on al.GenreId = g.Id
WHERE g.Label = 'Jazz' 
OR g.Label = 'Label';

*/

/* 6. Write a SELECT statement that lists the Albums with no songs

	SELECT * FROM Album a LEFT JOIN Song s on a.Id = s.AlbumId WHERE s.Id IS NULL;

*/

/* 7. Using the INSERT statement, add one of your favorite artists to the Artist table.

	INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Post Malone', 2011);

*/

/* 8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.

	INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Stoney', '12/09/2016', 3040, 'Republic', 28, 13);
	INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Beerbongs & Bentleys', '04/27/2018', 3866, 'Republic', 28, 13);

*/

/* 9. Using the INSERT statement, add some songs that are on that album to the Song table.

	INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Psycho', 229, '02/23/2018', 13, 28, 24);
	INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Rockstar', 200, '09/15/2017', 13, 28, 24);
	INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Congratulations', 220, '01/31/2017', 13, 28, 23);

*/


/* 10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in.
       Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
		 
		 SELECT * FROM Artist ar
		 LEFT JOIN Song s ON s.ArtistId = ar.Id
		 LEFT JOIN Album al ON s.AlbumId = al.Id
		 WHERE ar.ArtistName = 'Post Malone'

*/

/* 11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
	
	SELECT AlbumId, al.Title, COUNT(*) AS songCount FROM Song s
	LEFT JOIN Album al ON s.AlbumId = al.Id
	GROUP BY AlbumId, al.Title;

*/

/* 12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
	
	SELECT ArtistId, ar.ArtistName, COUNT(*) AS singles FROM Song s
	LEFT JOIN Artist ar ON s.ArtistId = ar.Id	
	GROUP BY ArtistId, ar.ArtistName;

*/

/* 13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
	
	SELECT GenreId, g.Label, COUNT(*) AS SongsInGenre FROM Song s
	LEFT JOIN Genre g ON s.GenreId = g.Id
	GROUP BY GenreId, g.Label;
	
*/

/* 14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword

	SELECT ar.ArtistName, COUNT(DISTINCT a.Label) AS RecordLabels FROM Album a
	LEFT JOIN Artist ar ON a.ArtistId = ar.Id
	GROUP BY ar.ArtistName
	HAVING COUNT(DISTINCT a.Label) > 1;

*/

/* 15. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

	SELECT Title, AlbumLength FROM Album
	WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album);

*/

/* 16. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
	SELECT Title, a.ArtistName, SongLength FROM Song s
	LEFT JOIN Artist a ON s.ArtistId = a.Id
	WHERE SongLength = (SELECT MAX(SongLength) FROM Song);
*/

/* 17. Modify the previous query to also display the title of the album.
	
*/

SELECT s.Title, al.Title, a.ArtistName, SongLength FROM Song s
	LEFT JOIN Artist a ON s.ArtistId = a.Id
	LEFT JOIN Album al ON s.AlbumId = al.Id
	WHERE SongLength = (SELECT MAX(SongLength) FROM Song);