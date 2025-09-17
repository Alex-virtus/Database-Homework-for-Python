-- Задание 2

-- 1.Название и продолжительность самого длительного трека.
SELECT title, duration 
FROM tracks
ORDER BY duration DESC
LIMIT 1;

-- 2.Название треков, продолжительность которых не менее 3,5 минут(210 сек).
SELECT title 
FROM tracks
WHERE duration >= 210;

-- 3.Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name 
FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

-- 4.Исполнители, чьё имя состоит из одного слова.
SELECT name_nikname  
FROM artists
WHERE name_nikname  NOT LIKE '% %';

-- 5.Название треков, которые содержат слово «мой» или «my».
SELECT title 
FROM tracks
WHERE LOWER(title) LIKE '%my%' OR LOWER(title) LIKE '%мой%';

-- Задание 3

-- 1.Количество исполнителей в каждом жанре.
SELECT g.title , COUNT(ga.genre_id) 
FROM genres g
JOIN genreartist ga ON g.id = ga.genre_id
GROUP BY g.title ;

-- 2.Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(*) 
FROM tracks t
JOIN albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3.Средняя продолжительность треков по каждому альбому.
SELECT a.title, AVG(t.duration) 
FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY a.title;

-- 4.Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT ar.name_nikname  
FROM artists ar
WHERE ar.id NOT IN (
  SELECT aa.artist_id 
  FROM artistalbum aa
  JOIN albums a ON aa.album_id = a.id
  WHERE a.release_year = 2020
);
-- 5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT c.name 
FROM collection c
JOIN collectiontrack ct ON c.id = ct.collection_id
JOIN tracks t ON ct.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN artistalbum aa ON aa.album_id = a.id
JOIN artists ar ON aa.artist_id = ar.id
WHERE ar.name_nikname  = 'MiyaGi';

-- Задание 4(необязательное)

-- 1.Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.title
FROM albums a
JOIN artistalbum aa ON a.id = aa.album_id
JOIN genreartist ga ON aa.artist_id = ga.artist_id
GROUP BY a.title
HAVING COUNT(DISTINCT ga.genre_id) > 1;

-- 2.Наименования треков, которые не входят в сборники.
SELECT t.title
FROM tracks t
LEFT JOIN collectiontrack ct ON t.id = ct.track_id
WHERE ct.collection_id IS NULL;

-- 3.Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT ar.name_nikname , t.title, t.duration
FROM tracks t
JOIN albums a ON t.album_id = a.id
JOIN artistalbum aa ON a.id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

-- 4.Названия альбомов, содержащих наименьшее количество треков.
SELECT a.title
FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY a.title
HAVING COUNT(t.id) = (
  SELECT MIN(track_count)
  FROM (SELECT COUNT(*) AS track_count
    FROM tracks
    GROUP BY album_id
  )
);