CREATE DATABASE online_test;
\c online_test;

CREATE SCHEMA tmp;
SET search_path=tmp;

CREATE DOMAIN gender CHAR(1)
  CHECK (value IN ( 'F' , 'M' ) );

CREATE TABLE users(
  userId serial primary key,
  fullName varchar(32) not null,
  userName varchar(32) not null,
  phoneNumber varchar(32) not null,
  password varchar(60) not null,
  gend tmp.gender
);

INSERT INTO users 
  (userId, fullname, userName, phoneNumber, password, gend)
VALUES 
  ('1', 'Aliyev', 'Vali', '998901234567', '1234', 'M'),
  ('2', 'Timurova', 'Komila', '998901234567', '4321', 'F');

SELECT * FROM users where username  = 'Vali' and password = '1234'




CREATE TABLE subjects(
  subject_id serial primary key,
  subject_name varchar(32) not null
);

INSERT INTO 
  subjects (subject_id, subject_name)
VALUES 
  ('1', 'Matematika'), 
  ('2', 'Ingliz tili'),
  ('3', 'Fizika'),
  ('4', 'Biologiya'),
  ('5', 'Kimyo');



CREATE TABLE universities(
  university_id serial primary key,
  university_name varchar(32) not null
);

INSERT INTO
  universities (university_id, university_name) 
VALUES 
  ('1', 'TATU'),
  ('2', 'Moliya'),
  ('3', 'Milliy'),
  ('4', 'Tibbiyot');




CREATE TABLE fakultets(
  fakultet_id INT not null,
  fakultet_name varchar(32) not null,
  university_id INT not null references universities(university_id) on delete cascade,
  first_subject INT not null references subjects(subject_id) on delete cascade,
  second_subject INT not null references subjects(subject_id) on delete cascade,
  grant_max int not null,
  contract_max int not null,
  grand_score decimal(4, 1) not null,
  contract_score decimal(4, 1) not null,
);

('1','20','45','Amaliy matematika', '1', '3', '165.7', '124.6', '1'),
('2','14','96','Raqamli Iqtisodiyot', '1', '2', '161.3', '101.9', '1'),
('3','35','81','Iqtisodiyot (tarmoqlar va sohalar bo''yicha)', '1', '2', '179.7', '129.5', '1'),
('4','36','49','Vagonlarga xizmat kursatish', '1', '3', '68.8', '56.9', '1'),

INSERT INTO
  fakultets (fakultet_id, fakultet_name, university_id, first_subject, second_subject, grant_max, contract_max, grand_score, contract_score)
VALUES 
  ('1', 'Kompyuter injiniring', '1', '1', '2', '35','35', '176.3', '142.7'),
  ('2', 'Daturiy injiniring', '1', '1', '2', '45','45', '176.3', '142.7'),
  ('3', 'Kiberxavfsizlik', '1', '1', '3', '55','55', '176.3', '142.7'),
  ('4', 'Iqtisodiyot', '2', '1', '2', '65','65', '176.3', '142.7'),
  ('5', 'Soliqlar va sugurta', '2', '1', '2', '32','32', '176.3', '142.7'),
  ('6', 'Buxgalteriya hisobi', '2', '1', '2', '42','42', '176.3', '142.7'),
  ('7', 'Matematik analiz', '3', '1', '3', '52','52', '176.3', '142.7'),
  ('8', 'Zoologiya', '3', '4', '5', '62','62', '176.3', '142.7'),
  ('9', 'Nazariy Fizika', '3', '1', '3', '30','30', '176.3', '142.7'),
  ('10', 'Davolash', '4', '4', '5', '40','40', '176.3', '142.7'),
  ('11', 'Tibbiy pedagogika', '4', '4', '5', '50','50', '176.3', '142.7'),
  ('12', 'Menejment', '4', '1', '2', '60','60', '176.3', '142.7');



CREATE TABLE questions(
  question_id serial,
  subject_id int references subjects(subject_id) on delete cascade not null,
  question text not null,
  question_variants jsonb not null
);


insert into questions(question, question_variants, subject_id) values 
('Sonni raqamlarda yozing  23 mln 453 ming 6', '{
    "A": 23453006,
    "B": 23405306,
    "C": 2304536,
    "D": 2345306,
    "true": A
}', '1'),
('Natural va butun sonlar', '{
    "A": 6,
    "B": 4,
    "C": 7,
    "D": 2,
    "true": A
}', '1'),
('7 sonidan oldin qaysi son keladi?', '{
    "A": 6,
    "B": 7,
    "C": 8,
    "D": 9,
    "true": A
}', '1'),
('9 sonidan keyin qaysi son keladi?', '{
    "A": 10,
    "B": 7,
    "C": 8,
    "D": 9,
    "true": A
}', '1'),
('10 va 8 sonlarining o`rtasida joylashgan sonni belgilang', '{
    "A": 10,
    "B": 7,
    "C": 8,
    "D": 9,
    "true": D
}', '1'),
('8 sonining qoshni sonlarini belgilang', '{
    "1": 8va9,
    "B": 7va8,
    "C": 7va9,
    "D": 6va9,
    "true": C
}', '1'),
('821 ga qanday eng kichik musbat sonni qo''shganda, yi''indi 66 ga qoldiqsiz bo''linadi?', '{
    "A": 4,
    "B": 5,
    "C": 1,
    "D": 7,
    "true": A
}', '1'),
('1 dan 10 gacha sanaganda 5-o`rinda qaysi son keladi?', '{
    "A": 6,
    "B": 2,
    "C": 5,
    "D": 4,
    "true": C
}', '1'),
('Eng katta sonni belgilang', '{
    "A": 2,
    "B": 3,
    "C": 4,
    "D": 5,
    "true": D
}', '1'),
('7+  =10', '{
    "A": 2,
    "B": 3,
    "C": 4,
    "D": 5,
    "true": B
}', '1')


