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
verif boolean,
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
FOREIGN KEY (id_reponse) REFERENCES reponse(id_reponse),
UNIQUE (id_user, id_question)
);

INSERT INTO users (id_user, username, usermail, password)
VALUES
(1, 'benjamin', 'benjamin.berkrouber@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8'),
(2, 'Jane', 'jane@example.com', 'password2'),
(3, 'Bob', 'bob@example.com', 'password3'),
(4, 'Alice', 'alice@example.com', 'password4');

INSERT INTO cat(id_cat, libelle)
VALUES
(1, 'Night'),
(2, 'Sport'),
(3, 'Culinaire'),
(4, 'Culture');

/*Catégorie, soirée */

INSERT INTO question(id_cat, libelle, verif)
VALUES
(1, 'Boire de la bière ou de la vodka ?', false),
(1, 'Danser sur du reggaeton ou sur de la techno ?', false),
(1, 'Jouer à Beer Pong ou à Never Have I Ever ?', false),
(1, 'Chanter du karaoké ou jouer à des jeux de société ?', false),
(1, 'Prendre un shot de tequila ou de rhum ?', false),
(1, 'Passer la soirée en boîte ou entre amis ?', false),
(1, 'Soirée à thème déguisée ou soirée normale ?', false),
(1, 'Bière pression ou bière en bouteille ?', false),
(1, 'Musique live ou DJ ?', false),
(1, 'Shots de vodka ou cocktails ?', false),
(1, 'Soirée dansante ou soirée karaoké ?', false),
(1, 'Soirée en extérieur ou en intérieur ?', false),
(1, 'Soirées dans les bars ou dans les clubs ?', false),
(1, 'Mojito ou margarita ?', false),
(1, 'Musique latine ou musique pop ?', false),
(1, 'Roulette russe ou bouteille ?', false),
(1, 'Soirée déguisée sur le thème des super-héros ou sur le thème des années 80 ?', false),
(1, 'Soirée sur le thème du poker ou du casino ?', false),
(1, 'Soirée sur le thème de la plage ou de la montagne ?', false),
(1, 'Soirées à thème sur le cinéma ou sur la musique ?', false),
(1, 'Soirée en mode freestyle ou soirée avec un programme prévu ?', false),
(1, 'Whisky ou gin ?', false),
(1, 'Danser sur de la salsa ou du hip-hop ?', false),
(1, 'Jouer à la beer roulette ou au strip poker ?', false),
(1, 'Soirée sur le thème du voyage ou sur le thème des animaux ?', false),
(1, 'Jeux de société ou soirée dansante ?', false),
(1, 'Boire de la tequila ou de la vodka ?', false),
(1, 'Danser sur du rock ou de la musique électro ?', false),
(1, 'Jouer à Action ou Vérité ou à Chacun son tour ?', false),
(1, 'Chanter du karaoké ou regarder un film ?', false),
(1, 'Prendre un shot de whisky ou de rhum ?', false),
(1, 'Passer la soirée dans un bar ou dans un club ?', false),
(1, 'Soirée sur le thème des pirates ou sur le thème de la science-fiction ?', false),
(1, 'Bière blonde ou bière brune ?', false),
(1, 'Musique électro ou musique pop rock ?', false),
(1, 'Shots de tequila ou de rhum ?', false),
(1, 'Soirée karaoké ou soirée blind-test ?', false),
(1, 'Soirée à la plage ou soirée à la piscine ?', false),
(1, 'Vivre le début ou la fin du monde ?', true),
(1, 'Plus d''argent ou plus de temps ?', true),
(1, 'Vivre sans dents ou sans yeux ?', true),
(1, 'Vivre sans pieds ou sans mains ?', true),
(1, 'Vivre sans cheveux ou sans doigts ?', true),
(1, 'Pouvoir seulement chuchoter ou seulement crier ?', true),
(1, 'Perdre la vue ou ses souvenirs ?', true),
(1, 'Respect universel ou pouvoir illimité ?', true),
(1, 'Travailler sous un soleil brûlant ou un froid extrême ?', true),
(1, 'Rester pendant une journée de neige ou construire un fort ?', true),
(1, 'Avoir une femme de ménage personnelle ou un chef personnel ?', true), /*ligne*/
(1, 'Mesurer 11 pieds ou neuf pouces?', true),
(1, 'Vomir sur son héros ou faire vomir son héros sur soi ?', true),
(1, 'Prélasser au bord de la piscine ou sur la plage ?', true),
(1, 'Câliner un koala ou un copain avec un panda ?', true),
(1, 'Trouver un rat dans sa cuisine ou un cafard dans son lit ?', true),
(1, 'Roter ou péter à la fin de chaque phrase prononcée ?', true),
(1, 'Un petit tatouage sur le visage ou un tatouage couvrant tout le dos ?', true),
(1, 'Frapper un nid de frelons ou un ours endormi ?', true),
(1, 'Manger de vieux sushis ou boire du lait périmé ?', true),
(1, 'Évanouir à son mariage ou à sa remise de diplôme?', true),
(1, 'Toujours avoir une batterie de téléphone pleine ou un réservoir d’essence plein ?', true),
(1, 'Boire dans les toilettes ou uriner dans une litière ?', true),
(1, 'Passer un an à la guerre ou un an en prison ?', true),
(1, 'Rencontrer ses parents ou les laisser venir à sa rencontre ?', true),
(1, 'Un troisième mamelon ou un orteil supplémentaire ?', true);
/*
(1, 'Résoudre la faim dans le monde ou le réchauffement climatique', true),
(1, 'Vivre dans une cabane dans les arbres ou dans une grotte', true),
(1, 'Passer une année entièrement seul ou une année sans domicile', true),
(1, 'Mourir avant ou après son partenaire', true),
(1, 'Être critiqué ou ignoré', true),
(1, 'Courir aussi vite que Flash ou être aussi fort que Superman', true),
(1, 'Manger un repas insuffisamment cuit ou un repas brûlé', true),
(1, 'Jouer dans un Star Wars ou dans un film Marvel', true),
(1, 'Porter des talons à la salle de sport ou des baskets à un mariage', true),
(1, 'Être le clown de la classe ou le chouchou du professeur', true),
(1, 'Monter une autruche ou un chameau', true),
(1, 'Serrer dans ses bras un koala ou un panda', true),
(1, 'Caresser une tarentule ou un serpent', true),
(1, 'Combattre un tigre ou un ours', true),
(1, 'Un dinosaure ou un dauphin comme animal de compagnie', true),
(1, 'Traire une vache ou tondre une brebis', true),
(1, 'Être un aigle ou un serpent', true),
(1, 'Hanter un tigre sauvage ou un singe sauvage', true),
(1, 'Être ami avec une araignée ou un cafard', true),
(1, 'Faire la moitié de sa taille ou le double de son poids', true),
(1, 'Nourrir une vache ou un cheval', true),
(1, 'Posséder un chat ou un chien', true),
(1, 'Ne jamais vieillir physiquement ou ne jamais vieillir mentalement', true),
(1, 'Sortir avec quelqu un qui a mauvaise haleine ou de mauvaises manières', true),
(1, 'Lire le livre ou regarder le film', true),
(1, 'Avoir son propre parc à thème ou son propre zoo', true),
(1, 'Perdre toutes ses dents ou tous ses cheveux', true),
(1, 'Être obligé de chanter ou de danser sur chaque chanson que l on entend', true),
(1, 'Trouver le véritable amour aujourd hui ou gagner à la loterie l\'année prochaine', true),
(1, 'Être en prison pendant cinq ans ou être dans le coma pendant une décennie', true),
(1, 'Être chroniquement sous-habillé ou trop habillé', true),
(1, 'Ronger ses ongles ou les ongles de quelqu\'un d\'autre', true),
(1, 'Personne ne vienne à son mariage ou à ses funérailles', true),
(1, 'Ne pas avoir Internet ou pas de téléphone portable', true),
(1, 'Un tatouage ou un piercing à la lèvre', true),
(1, 'Être sans abri ou en prison', true),
(1, 'Son ami ou son patron tombe amoureux de soi', true),
(1, 'Connaître la date de sa mort ou la cause de sa mort', true),
(1, 'Recevoir des produits de nettoyage ou une balance en cadeau', true),
(1, 'Manger du fast-food tous les jours ou ne plus jamais manger dans un restaurant', true),
(1, 'Vivre dans un nouveau pays chaque mois ou ne plus jamais partir en vacances', true),
(1, 'Les mains pour les pieds ou les pieds pour les mains', true),
(1, 'Tuer une vache ou la boucher après', true),
(1, 'Manger de la cervelle ou des intestins d\'animaux', true),
(1, 'Voir sa mère ou sa fille dans un club de gentlemen', true),
(1, 'Ne pas pouvoir acheter de café ou prendre des plats à emporter pendant un mois', true),
(1, 'Ne plus jamais chanter ou ne plus jamais danser', true),
(1, 'Regarder les actualités ou les films de stoner pendant 24 heures d\'affilée', true),
(1, 'Frapper un mur de plein fouet ou recevoir un coup de poing dans la poitrine', true),
(1, 'Habiter juste à côté d\'un immense stade ou de l\'aéroport', true),
(1, 'Faire du skateboard ou marcher sur ses mains partout où l\'on va', true),
(1, 'Prendre un bain de vinaigrette ou une douche de sauce barbecue', true),
(1, 'Ne pas se doucher pendant une semaine ou 3 fois par jour pendant une semaine', true),
(1, 'Vivre la vie d\'une nonne ou d\'une danseuse exotique pendant une semaine', true),
(1, 'Passer la nuit dans un motel miteux ou dans sa voiture', true),
(1, 'Vivre dans un film de guerre historique ou dans un futur film dystopique', true),
(1, 'Marcher pieds nus sur de la glace ou du ciment chaud', true),
(1, 'Manger une tête d\'ail cru ou un oignon cru', true),
(1, 'Ne pas manger de sucre ou de sel pendant un mois', true),
(1, 'Épouser quelqu\'un que l\'on vient de rencontrer ou ne jamais se marier du tout', true),
(1, 'Nettoyer les toilettes ou le réfrigérateur sales de quelqu\'un d\'autre', true),
(1, 'Payer 5 $ chaque fois que l\'on insulte quelqu\'un ou chaque fois que l\'on ment', true),
(1, 'Saut en parachute ou saut à l’élastique', true),
(1, 'Épouser quelqu’un que vous venez de rencontrer ou ne jamais vous marier du tout', true),
(1, 'Être piégé pendant une heure dans une pièce pleine de moustiques ou de rats', true),
(1, 'Vivre dans un monde sans papier toilette ni savon', true),
(1, 'Sortir avec quelqu’un que vous aimez ou sortir avec quelqu’un qui vous aime', true),
(1, 'Perdre la capacité de mentir ou croire tout ce qu’on vous dit', true),
(1, 'Gouverner le monde ou vivre dans un monde sans aucun problème', true),
(1, 'Parler toutes les langues ou être capable de parler à tous les animaux', true),
(1, 'Abandonner votre vie amoureuse ou votre vie professionnelle', true),
(1, 'Ne pas savoir nager ou ne pas pouvoir courir', true),
(1, 'Vous faire enlever un doigt ou 2 orteils', true),
(1, 'Hamburgers ou hot-dogs', true),
(1, 'Être professeur d’art ou professeur d’éducation physique', true),
(1, 'Manger une araignée morte ou un ver vivant', true),
(1, 'Avoir de très petites mains ou de très grands pieds', true),
(1, 'Lire dans les pensées ou être invisible', true),
(1, 'Frites ou gâteau au chocolat', true),
(1, 'Policier ou médecin', true),
(1, 'Voyager beaucoup ou rencontrer beaucoup de monde', true),
(1, 'Voir un feu d’artifice ou aller à un concert', true),
(1, 'Faire du ski nautique ou du ski sur neige', true),
(1, 'Manger des beignets ou des bonbons', true),
(1, 'Faire voler un cerf-volant ou rouler sur un scooter', true),
(1, 'Avoir un doigt ou un orteil en plus', true),
(1, 'Être un chanteur célèbre ou un acteur célèbre', true),
(1, 'Pouvoir voler ou être invisible', true),
(1, 'Vivre sur la Lune ou vivre sur Mars', true),
(1, 'Rencontrer votre célébrité préférée ou être dans un film', true),
(1, 'Manger une pomme de terre crue ou un citron vert entier', true),
(1, 'Être invisible ou pouvoir voler', true),
(1, 'Parler toutes les langues ou jouer de tous les instruments', true),
(1, 'Vivre sans télévision ou sans téléphone', true),
(1, 'Être un oiseau ou un cheval', true),
(1, 'Avoir 5 frères ou 5 sœurs', true),
(1, 'Être une licorne ou un pégase', true),
(1, 'Rencontrer un super-héros ou un personnage de dessin animé', true),
(1, 'Être un athlète olympique ou le président', true),
(1, 'Boire du lait caillé ou manger des œufs pourris', true),
(1, 'Panda ou zèbre de compagnie', true),
(1, 'Transpirer du miel ou toujours sentir comme une moufette', true),
(1, 'Embrasser une grenouille ou étreindre un serpent', true),
(1, 'Pelleter la neige ou ratisser les feuilles', true),
(1, 'Jouer de la guitare ou du piano', true),
(1, 'Une piscine ou un trampoline', true),
(1, 'Être médecin ou scientifique', true),
(1, 'Aller au zoo ou à l’aquarium', true),
(1, 'Être vraiment rapide ou vraiment fort', true),
(1, 'Une pizza ou des frites', true),
(1, 'Avoir un hamster de compagnie ou un chat de compagnie', true),
(1, 'Avoir 3 jambes ou 3 bras', true);
*/

