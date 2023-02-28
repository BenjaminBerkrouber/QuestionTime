DROP TABLE IF EXISTS reponse;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
   id_user INT AUTO_INCREMENT,
   username VARCHAR(100),
   usermail VARCHAR(225),
   password TEXT,
   PRIMARY KEY(id_user)
);

CREATE TABLE question(
    id_question INT AUTO_INCREMENT,
    libelle VARCHAR(225),
    PRIMARY KEY (id_question)
);

CREATE TABLE reponse(
    id_reponse INT AUTO_INCREMENT,
    libelle VARCHAR(225),
    id_question INT,
    PRIMARY KEY (id_reponse),
    FOREIGN KEY (id_question) REFERENCES question(id_question)
);

INSERT INTO users (username, email, password) VALUES ('Benjamin', 'benjamim.berkrouber@gmail.com', 'password');

INSERT INTO question (libelle) VALUES ('Vous preferer être pauvre et connus ou riche et inconnue');

INSERT INTO reponse (libelle, id_question) VALUES ('Riche, mais inconnue', 1);
INSERT INTO reponse (libelle, id_question) VALUES ('Pauvre, mais connues', 1);


SELECT * FROM users;
SELECT * FROM reponse INNER JOIN question WHERE reponse.id_question = 1;