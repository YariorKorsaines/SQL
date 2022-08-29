CREATE DATABASE music_app;

/*General tables*/
CREATE TABLE albums
(
    id           serial primary key,
    name         text,
    date_created date default CURRENT_DATE
);


CREATE TABLE tracks
(
    id           serial primary key,
    name         text,
    date_created date default CURRENT_DATE,
    id_album     int references albums (id)
);

CREATE TABLE performers
(
    id   serial primary key,
    name text
);

CREATE TABLE genres
(
    id   serial primary key,
    name text
);

CREATE TABLE collections
(
    id           serial primary key,
    name         text,
    date_created date default CURRENT_DATE
);

/*Many to Many tables*/

CREATE TABLE albums_performers
(
    id           serial primary key,
    id_album     int references albums (id),
    id_performer int references performers (id)
);

CREATE TABLE genres_performers
(
    id           serial primary key,
    id_genre     int references genres (id),
    id_performer int references performers (id)
);

CREATE TABLE tracks_collections
(
    id            serial primary key,
    id_track      int references tracks (id),
    id_collection int references collections (id)
);
insert into albums(name)
values ('default'),
       ('default_2'),
       ('default_1');

insert into tracks(name, id_album)
VALUES ('song_1', 1),
       ('song_2', 2);


insert into performers(name)
values ('user_1'),
       ('user_2');


insert into albums_performers (id_album, id_performer)
values (1, 1),
       (3, 2),
       (2, 1),
       (3, 1);

insert into genres(name)
values ('pop'),
       ('Шансон');


insert into genres_performers(id_genre, id_performer)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 2);

insert into collections(name)
values ('collection_1'),
       ('collection_2');


insert into tracks_collections(id_track, id_collection)
VALUES (1,1),
       (1,2),
       (2,2);