<?php

function get_question(){
    $results = executeRequest(
        "SELECT * FROM question WHERE verif = 0 ORDER BY RAND() LIMIT 1",
        []
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