INSERT INTO reponse(libelle, id_question)
VALUES
('Bière', 1), ('Vodka', 1),
('Reggaeton', 2), ('Techno', 2),
('Beer Pong', 3), ('Never Have I Ever', 3),
('Karaoké', 4), ('Jeux de société', 4),
('Tequila', 5), ('Rhum', 5),
('Boîte', 6), ('Entre amis', 6),
('Soirée à thème', 7), ('Soirée normale', 7),
('Bière pression', 8), ('Bière en bouteille', 8),
('Musique live', 9), ('DJ', 9),
('Vodka', 10), ('Cocktails', 10),
('Soirée dansante', 11), ('Soirée karaoké', 11),
('En extérieur', 12), ('En intérieur', 12),
('Bars', 13), ('Clubs', 13),
('Mojito', 14), ('Margarita', 14),
('Musique latine', 15), ('Musique pop', 15),
('Roulette russe', 16), ('Bouteille', 16),
('Super-héros', 17), ('Années 80', 17),
('Poker', 18), ('Casino', 18),
('Plage', 19), ('Montagne', 19),
('Cinéma', 20), ('Musique', 20),
('Freestyle', 21), ('Programme prévu', 21),
('Whisky', 22), ('Gin', 22),
('Salsa', 23), ('Hip-hop', 23),
('Beer roulette', 24), ('Strip poker', 24),
('Voyage', 25), ('Animaux', 25),
('Jeux de société', 26), ('Soirée dansante', 26),
('Tequila', 27), ('Vodka', 27),
('Rock', 28), ('Musique électro', 28),
('Action ou Vérité', 29), ('Chacun son tour', 29),
('Karaoké', 30), ('Film', 30),
('Whisky', 31), ('Rhum', 31),
('Bar', 32), ('Club', 32),
('Pirates', 33), ('Science-fiction', 33),
('Bière blonde', 34), ('Bière brune', 34),
('Musique électro', 35), ('Musique pop rock', 35),
('Tequila', 36), ('Rhum', 36),
('Soirée karaoké', 37), ('Blind-test', 37),
('Plage', 38), ('Piscine', 38),
('Vivre le début', 39),('Vivre la fin', 39),
('Plus d\'argent', 40),('Plus de temps', 40),
('Vivre sans dents', 41),('Vivre sans yeux', 41),
('Vivre sans pieds', 42),('Vivre sans mains', 42),
('Vivre sans cheveux', 43),('Vivre sans doigts', 43),
('Pouvoir seulement chuchoter', 44),('Pouvoir seulement crier', 44),
('Perdre la vue', 45),('Perdre ses souvenirs', 45),
('Respect universel', 46),('Pouvoir illimité', 46),
('Travailler sous un soleil brûlant', 47),('Travailler sous un froid extrême', 47),
('Rester pendant une journée de neige', 48),('Construire un fort', 48),
('Avoir une femme de ménage personnelle', 49),('Avoir un chef personnel', 49),
('Mesurer 11 pieds', 50),
('Neuf pouces', 50),
('Vomir sur son héros', 51),
('Faire vomir son héros sur soi', 51),
('Prélasser au bord de la piscine', 52),
('Sur la plage', 52),
('Câliner un koala', 53),
('Un copain avec un panda', 53),
('Trouver un rat dans sa cuisine', 54),
('Un cafard dans son lit', 54),
('Roter', 55),
('Péter à la fin de chaque phrase prononcée', 55),
('Un petit tatouage sur le visage', 56),
('Un tatouage couvrant tout le dos', 56),
('Frapper un nid de frelons', 57),
('Un ours endormi', 57),
('Manger de vieux sushis', 58),
('Boire du lait périmé', 58),
('Évanouir à son mariage', 59),
('A sa remise de diplôme', 59),
('Toujours avoir une batterie de téléphone pleine', 60),
('Un réservoir d’essence plein', 60),
('Boire dans les toilettes', 61),
('Uriner dans une litière', 61),
('Passer un an à la guerre', 62),
('Un an en prison', 62),
('Rencontrer ses parents', 63),('Les laisser venir à sa rencontre', 63),
('Un troisième mamelon', 64),('Un orteil supplémentaire', 64)
;

