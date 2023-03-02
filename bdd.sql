DROP TABLE IF EXISTS vote;
DROP TABLE IF EXISTS ligne_reponse;
DROP TABLE IF EXISTS reponse;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS cat;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
   id_user INT AUTO_INCREMENT,
   username VARCHAR(100),
   usermail VARCHAR(225),
   password TEXT,
   PRIMARY KEY(id_user)
);

CREATE TABLE cat(
    id_cat INT AUTO_INCREMENT,
    libelle VARCHAR(225),
    PRIMARY KEY (id_cat)
);

CREATE TABLE question(
    id_question INT AUTO_INCREMENT,
    id_cat INT,
    libelle VARCHAR(225),
    verif boolean default false,
    PRIMARY KEY (id_question),
    FOREIGN KEY (id_cat) REFERENCES cat(id_cat)
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
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_question) REFERENCES question(id_question),
    FOREIGN KEY (id_reponse) REFERENCES reponse(id_reponse)
);

INSERT INTO users (id_user, username, usermail, password)
VALUES
(1, 'benjamin', 'benjamin.berkrouber@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8'),
(2, 'Jane', 'jane@example.com', 'password2'),
(3, 'Bob', 'bob@example.com', 'password3'),
(4, 'Alice', 'alice@example.com', 'password4');

INSERT INTO cat(id_cat, libelle)
VALUES
(1, 'ado'),
(2, 'sport'),
(3, 'cuisine'),
(4, 'culture');

INSERT INTO question (id_question, id_cat, libelle, verif)
VALUES
(1, 1, 'Quel est ton groupe de musique préféré ?', true),
(2, 2,'As-tu déjà été amoureux/se ?', true),
(3, 1,'Quel est ton film préféré ?', true),
(4, 2,'As-tu déjà été victime de harcèlement en ligne ?', true),
(5, 2,'Quel est ton livre préféré ?', true),
(6, 1,'Quel est ton jeu vidéo préféré ?', false),
(7, 3,'As-tu déjà été exclu de ton groupe d''amis ?', false),
(8, 4,'Quel est ton plat préféré ?', false),
(9, 4,'As-tu déjà menti à tes parents ?', false),
(10, 4,'Quel est ton sport préféré ?', false),
(11, 3,'As-tu déjà été trahi par un ami ?', false),
(12, 2,'Quel est ton endroit préféré pour te détendre ?', true),
(13, 1,'Quel est ton acteur/actrice préféré(e) ?', true),
(14, 3,'As-tu déjà été dans une relation amoureuse ?', true),
(15, 2,'Quel est ton pays préféré ?', false),
(16, 4,'As-tu déjà été dans une situation dangereuse ?', true),
(17, 4,'Quel est ton animal préféré ?', true),
(18, 4,'As-tu déjà été en colère ?', true),
(19, 3,'Quel est ton réseau social préféré ?', false),
(20, 1,'As-tu déjà eu des problèmes de confiance en toi ?', true);

INSERT INTO reponse (id_reponse, libelle, id_question)
VALUES
(1, 'Radiohead', 1),
(2, 'Coldplay', 1),
(3, 'Oui', 2),
(4, 'Non', 2),
(5, 'Le Parrain', 3),
(6, 'Star Wars', 3),
(7, 'Oui', 4),
(8, 'Non', 4),
(9, '1984', 5),
(10, 'Le Seigneur des Anneaux', 5),
(11, 'The Legend of Zelda', 6),
(12, 'Super Mario Bros', 6),
(13, 'Oui', 7),
(14, 'Non', 7),
(15, 'Pizza', 8),
(16, 'Sushi', 8),
(17, 'Oui', 9),
(18, 'Non', 9),
(19, 'Football', 10),
(20, 'Basketball', 10),
(21, 'Oui', 11),
(22, 'Non', 11),
(23, 'La plage', 12),
(24, 'La montagne', 12),
(25, 'Leonardo DiCaprio', 13),
(26, 'Meryl Streep', 13),
(27, 'Oui', 14),
(28, 'Non', 14),
(29, 'Italie', 15),
(30, 'Japon', 15),
(31, 'Oui', 16),
(32, 'Non', 16),
(33, 'Chat', 17),
(34, 'Chien', 17),
(35, 'Oui', 18),
(36, 'Non', 18),
(37, 'Facebook', 19),
(38, 'Instagram', 19),
(39, 'Oui', 20),
(40, 'Non', 20);

