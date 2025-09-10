-- Создание таблицы Исполнители
CREATE TABLE IF NOT EXISTS Artists (
	id SERIAL PRIMARY KEY,
	name_nikname VARCHAR(100) NOT NULL
);

-- Создание таблицы Альбомы c ограничением на год выпуска
CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	release_year INTEGER NOT NULL CHECK (release_year >= 1900)
);

-- Создание таблицы Треки
CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	duration INTEGER NOT NULL CHECK (duration > 0),	-- Длительность в секндах
	album_id INTEGER NOT NULL REFERENCES Albums(id) ON DELETE CASCADE
);

-- Создание таблицы Жанры
CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL	UNIQUE	-- Название жанра уникальное чтобы исключить дублирование
);


-- Создание таблицы Сборник с ограничением на год выпуска
CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	release_year INTEGER NOT NULL CHECK (release_year >= 1900)
	);

-- Создание таблицы связи Исполнители и Жанры ()
CREATE TABLE IF NOT EXISTS GenreArtist (
	artist_id INTEGER NOT NULL REFERENCES Artists(id) ON DELETE CASCADE,
	genre_id INTEGER NOT NULL REFERENCES Genres(id) ON DELETE CASCADE,
	PRIMARY KEY (artist_id, genre_id)
);

-- Создание таблицы связи Исполнители и Альбомы
CREATE TABLE IF NOT EXISTS ArtistAlbum (
	artist_id INTEGER NOT NULL REFERENCES Artists(id) ON DELETE CASCADE,
	album_id INTEGER NOT NULL REFERENCES Albums(id) ON DELETE CASCADE,
	PRIMARY KEY (artist_id, album_id)
);

-- Создание таблицы связи Сборник и Треки
CREATE TABLE IF NOT EXISTS CollectionTrack (
	track_id INTEGER NOT NULL REFERENCES Tracks(id) ON DELETE CASCADE,
	collection_id INTEGER NOT NULL REFERENCES Collection(id) ON DELETE CASCADE,
	PRIMARY KEY (track_id, collection_id)
);