<?php

function get_question($id_user, $id_cat){
    $results = executeRequest(
        "SELECT q.id_question, q.libelle
                FROM question q
                LEFT JOIN (SELECT lr.id_question
                           FROM ligne_reponse lr
                           WHERE lr.id_user = ?) r
                ON q.id_question = r.id_question
                WHERE r.id_question IS NULL AND id_cat = ?
                ORDER BY RAND()
                LIMIT 1;",
        [$id_user, $id_cat]
    );
    $results = $results->fetch();
    return $results;
}

function get_reponse($id_question){
    $results = executeRequest(
        "SELECT * FROM reponse WHERE id_question = ?",
        [$id_question]
    );
    $results = $results->fetchAll();
    return $results;
}

function get_all_reponse_by_user($id_user){
    $results = executeRequest(
        "SELECT q.libelle AS question, r.libelle AS reponse
                FROM ligne_reponse lr
                JOIN question q ON lr.id_question = q.id_question
                JOIN reponse r ON lr.id_reponse = r.id_reponse
                WHERE lr.id_user = ?",
        [$id_user]
    );
    $results = $results->fetchAll();
    return $results;
}

function add_reponse($id_user,$id_question, $id_reponse){
    $results = executeRequest(
        "INSERT INTO ligne_reponse(id_user,id_question,id_reponse) VALUES (?,?,?)",
        [$id_user,$id_question,$id_reponse]
    );
}

function available_question($id_user, $id_cat){
    $results = executeRequest(
        "SELECT q.id_question, q.libelle
                FROM question q
                LEFT JOIN (SELECT lr.id_question
                           FROM ligne_reponse lr
                           WHERE lr.id_user = ?) r
                ON q.id_question = r.id_question
                WHERE q.id_cat = ?
                AND r.id_question IS NULL;",
        [$id_user, $id_cat]
    );

    $results = $results->rowCount();

    return $results != 0;
}

function get_cat(){
    $results = executeRequest(
        "SELECT * FROM cat",
        []
    );
    $results = $results->fetchAll();
    return $results;
}

function get_percent($id_question){
    $results = executeRequest(
        "SELECT
                  ROUND((SUM(CASE WHEN id_reponse = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS pr_1,
                  ROUND((SUM(CASE WHEN id_reponse = 2 THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS pr_2
                FROM ligne_reponse
                WHERE id_question = ?
                GROUP BY id_question;",
        [$id_question]
    );
    $results = $results->fetch();
    return $results;
}