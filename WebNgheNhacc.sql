CREATE TABLE Account 
(
	[email] varchar(50) PRIMARY KEY NOT NULL,
	[password] varchar(200) NOT NULL,
	[role] int NOT NULL
)
Insert into Account([email],[password],[role])
Values
('ltthanh1107@gmail.com','','')


CREATE TABLE Users
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[name] nvarchar(50) NOT NULL,
	[email] varchar(50) NOT NULL,
	[permit] bit Default 1 NOT NULL,
	CONSTRAINT User_emailAccount_fk FOREIGN KEY (email) REFERENCES Account(email)
)
Insert into Users([name],[permit])
Values
(N'Thành',1)

CREATE TABLE Type_Music
(
	[id]  int IDENTITY(1,1) PRIMARY KEY,
	[name] nvarchar(50) NOT NULL,
)
Insert into Type_Music([name])
Values
('Nhạc rap')

CREATE TABLE Music
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[name] nvarchar(50) NOT NULL,
	[lyric] text NOT NULL,
	[file] varchar(50) NOT NULL,
	[image] varchar(50) NOT NULL,
	[listened] int NOT NULL,
	[liked] int NOT NULL,
	[id_type] int NOT NULL,
	CONSTRAINT Mussic_idSpec_fk FOREIGN KEY (id_type) REFERENCES Type_Music(id)
)
Insert into Music([name],[lyric],[file],[image],[listened],[liked])
Values 
('Anh là ai','',)



CREATE TABLE Comment
(
	[id_music] int NOT NULL,
	[id_user] int NOT NULL,
	[time] datetime NOT NULL,
	[content] text NOT NULL,
	CONSTRAINT Comment_idmusic_fk FOREIGN KEY (id_music) REFERENCES Music(id),
	CONSTRAINT Comment_iduser_fk FOREIGN KEY (id_user) REFERENCES Users(id)
)
Insert into Comment([content])
Values 
('nhạc hay')


CREATE TABLE Playlist
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[name] nvarchar(50) NOT NULL,
	[id_user] int NOT NULL,
	CONSTRAINT Playlist_idUser_fk FOREIGN KEY (id_user) REFERENCES Users(id)
)
Insert into Playlist([name])
Values
('Ablum nhạc us uk')

CREATE TABLE Playlist_Music
(
	[id_playlist] int NOT NULL,
	[id_music] int NOT NULL,
	CONSTRAINT PlaylistMusic_idPlaylist_fk FOREIGN KEY (id_playlist) REFERENCES Playlist(id),
	CONSTRAINT PlaylistMusic_idMusic_fk FOREIGN KEY (id_music) REFERENCES Music(id)
)

