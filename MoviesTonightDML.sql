USE moviestonight;

INSERT INTO Movie (Title, Rating)
SELECT DISTINCT MTitle, Rating
FROM DATASHEET; 

INSERT INTO Artist (ArtistName)
SELECT DISTINCT CNAME
FROM DATASHEET;

INSERT INTO Theater (TheaterName, Location, Phone)
SELECT DISTINCT TNAME, Location, Phone
FROM DATASHEET;


INSERT INTO Shows (Showtime, MovieID, TheaterID)
SELECT DISTINCT Showtime, Movie.MovieID, Theater.TheaterID
FROM Movie JOIN DATASHEET ON (Movie.Title = DATASHEET.MTitle)
			JOIN Theater ON (Theater.TheaterName = DATASHEET.TName);

INSERT INTO Credit (CCode, MovieID, ArtistID)
SELECT DISTINCT CCode, Movie.MovieID, Artist.ArtistID
FROM Movie JOIN DATASHEET ON (Movie.Title = DATASHEET.MTitle)
			JOIN Artist ON (Artist.ArtistName = DATASHEET.CNAME);
            
# check for dupiclate rows
SELECT TName, MTitle, Showtime, CName, CCode, count(*) as RowCount
FROM DATASHEET
GROUP BY TName, MTitle, Showtime, CName, CCode
HAVING RowCount > 1;

SELECT * 
FROM Theater;

SELECT *
FROM Movie;

SELECT *
FROM Artist;

SELECT * 
FROM Shows;

SELECT *
FROM Credit;