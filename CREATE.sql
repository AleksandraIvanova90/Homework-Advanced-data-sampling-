CREATE TABLE if NOT EXISTS Genre(
	genre_id SERIAL  PRIMARY KEY,
	name VARCHAR(30) UNIQUE
);

CREATE TABLE if NOT EXISTS Artist(
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE
);

 CREATE TABLE if NOT EXISTS GenreArtist(
 	genre_id   INTEGER REFERENCES Genre(genre_id),
	artist_id  INTEGER REFERENCES Artist(artist_id),
	CONSTRAINT pk PRIMARY KEY(genre_id, artist_id)
);      

CREATE TABLE if NOT EXISTS Album(
	album_id     SERIAL      PRIMARY KEY,
	name         VARCHAR(60) UNIQUE,
	release_year INTEGER     CHECK(release_year > 1980)
);

CREATE TABLE if NOT EXISTS Track(
	track_id SERIAL      PRIMARY KEY,
	name     VARCHAR(60) UNIQUE,
	duration INTEGER     CHECK (duration > 60),
	album_id INTEGER     NOT NULL REFERENCES Album(album_id)
);

CREATE TABLE if NOT EXISTS ArtistAlbum(
	artist_id INTEGER REFERENCES Artist(artist_id),
	album_id  INTEGER REFERENCES Album(album_id),
	CONSTRAINT rk PRIMARY KEY(artist_id, album_id)
);      

CREATE TABLE if NOT EXISTS Collection(
	collection_id SERIAL      PRIMARY KEY,
	name          VARCHAR(30) UNIQUE,
	release_year  INTEGER     CHECK(release_year > 1980)
);

CREATE TABLE if NOT EXISTS CollectionTrack(
	track_id      INTEGER REFERENCES Track(track_id),
	collection_id INTEGER REFERENCES Collection(collection_id),
	CONSTRAINT sk PRIMARY KEY(track_id, collection_id)
);   

	