-- Задание 1. Заполните базу данных 
--добавляем жанры песен
INSERT INTO genres (genre_name) 
	VALUES('Pop'), ('Synthpop'), ('Folk'), ('Indi rock'), 
		('Syntwave'), ('Soft-rock'), ('Cover'), ('Jazz'), 
		('Dram&Bass'), ('Metal'), ('Classical');
	
-- добавляем исполнителей
INSERT INTO artists (artist_name) 
	VALUES('Michael Jackson'), ('Альянс'), ('LP'), ('The Weeknd'), 
		('Mitski'), ('Моя Мишель'), ('Sia'), ('Nina Simone'), 
		('Delta Heavy'), ('Wilkinson'), ('Pendulum'), ('In Flames'), 
		('Ludovico Einaudi');

-- добавляем альбомы
INSERT INTO albums (album_name, release_year)
	VALUES('Triller', '1982'), ('Альянс 87', '1987'), ('Death Valley', '2016'), 
		('After Hours', '2020'), ('The Land Is Inhospitable and So Are We', '2023'), 
		('Из цветов и темноты', '2022'), ('Everyday is Christmas', '2017'), 
		('I Put a Spell on You', '1965'), ('Paradise Lost', '2016'),
		('Lazers Not Included', '2013'), ('The Complete Works', '2018'), ('In a Time Lapse', '2013'),
		('Clayman', '2000');

-- добавляем треки
INSERT INTO tracks (track_name, track_duration, album_id)
	VALUES ('Billie Jean','3.5', 1), ('На заре', '5.46', 2), ('Other People', '4.05', 3), ('Lost on You', '4.26', 3), 
		('Blinding Lights', '3.22', 4), ('My Love Mine All Mine', '2.17', 5), ('Зима в сердце', '4.05', 6), 
		('Snowman', '2.42', 7), ('Feeling Good', '2.55', 8), ('White Flag', '3.02', 9), ('Afterglow', '3.45', 10),
		('Self vs Self', '4.45', 11), ('Experience', '5.15', 12), ('Only for the Weak', '4.54', 13);

-- добавляем cборники
INSERT INTO collections (collection_name, release_year)
	VALUES('Хиты 80-х', '2017'), ('Топ 50 песен в стиле фолк', '2016'), ('Топ-100 чарта Shazam', '2023'), 
		('Зимняя атмосфера', '2019'), ('The Best of Nina Simone', '2020'), ('Top 100 Dram&Bass Tracks', '2022'), 
		('Топ 100 саундтреков к фильмам', '2018');

-- таблица связи жанров и исполнителей
INSERT INTO genres_artists (genre_id, artist_id)
	VALUES(1, 1), (1, 7), (2, 2), (3, 3), (4, 3), 
		(5, 4), (6, 5), (7, 6), (8, 8), (9, 9), 
		(9, 10), (9, 11), (10, 12), (11, 13);

-- таблица связи альбома и исполнителей
INSERT INTO albums_artists (album_id, artist_id)
	VALUES(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
		(6, 6), (7, 7),	(8, 8), (9, 9), (10, 10), 
		(11, 11), (11, 12), (12, 13), (13, 12);
	
-- таблица связи трека и сборника
INSERT INTO tracks_collections (track_id, collection_id)
	VALUES(1, 1), (2, 1), (3, 2), (4, 3), (5, 3), 
		(6, 3), (7, 3), (8, 4), (9, 5), (10, 6), 
		(11, 6), (12, 6), (13, 7);	