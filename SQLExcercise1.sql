select * from genre;

select * from Artist Order by ArtistName;

select 
Song.*,
a.ArtistName
from Song left join Artist a on ArtistId = a.Id;

select 
a.ArtistName,
album.*
from album 
left join artist a on artistId = a.id 
left join genre on genre.Id = album.GenreId where genre.Name = 'Pop';

select 
a.ArtistName,
genre.Name,
album.*
from album left join artist a on artistId = a.id  left join genre on genre.id = album.GenreId where genre.Name = 'Rock'  or Genre.Name = 'Jazz';


select 
album.Title
from album left join song on album.Id = song.AlbumId where song.Id is null;

--Insert into Artist (ArtistName, YearEstablished) Values ('Highly Suspect', 2009);

--Insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) values ('Mister Asylum', 2015, 39.58, 'Atlantic', 29, 2); 

--Insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) values ('Mister Asylum', 243, '7/17/2015', 2, 29, 23);

select * from Song;
select * from Album;
select * from Artist;

--update Album
--set AlbumLength = 2398
--where id = 23;

--update Album
--set ReleaseDate = '7/17/2015'
--where id = 23;

SELECT a.Title AlbumTitle, s.Title SongTitle FROM Album a left JOIN Song s ON s.AlbumId = a.Id;
SELECT a.Title AlbumTitle, s.Title SongTitle FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;

select 
s.title SongTitle,
al.title AlbumTitle,
ar.ArtistName
from Song s 
left join album al on s.AlbumId = al.Id 
left join Artist ar on s.ArtistId = ar.Id where ArtistName = 'Highly Suspect';

select count(s.Title) as SongsPerAlbum,
a.Title
from Song s
left join album a on a.Id = s.AlbumId
group by a.Title

select count(s.Title) as SongsPerArtist,
a.ArtistName
from song s 
left join Artist a on a.Id = s.ArtistId
group by a.ArtistName;

select count(s.Title) as SongsPerGenre,
g.name
from song s
left join Genre g on g.Id = s.GenreId
group by g.Name;


select Artist.ArtistName,
count(label) as NumOfLabels
from album
left join Artist on ArtistId = Artist.Id
group by Artist.ArtistName
having count(label) > 1;