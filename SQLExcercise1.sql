--Query all of the entries in the Genre table
select * from genre;

--Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
select * from Artist Order by ArtistName;

--Write a SELECT query that lists all the songs in the Song table and include the Artist name
select 
Song.Title,
a.ArtistName
from Song left join Artist a on ArtistId = a.Id;

--Write a SELECT query that lists all the Artists that have a Pop Album
select 
a.ArtistName,
album.*
from album 
left join artist a on artistId = a.id 
left join genre on genre.Id = album.GenreId where genre.Name = 'Pop';

--Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
select 
a.ArtistName,
genre.Name as Genre,
album.Title
from album left join artist a on artistId = a.id  left join genre on genre.id = album.GenreId where genre.Name = 'Rock'  or Genre.Name = 'Jazz';

--Write a SELECT statement that lists the Albums with no songs
select 
album.Title
from album 
left join song on album.Id = song.AlbumId 
where song.AlbumId is null
order by album.title;

--Using the INSERT statement, add one of your favorite artists to the Artist table.
--Insert into Artist (ArtistName, YearEstablished) Values ('Highly Suspect', 2009);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
--Insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) values ('Mister Asylum', 2015, 39.58, 'Atlantic', 29, 2); 

--Using the INSERT statement, add some songs that are on that album to the Song table.
--Insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) values ('Mister Asylum', 243, '7/17/2015', 2, 29, 23);


SELECT a.Title AlbumTitle, s.Title SongTitle 
FROM Album a 
left JOIN Song s ON s.AlbumId = a.Id;

SELECT a.Title AlbumTitle, s.Title SongTitle 
FROM Song s 
LEFT JOIN Album a ON s.AlbumId = a.Id;

--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
select 
s.title SongTitle,
al.title AlbumTitle,
ar.ArtistName
from Song s 
left join album al on s.AlbumId = al.Id 
left join Artist ar on s.ArtistId = ar.Id where ArtistName = 'Highly Suspect';

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select count(s.Title) as SongsPerAlbum,
a.Title
from Song s
left join album a on a.Id = s.AlbumId
group by a.Title

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select count(s.Title) as SongsPerArtist,
a.ArtistName
from song s 
left join Artist a on a.Id = s.ArtistId
group by a.ArtistName;

--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select count(s.Title) as SongsPerGenre,
g.name
from song s
left join Genre g on g.Id = s.GenreId
group by g.Name;

--Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
select Artist.ArtistName,
count(label) as NumOfLabels
from album
left join Artist on ArtistId = Artist.Id
group by Artist.ArtistName
having count(label) > 1;

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select top 1
Album.Title,
max(Album.AlbumLength) as LongestAlbum
from Album
group by Album.Title, AlbumLength
order by AlbumLength desc

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
--Modify the previous query to also display the title of the album.
select top 1
max(Song.SongLength) as SongDuration,
Song.Title as SongTitle,
Album.Title as AlbumTitle
from Song
left join Album on AlbumId = Album.Id
group by Song.Title, Song.SongLength, Album.Title
order by song.SongLength desc