/*insert ligne_user*/
INSERT INTO ligne_reponse(id_user, id_question, id_reponse)
VALUES
(1,1,1), (1,2,1),
(2, 1, 1), (2, 2, 2), (2, 3, 1), (2, 4, 2), (2, 5, 1), (2, 6, 1), (2, 7, 1), (2, 8, 2), (2, 9, 2), (2, 10, 1), (2, 11, 1), (2, 12, 1), (2, 13, 1), (2, 14, 2), (2, 15, 2), (2, 16, 1), (2, 17, 1), (2, 18, 1), (2, 19, 1), (2, 20, 2), (2, 21, 1), (2, 22, 2), (2, 23, 2), (2, 24, 1), (2, 25, 1), (2, 26, 2), (2, 27, 1), (2, 28, 2), (2, 29, 1), (2, 30, 2), (2, 31, 2), (2, 32, 1), (2, 33, 1), (2, 34, 2), (2, 35, 2), (2, 36, 1), (2, 37, 2), (2, 38, 1), (2, 39, 2), (2, 40, 1), (2, 41, 2), (2, 42, 2), (2, 43, 2), (2, 44, 1), (2, 45, 2), (2, 46, 1), (2, 47, 1), (2, 48, 1), (2, 49, 2), (2, 50, 1), (2, 51, 1), (2, 52, 1), (2, 53, 1), (2, 54, 1), (2, 55, 1), (2, 56, 1), (2, 57, 1), (2, 58, 1), (2, 59, 1), (2, 60, 1), (2, 61, 1), (2, 62, 1), (2, 63, 1), (2, 64, 1),
(3, 1, 2), (3, 2, 1), (3, 3, 2), (3, 4, 1), (3, 5, 2), (3, 6, 2), (3, 7, 2), (3, 8, 1), (3, 9, 1), (3, 10, 2), (3, 11, 2), (3, 12, 2), (3, 13, 2), (3, 14, 1), (3, 15, 1), (3, 16, 2), (3, 17, 2), (3, 18, 2), (3, 19, 2), (3, 20, 1), (3, 21, 2), (3, 22, 1), (3, 23, 1), (3, 24, 2), (3, 25, 2), (3, 26, 1), (3, 27, 2), (3, 28, 1), (3, 29, 2), (3, 30, 1), (3, 31, 1);


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