insert into questions(question, question_variants, subject_id) values 
('Hello! My ___ ___ Maria. I ___ ___ Mexico', '{
    "A": name am / is from,
    "B": name is / from am,
    "C": name is / am from,
    "D": is name / from am,
    "true": C
}', '2'),
(' I have ______ brother. ______ name is David', '{
    "A": an / His,
    "B": * / His,
    "C": a / Her,
    "D": a / His,
    "true": D
}', '2'),
('This is my sister. ______ name is Laura.', '{
    "A": Her,
    "B": His,
    "C": My,
    "D": Its,
    "true": A
}', '2'),
('I ______ student.', '{
    "A": am / the,
    "B": am / *,
    "C":  is / an,
    "D": am / a,
    "true": B
}', '2'),
(' We ______ students.', '{
    "A":  are a,
    "B": am,
    "C": are,
    "D": is,
    "true": D
}', '2'),
('She ______ Italy', '{
    "1": is at,
    "B": is from,
    "C":  are from,
    "D": am from,
    "true": B
}', '2'),
('They ______ Lisa and Max. They ______ from the USA.', '{
    "A": are / is,
    "B": is / is,
    "C":  is / is,
    "D": are / are,
    "true": D
}', '2'),
('This ______ my friend. ______ names Richard.', '{
    "A": are / His,
    "B": is / My,
    "C": is / His,
    "D": his / His,
    "true": C
}', '2'),
('“What is ______ name?” “My names Carlos.”', '{
    "A": your,
    "B": his,
    "C": my,
    "D": her,
    "true": A
}', '2'),
('Is Catherine ______ sister?', '{
    "A": you,
    "B": yours,
    "C": your,
    "D": he,
    "true": C
}', '2')



insert into questions(question, question_variants, subject_id) values 
('Qiya tekislikdan, ishqalanishsiz dumalab tushgan sharchaning qiya tekislik oxiridagi tezligi 
10m/s bolsa, qiya tekislikning balandligini aniqlang', '{
    "A": 50,
    "B": 60,
    "C": 70,
    "D": 80,
    "true": C
}', '2'),
('Avtomobil dvigateli parragining harakat trayektoriyasi:', '{
    "A": aylana, parmasimon,
    "B": aylana, aylana,
    "C": parabola, egri chiziq,
    "D": parmasimon, aylana,
    "true": D
}', '2'),
('Moddiy nuqta tezligining vaqtga boglanishi v=5+4t(m/s)korinishga ega. Vaqtning birinchi sekundida bosib otilgan yolni aniqlang', '{
    "A": 9,
    "B": 8,
    "C": 7,
    "D": 6,
    "true": A
}', '2'),
('Grafikdan foydalanib, t1=2 t2=6 vaqt oraligidagi tezlikning ozgarishini hisoblang.', '{
    "A": 0,
    "B": 1,
    "C": 2,
    "D": 3,
    "true": B
}', '2'),
(' Harbiy reaktiv samolyot 10 s da tezligini 450 km/soat dan 900 km/soat gacha oshirdi. Tezlanishni aniqlang.', '{
    "A":  125,
    "B": 45,
    "C": 12,
    "D": 90,
    "true": D
}', '2'),
('10 m/s tezlik bilan tekis harakatlanayotgan avtomobil kuzovidagi jism avtomobilga nisbatan uning harakatiga qarama-qarshi', '{
    "1": 4,
    "B": 14,
    "C":  6,
    "D": 7,
    "true": B
}', '2'),
('Jism tekis tezlanuvchan harakat qilib, 5 sekundda 18m yol bosdi.', '{
    "A": 150,
    "B": 125,
    "C":  100,
    "D": 200,
    "true": D
}', '2'),
('Jism harakatining sekundida 3 62.5m yol yurgan bolsa, u qanday tezlanish bilan harakat qilgan', '{
    "A": 7.5,
    "B": 25,
    "C": 10,
    "D": 5,
    "true": C
}', '2'),
('Tosh tik yuqoriga v = 30 m/sv=30m/s tezlik bilan otildi. Qanday h (m)h(m) balandlikda uning kinetik energiyasi potensial energiyasining k = 3/5k=3/5 qismiga teng bo''ladi?', '{
    "A": 20,
    "B": 10,
    "C": 5,
    "D": 25,
    "true": A
}', '2'),
('Is Catherine ______ sister?', '{
    "A": you,
    "B": yours,
    "C": your,
    "D": he,
    "true": C
}', '2')






CREATE TABLE results(
  result_id serial,
  user_id int references users(user_id) on delete cascade not null,
  first_subject int not null,
  second_subject int not null,
  first_subject_id int references subjects(subject_id) not null,
  second_subject_id int references subjects(subject_id) not null,
  first_tests_count int not null,
  second_tests_count int not null,
  score_ball decimal(4,1) not null,
  date timestamp default current_timestamp,
  time int not null,
  faculty_id int references faculties(faculty_id) on delete cascade
);


INSERT INTO results(user_id, first_subject, second_subject, date, time, faculty_id, first_subject_id, second_subject_id, first_tests_count, second_tests_count, score_ball) values 
('1', '10', '10', '2022-08-28 17:30:43', '147', '1', '1', '2', '10', '10', '189'),
('2', '10', '10', '2022-08-28 17:30:43', '136', '2', '4', '5', '10', '10', '189')