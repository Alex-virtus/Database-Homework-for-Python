-- Задание 1

-- Заполнение таблицы Жанры
INSERT INTO genres (title)
VALUES
('Hip-hop'),
('Rock'),
('Pop'),
('Rap rock'),
('Industrial Metal');

-- Заполнение таблицы Исполнители
INSERT INTO artists (name_nikname)
VALUES
('Татьяна Буланова'),
('Eminem'),
('Баста'),
('MiyaGi'),
('Linkin Park'),
('Metallica');

-- Заполнение таблицы Альбомы
INSERT INTO albums (title, release_year)
VALUES
('Стерпится-слюбится', 1997),
('Баста 5', 2016),
('Баста 40', 2020),
('The Slim Shady LP', 1999),
('Meteora', 2003),
('Hybrid Theory', 2000),
('Buster Keaton', 2019),
('The Eminem Show', 2002),
('Metallica', 1991);

-- Заполнение таблицы Треки
INSERT INTO tracks (title, duration, album_id)
VALUES
('Мой ненаглядный', '242', '1'),
('My Name Is', '268', '4'),
('Numb', '188', '5'),
('In the End', '216', '6'),
('Самурай', '164', '7'),
('Marlboro', '243', '7'),
('Выпускной (Медлячок)', '335', '2'),
('Лампочка', '390', '3'),
('Nothing Else Matters', '387', '9'),
('Without Me', '290', '8');

-- Заполнение таблицы Сборники
INSERT INTO Collection (name, release_year)
VALUES
('Лучшие хиты 2000-х', 2010),
('Русский хип-хоп. Вечные хиты', 2020),
('NOW Thats What I Call Music 2019', 2019),
('Великие рок-баллады', 2018),
('Золотая коллекция. Дискотека 90-х', 2017),
('Hip-Hop Essentia', 2021);

-- Заполнение таблицы связи Исполнители и Жанры
INSERT INTO genreartist (artist_id, genre_id)
VALUES
('1', '3'),
('2', '1'),
('2', '4'),
('3', '1'),
('4', '1'),
('5', '2'),
('5', '5'),
('6', '2');

-- Заполнение таблицы связи Исполнители и Альбомы
INSERT INTO artistalbum (artist_id, album_id)
VALUES
('1', '1'),
('2', '4'),
('2', '8'),
('3', '2'),
('3', '3'),
('4', '7'),
('5', '5'),
('5', '6'),
('6', '9');

-- Заполнение таблицы связи Сборник и Треки
INSERT INTO collectiontrack (track_id, collection_id)
VALUES
('1', '5'),
('2', '1'),
('3', '1'),
('4', '1'),
('5', '3'),
('6', '2'),
('7', '2'),
('8', '6'),
('9', '4');