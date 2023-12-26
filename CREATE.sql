CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
 	genre_name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS artists (
	id SERIAL PRIMARY KEY,
 	artist_name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS genres_artists (
  	genre_id INTEGER NOT NULL REFERENCES genres(id),
  	artist_id INTEGER NOT NULL REFERENCES artists(id),
  	CONSTRAINT genres_artists_pk PRIMARY KEY(genre_id, artist_id)
);
  
CREATE TABLE IF NOT EXISTS albums (
  	id SERIAL PRIMARY KEY,
  	album_name VARCHAR(100) NOT NULL,
  	release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS albums_artists (
  	album_id INTEGER NOT NULL REFERENCES albums(id),
  	artist_id INTEGER NOT NULL REFERENCES artists(id),
  	CONSTRAINT albums_artists_pk PRIMARY KEY(album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS tracks (
  	id SERIAL PRIMARY KEY,
  	track_name VARCHAR(100) NOT NULL,
  	track_duration NUMERIC NOT NULL,
  	album_id INTEGER NOT NULL REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS collections (
  	id SERIAL PRIMARY KEY,
  	collection_name VARCHAR(100) NOT NULL,
  	release_year INTEGER NOT NULL
);
  
CREATE TABLE IF NOT EXISTS tracks_collections (
	track_id INTEGER NOT NULL REFERENCES tracks(id),  
	collection_id INTEGER NOT NULL REFERENCES collections(id),
 	CONSTRAINT tracks_collections_id PRIMARY KEY(track_id, collection_id)
);