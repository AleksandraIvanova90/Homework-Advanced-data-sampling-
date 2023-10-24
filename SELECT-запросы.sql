--Задание 2.
--1. Название и продолжительность самого длительного трека.
SELECT name, duration 
FROM track
WHERE  duration = (SELECT MAX(duration) FROM track);

--2. Название треков, продолжительность которых не менее 3,5 минут (210 секунд).
SELECT name, duration 
FROM track
WHERE  duration < 210
ORDER BY duration DESC;

--3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name, release_year 
FROM collection
WHERE  release_year BETWEEN 2018 AND 2020;

--4. Исполнители, чьё имя состоит из одного слова.
SELECT name 
FROM artist
WHERE name NOT LIKE '% %' 
ORDER BY name;

--5. Название треков, которые содержат слово «мой» или «my».
SELECT name 
FROM track
WHERE name LIKE '%мой%' OR name LIKE'%my%'
ORDER BY name;

--Задание 3.

--1.Количество исполнителей в каждом жанре.
SELECT g.name, count(a.name)
FROM genre g 
JOIN genreartist g2 ON g.genre_id = g2.genre_id
JOIN artist a ON g2.artist_id  = a.artist_id
GROUP BY g.name
ORDER BY COUNT(a.name);

--2. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT a.name, count(t.name)
FROM album a  
LEFT JOIN track t ON a.album_id = t.album_id 
WHERE a.release_year BETWEEN 2019 AND 2020
GROUP BY a.name
ORDER BY count(t.name);

--3. Средняя продолжительность треков по каждому альбому
SELECT a.name, AVG(t.duration)
FROM album a 
LEFT JOIN track t ON a.album_id  = t.album_id
GROUP BY a.name
ORDER BY a.name;

--4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT a.name
FROM artist a 
JOIN artistalbum a2 ON a.artist_id  = a2.artist_id
JOIN album a3 ON a2.album_id = a3.album_id
WHERE a.name != (SELECT DISTINCT a.name  
				 FROM artist a 
				 JOIN artistalbum a2 ON a.artist_id  = a2.artist_id
  				 JOIN album a3 ON a2.album_id = a3.album_id
  				 WHERE a3.release_year = '2020')
ORDER BY a.name;

--5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.name 
FROM collection c 
JOIN collectiontrack c2 ON c.collection_id = c2.collection_id 
JOIN track t ON c2.track_id = t.track_id
JOIN album a ON t.album_id = a.album_id 
JOIN artistalbum a2 ON a.album_id = a2.artist_id 
JOIN artist a3 ON a2.artist_id = a3.artist_id 
WHERE a3.name = 'КИНО';




	              


