<?php

function bdConnect()
{
    $dbhost = 'localhost';
    $dbname = 'BDD_QuestionTime';
    $dbuser = 'benjamin';
    $dbpass = '1605';

    try{
        $conn = new PDO("mysql:host=$dbhost;dbname=$dbname;",$dbuser,$dbpass);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    }
    catch(PDOException $e){
        die("Error : ". $e->getMessage());
    }

}

function executeRequest($request, $parametre)
{
    $bdd = bdConnect();

    $results = $bdd->prepare($request);
    $results->execute($parametre);

    return $results;
}
?>