-- Requete qui vérifi si il reste des question dans une cat pour un utilisateur
SELECT q.id_question, q.libelle
FROM question q
LEFT JOIN (SELECT lr.id_question
 FROM ligne_reponse lr
 WHERE lr.id_user = 5) r
ON q.id_question = r.id_question
WHERE q.id_cat = 4
AND r.id_question IS NULL;

-- requete qui séléctionne une question pour un user à laquel il n'as jamais repondu

SELECT q.id_question, q.libelle
FROM question q
LEFT JOIN (SELECT lr.id_question
 FROM ligne_reponse lr
 WHERE lr.id_user = 6) r
ON q.id_question = r.id_question
WHERE q.id_cat = 1
AND r.id_question IS NULL
ORDER BY RAND()
LIMIT 1;

select * FROM ligne_reponse where id_user = 1;

SELECT count(id_question) FROM question;

SELECT count(q.id_question)
FROM question q
LEFT JOIN (SELECT lr.id_question
 FROM ligne_reponse lr
 WHERE lr.id_user = 1) r
ON q.id_question = r.id_question
WHERE r.id_question IS NULL AND id_cat = 1
ORDER BY RAND()
;

SELECT
  id_question,
  ROUND((SUM(CASE WHEN id_reponse = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS percentage_reponse_1,
  ROUND((SUM(CASE WHEN id_reponse = 2 THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS percentage_reponse_2
FROM ligne_reponse
WHERE id_question = 3;
