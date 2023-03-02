<?php

function get_question($id_user, $id_cat){
    $results = executeRequest(
        "SELECT q.id_question, q.libelle
                FROM question q
                WHERE q.verif = 1 
                  AND q.id_cat = $id_cat 
                  AND q.id_question NOT IN (
                    SELECT lr.id_question
                    FROM ligne_reponse lr
                    WHERE lr.id_user = ?
                )
                ORDER BY RAND()
                LIMIT 1",
        [$id_user]
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
        "SELECT * FROM ligne_reponse WHERE id_user = ? and id_question = ?",
        [
            $id_user, $id_question
        ]
    );


    if ($results->rowCount() >= 1)
    {
        $error = "Vous avez déjà répondu à cette question";
    }else{
        $results = executeRequest(
            "INSERT INTO ligne_reponse(id_user,id_question,id_reponse) VALUES (?,?,?)",
            [$id_user,$id_question,$id_reponse]
        );
    }

    if(isset($error)){echo $error;}
}

function available_question($id_user, $id_cat){
    $results = executeRequest(
        "SELECT distinct(q.libelle)
                FROM question q
                    join ligne_reponse lr
                WHERE id_user = ? 
                  and q.verif = 1 
                  and q.id_cat = ?
                  and q.id_question NOT IN (
                    SELECT lr.id_question
                    FROM ligne_reponse lr
                    WHERE lr.id_user = ?
                    )",
        [$id_user, $id_cat,  $id_user]
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