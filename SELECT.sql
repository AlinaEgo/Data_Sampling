-- Задание 2. Написать SELECT-запросы
-- Название и продолжительность самого длительного трека
SELECT track_name, track_duration FROM tracks 
WHERE track_duration = (SELECT MAX(track_duration) FROM tracks);

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT track_name FROM tracks
WHERE track_duration > 3.5;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name FROM collections
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT artist_name FROM artists 
WHERE NOT artist_name LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT track_name FROM tracks 
WHERE  track_name LIKE  '%мой%' OR  track_name LIKE '%My%';


-- Задание 3. Написать SELECT-запросы
-- Количество исполнителей в каждом жанре
SELECT genre_name, COUNT(a.artist_name) FROM genres g
LEFT JOIN genres_artists a2 ON g.id = a2.genre_id 
LEFT JOIN artists a ON a2.artist_id = a.id 
GROUP BY genre_name 
ORDER BY COUNT(a.artist_name) DESC;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(track_name) FROM tracks t
LEFT JOIN albums a ON t.album_id = a.id
WHERE release_year >= '2019' AND  release_year < '2021';

--Средняя продолжительность треков по каждому альбому 
SELECT a.album_name, AVG(track_duration) FROM tracks t 
LEFT JOIN albums a ON t.album_id = a.id
GROUP BY album_name 
ORDER BY AVG(track_duration);

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT artist_name FROM artists a 
LEFT JOIN albums_artists a2 ON a.id = a2.artist_id
LEFT JOIN albums a3 ON a2.album_id = a3.id
WHERE artist_name NOT IN (SELECT artist_name FROM albums_artists WHERE release_year >= '2020' AND release_year < '2021');

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT collection_name FROM collections c 
LEFT JOIN tracks_collections t ON t.collection_id = c.id 
LEFT JOIN tracks t2 ON t.track_id = t2.id 
LEFT JOIN albums a ON t2.album_id = a.id 
LEFT JOIN albums_artists a2 ON a.id = a2.album_id 
LEFT JOIN artists a3 ON a2.artist_id = a3.id 
WHERE collection_name LIKE '%Nina Simone%';


-- Задание 4
-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT a.album_name
FROM albums_artists aa
JOIN genres_artists ag ON ag.artist_id = aa.artist_id
JOIN albums a ON a.id = aa.album_id
GROUP BY a.album_name
HAVING COUNT(DISTINCT ag.genre_id) > 1;

-- 2. Наименования треков, которые не входят в сборники.
SELECT track_name FROM tracks t
LEFT JOIN  tracks_collections tc ON t.id = tc.track_id
WHERE tc.track_id IS null;

-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT artist_name, track_duration FROM artists ar
LEFT JOIN albums_artists aa ON ar.id = aa.artist_id
LEFT JOIN albums a ON a.id = aa.album_id
LEFT JOIN tracks t ON t.album_id = a.id
WHERE track_duration = (SELECT MIN(track_duration) FROM tracks);

-- 4. Названия альбомов, содержащих наименьшее количество треков.
SELECT a.album_name, COUNT(t.id) as track_count
FROM albums a
LEFT JOIN tracks t ON t.album_id = a.id
GROUP BY a.id
HAVING COUNT(t.id) = (SELECT MIN(track_count) FROM (SELECT COUNT(id) as track_count FROM tracks GROUP BY album_id) as min_track_counts);
