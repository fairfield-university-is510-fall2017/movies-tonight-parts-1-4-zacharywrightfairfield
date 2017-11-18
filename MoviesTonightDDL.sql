# Creates database
CREATE DATABASE MoviesTonight;
# Uses database MoviesTonight
USE MoviesTonight;
# Creates tables for database MoviesTonight
CREATE TABLE Theater (
	TheaterID int(11) NOT NULL auto_increment,
    TheaterName varchar(50) default NULL, 
    Location varchar(50) default NULL, 
    Phone int(11) default NULL,
    PRIMARY KEY (TheaterID)
);
CREATE TABLE Movie (
	MovieID int(11) NOT NULL auto_increment,
    Title varchar(255) default NULL,
    Rating varchar(5) default NULL,
    PRIMARY KEY (MovieID)
);
CREATE TABLE Shows (
	ShowsID int(11) NOT NULL auto_increment,
    Showtime time,
    MovieID int(11),
    TheaterID int(11),
    PRIMARY KEY (ShowsID)
);
CREATE TABLE Artist (
	ArtistID int(11) NOT NULL auto_increment,
    ArtistName varchar(50) default NULL,
    PRIMARY KEY (ArtistID)
);
CREATE TABLE Credit (
	CreditID int(11) NOT NULL auto_increment,
    CCode varchar(1) default NULL,
    ArtistID int(11),
    MovieID int(11),
    PRIMARY KEY (CreditID)
);

# Assigning foreign keys
ALTER TABLE Shows  
  ADD FOREIGN KEY (TheaterID)
    REFERENCES Theater (TheaterID);
ALTER TABLE Shows  
  ADD FOREIGN KEY (MovieID)
    REFERENCES Movie (MovieID);
ALTER TABLE Credit  
  ADD FOREIGN KEY (ArtistID)
    REFERENCES Artist (ArtistID);
ALTER TABLE Credit
  ADD FOREIGN KEY (MovieID)
    REFERENCES Movie (MovieID);