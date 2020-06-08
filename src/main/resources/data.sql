insert into user (id,username,password) values (1,'admin123','$2a$10$g09DwEO7fAOPUWJfJRekIuJov8m1tIWbC7HODMMJK9d8qNarsgdCy');
insert into user (id,username,password) values (2,'user123','$2a$10$BOt39Rnda0f0lSGPzR7y7.VOvVXC6Tyt.TFPXtVpKuxdB2G1BDqtS');

insert into role (id,name) values (1,'ROLE_ADMIN');
insert into role (id,name) values (2,'ROLE_USER');

insert into user_roles (users_id,roles_id) values (1,1);
insert into user_roles (users_id,roles_id) values (2,2);

insert into category(id,name) values (1, 'Samochody');
insert into category(id,name) values (2, 'Biznes');
insert into category(id,name) values (3, 'Sluby');

insert into gallery(id,tytul,opis,data_dodania, category_id) values (1, 'Audi A6', 'Nowoczesny samochod','01-06-2020 15:00:00', 1);
insert into gallery(id,tytul,opis,data_dodania, category_id) values (2, 'Audi RS4', 'Samochód: Audi RS4','03-06-2020 15:00:00', 1);
insert into gallery(id,tytul,opis,data_dodania, category_id) values (3, 'Audi S3', 'Samochód: Audi S3','03-06-2020 16:00:00', 1);
insert into gallery(id,tytul,opis,data_dodania, category_id) values (4, 'Zdjęcie biznesowe', 'Zdjęcie przedstawia spotkanie biznesowe','02-06-2020 15:00:00', 2);
insert into gallery(id,tytul,opis,data_dodania, category_id) values (5, 'Zdjęcie ślubne', 'Zdjęcie przedstawia sesję ślubną','03-06-2020 16:20:00', 3);


insert into gallery_photo(id,photo,gallery_id) values (1,FILE_READ('classpath:static/Audi-A6.jpg'),1);
insert into gallery_photo(id,photo,gallery_id) values (2,FILE_READ('classpath:static/RS4.jpg'),2);
insert into gallery_photo(id,photo,gallery_id) values (3,FILE_READ('classpath:static/s3.jpg'),3);
insert into gallery_photo(id,photo,gallery_id) values (4,FILE_READ('classpath:static/biznes1.jpg'),4);
insert into gallery_photo(id,photo,gallery_id) values (5,FILE_READ('classpath:static/slub1.jpg'),5);

insert into opinion(id, stars, comment, gallery_id, user_id) values (1, '5', 'Bardzo ladne zdjecie, pozdrawiam :)', 1, 2);