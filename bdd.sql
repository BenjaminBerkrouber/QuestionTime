DROP TABLE IF EXISTS vote;
DROP TABLE IF EXISTS ligne_reponse;
DROP TABLE IF EXISTS reponse;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
   id_users INT AUTO_INCREMENT,
   username VARCHAR(100),
   usermail VARCHAR(225),
   password TEXT,
   PRIMARY KEY(id_users)
);

CREATE TABLE question(
    id_question INT AUTO_INCREMENT,
    libelle VARCHAR(225),
    verif boolean default false,
    PRIMARY KEY (id_question)
);

CREATE TABLE reponse(
    id_reponse INT AUTO_INCREMENT,
    libelle VARCHAR(225),
    id_question INT,
    PRIMARY KEY (id_reponse),
    FOREIGN KEY (id_question) REFERENCES question(id_question)
);

CREATE TABLE ligne_reponse(
    id_user INT,
    id_question INT,
    id_reponse INT,
    FOREIGN KEY (id_user) REFERENCES users(id_users),
    FOREIGN KEY (id_question) REFERENCES question(id_question),
    FOREIGN KEY (id_reponse) REFERENCES reponse(id_reponse)
);

/*CREATE TABLE vote(
    id_vote INT AUTO_INCREMENT,
    id_user VARCHAR(20),
    id_reponse INT,
    PRIMARY KEY (id_vote),
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_reponse) REFERENCES reponse(id_reponse)
);*/

INSERT INTO users (username, usermail, password) VALUES ('Benjamin', 'benjamin.berkrouber@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8');

INSERT INTO question (libelle, verif)
VALUES
('Quel est ton groupe de musique préféré ?', false),
('As-tu déjà été amoureux/se ?', false),
('Quel est ton film préféré ?', false),
('As-tu déjà été victime de harcèlement en ligne ?', false),
('Quel est ton livre préféré ?', false),
('Quel est ton jeu vidéo préféré ?', false),
('As-tu déjà été exclu de ton groupe d''amis ?', false),
('Quel est ton plat préféré ?', false),
('As-tu déjà menti à tes parents ?', false),
('Quel est ton sport préféré ?', false),
('As-tu déjà été trahi par un ami ?', false),
('Quel est ton endroit préféré pour te détendre ?', false),
('Quel est ton acteur/actrice préféré(e) ?', false),
('As-tu déjà été dans une relation amoureuse ?', false),
('Quel est ton pays préféré ?', false),
('As-tu déjà été dans une situation dangereuse ?', false),
('Quel est ton animal préféré ?', false),
('As-tu déjà été en colère ?', false),
('Quel est ton réseau social préféré ?', false),
('As-tu déjà eu des problèmes de confiance en toi ?', false),
('Quel est ton artiste préféré ?', false),
('As-tu déjà eu une peur irrationnelle ?', false),
('Quel est ton style de musique préféré ?', false),
('As-tu déjà été dans une bagarre ?', false),
('Quel est ton dessert préféré ?', false),
('As-tu déjà été dans une situation embarrassante ?', false),
('Quel est ton instrument préféré ?', false),
('As-tu déjà été en retard ?', false),
('Quel est ton jeu de société préféré ?', false),
('As-tu déjà eu des regrets ?', false),
('Quel est ton héros/héroïne préféré(e) ?', false),
('As-tu déjà eu un coup de foudre ?', false),
('Quel est ton lieu de vacances préféré ?', false),
('As-tu déjà été dans un accident de voiture ?', false),
('Quel est ton légume préféré ?', false),
('As-tu déjà eu des problèmes de sommeil ?', false),
('Quel est ton super-pouvoir préféré ?', false),
('As-tu déjà été en voyage ?', false),
('Quel est ton métier préféré ?', false),
('As-tu déjà fait une bêtise ?', false),
('Quel est ton objet préféré ?', false),
('As-tu déjà été dans une situation romantique ?', false),
('Quel est ton restaurant préféré ?', false),
('As-tu déjà été dans une situation stressante ?', false),
('Quel est ton moment préféré de la journée ?', false),
('As-tu déjà été dans une situation triste ?', false),
('Quel est ton fruit préféré ?', false);

INSERT INTO reponse (libelle, id_question) VALUES
('PNL', 1), ('DjaDja & Dinaz', 1),
('Oui', 2), ('Non', 2),
('James bond', 3), ('Indiana Johns', 3),
('Oui', 4), ('Non', 4),
('Harry potter', 5), ('Hobbit', 5),
('Minecraft', 6), ('LoL', 6),
('Oui', 7), ('Non', 7),
('Tacos', 8), ('Kebab', 8),
('Option A9', 9), ('Option B9', 9),
('Option A10', 10), ('Option B10', 10),
('Option A11', 11), ('Option B11', 11),
('Option A12', 12), ('Option B12', 12),
('Option A13', 13), ('Option B13', 13),
('Option A14', 14), ('Option B14', 14),
('Option A15', 15), ('Option B15', 15),
('Option A16', 16), ('Option B16', 16),
('Option A17', 17), ('Option B17', 17),
('Option A18', 18), ('Option B18', 18),
('Option A19', 19), ('Option B19', 19),
('Option A20', 20), ('Option B20', 20),
('Option A21', 21), ('Option B21', 21),
('Option A22', 22), ('Option B22', 22),
('Option A23', 23), ('Option B23', 23),
('Option A24', 24), ('Option B24', 24),
('Option A25', 25), ('Option B25', 25),
('Option A26', 26), ('Option B26', 26),
('Option A27', 27), ('Option B27', 27),
('Option A28', 28), ('Option B28', 28),
('Option A29', 29), ('Option B29', 29),
('Option A30', 30), ('Option B30', 30),
('Option A31', 31), ('Option B31', 31),
('Option A32', 32), ('Option B32', 32),
('Option A33', 33), ('Option B33', 33),
('Option A34', 34), ('Option B34', 34),
('Option A35', 35), ('Option B35', 35),
('Option A36', 36), ('Option B36', 36),
('Option A37', 37), ('Option B37', 37),
('Option A38', 38), ('Option B38', 38),
('Option A39', 39), ('Option B39', 39),
('Option A40', 40), ('Option B40', 40),
('Option A41', 41), ('Option B41', 41),
('Option A42', 42), ('Option B42', 42),
('Option A43', 43), ('Option B43', 43),
('Option A44', 44), ('Option B44', 44),
('Option A45', 45), ('Option B45', 45);

INSERT INTO ligne_reponse (id_user, id_question, id_reponse) VALUES (1,1,1);


SELECT * FROM users;
SELECT * FROM question;
SELECT * FROM reponse WHERE id_question = 1;

SELECT u.username, q.libelle as question , r.libelle as reponse
FROM ligne_reponse AS l
    inner join reponse as r ON l.id_reponse = r.id_reponse
    inner join question as q on l.id_question = q.id_question
    inner join users as u on l.id_user = u.id_users
WHERE id_user = 1;

SELECT * FROM reponse WHERE id_question = 1;

SELECT * FROM users WHERE usermail = 'benjamin.berkrouber@gmail.com' AND password = '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8';