INSERT INTO ligne_reponse (id_user, id_question, id_reponse)
VALUES
(1, 1, 1), -- Utilisateur 1 répond à la question 1 avec la réponse 1
(1, 2, 3), -- Utilisateur 1 répond à la question 2 avec la réponse 3
(2, 1, 2), -- Utilisateur 2 répond à la question 1 avec la réponse 2
(2, 2, 4), -- Utilisateur 2 répond à la question 2 avec la réponse 1
(3, 1, 2), -- Utilisateur 3 répond à la question 1 avec la réponse 3
(3, 2, 3), -- Utilisateur 3 répond à la question 2 avec la réponse 2
(4, 1, 2), -- Utilisateur 4 répond à la question 1 avec la réponse 2
(4, 2, 3); -- Utilisateur 4 répond à la question 2 avec la réponse 3

SELECT count(lr1.id_reponse) as nbr_vote,
       count(lr2.id_reponse) as nbr_vote,
       r.id_question
FROM ligne_reponse lr1
    join reponse r on lr1.id_reponse = r.id_reponse
    join ligne_reponse lr2 on lr2.id_reponse = r.id_reponse
    join question q on r.id_question = q.id_question
WHERE q.id_question = 1 and lr2.id_reponse = 1;


SELECT q.id_question, q.libelle AS question, r.id_reponse, r.libelle AS reponse, COUNT(lr.id_reponse) AS nbr_vote
FROM ligne_reponse lr
    JOIN reponse r ON lr.id_reponse = r.id_reponse
    JOIN question q ON r.id_question = q.id_question
GROUP BY q.id_question, r.id_reponse
ORDER BY q.id_question, r.id_reponse;

SELECT * FROM users;
SELECT * FROM question;
SELECT * FROM reponse WHERE id_question = 1;

SELECT q.libelle AS question, r.libelle AS reponse
FROM ligne_reponse lr
    JOIN question q ON lr.id_question = q.id_question
    JOIN reponse r ON lr.id_reponse = r.id_reponse
WHERE lr.id_user = 1;

SELECT q.id_question, q.libelle
FROM question q
WHERE q.verif = 1 AND q.id_question NOT IN (
    SELECT lr.id_question
    FROM ligne_reponse lr
    WHERE lr.id_user = 5
)
ORDER BY RAND()
;

SELECT COUNT(distinct(q.libelle))
FROM question q
    join ligne_reponse lr
WHERE id_user = 5 and q.verif = 1 and q.id_question NOT IN (
    SELECT lr.id_question
    FROM ligne_reponse lr
    WHERE lr.id_user = 5
    );

SELECT * from ligne_reponse where id_user = 5;

SELECT distinct(q.libelle)
FROM question q
    join ligne_reponse lr
WHERE id_user = 1
  and q.verif = 1
  and q.id_cat = 2
    and q.id_question NOT IN (
    SELECT lr.id_question
    FROM ligne_reponse lr
    WHERE lr.id_user = 1
);

SELECT count(libelle) from question where verif = 1;

SELECT usermail from users where id_user = 5;

SELECT count(*) FROM question where verif = 1;

SELECT COUNT(distinct(q.libelle))
                FROM question q
                    join ligne_reponse lr
                WHERE id_user = 5 and q.verif = 1 and q.id_question NOT IN (
                    SELECT lr.id_question
                    FROM ligne_reponse lr
                    WHERE lr.id_user = 5
                    )

