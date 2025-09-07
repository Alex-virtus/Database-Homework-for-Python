-- Создание таблицы Исполнители
CREATE TABLE IF NOT EXISTS Artists (
	id SERIAL PRIMARY KEY,
	name_nikname VARCHAR(100) NOT NULL
);

-- Создание таблицы Альбомы
CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	release_year INTEGER NOT NULL
);

-- Создание таблицы Треки
CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	duration INTERVAL NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Albums(id)
);

-- Создание таблицы Жанры
CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL
);


-- Создание таблицы Сборник
CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	release_year INTEGER NOT NULL
	);

-- Создание таблицы связи Исполнители и Жанры
CREATE TABLE IF NOT EXISTS GenreArtist (
	artist_id INTEGER NOT NULL REFERENCES Artists(id),
	genre_id INTEGER NOT NULL REFERENCES Genres(id),
	PRIMARY KEY (artist_id, genre_id)
);

-- Создание таблицы связи Исполнители и Альбомы
CREATE TABLE IF NOT EXISTS AristAlbum (
	artist_id INTEGER NOT NULL REFERENCES Artists(id),
	album_id INTEGER NOT NULL REFERENCES Albums(id),
	PRIMARY KEY (artist_id, album_id)
);

-- Создание таблицы связи Сборник и Треки
CREATE TABLE IF NOT EXISTS CollectionTrack (
	track_id INTEGER NOT NULL REFERENCES Tracks(id),
	collection_id INTEGER NOT NULL REFERENCES Collection(id),
	PRIMARY KEY (track_id, collection_id)
);