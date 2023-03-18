<?php

include('app/php/config.php');
include('app/php/functions/question.php');
include('app/php/functions/security/user.php');
session_start();

if(isset($_SESSION)){
    $id_cats = get_cat();
}

if(isset($_SESSION['userid']) && isset($_GET['id_cat'])){
    $id_cat = htmlspecialchars($_GET['id_cat']);
    if(available_question($_SESSION['userid'], $id_cat) && $_GET['new'] == 1){
        $id_cat = htmlspecialchars($_GET['id_cat']);
        $question = get_question($_SESSION['userid'], $id_cat);
        $reponses = get_reponse($question['id_question']);
    }
}

if(isset($_POST['id_reponse'])){
    if(isset($_POST['id_reponse']) && isset($_POST['id_question']) && !empty($_POST['id_reponse']) && !empty($_POST['id_question']) ){
        $id_question = htmlspecialchars($_POST['id_question']);
        $id_reponse = htmlspecialchars($_POST['id_reponse']);
        add_reponse($_SESSION['userid'], $id_question, $id_reponse);
        sleep(0.3);
    }
}
if(isset($_POST['id_reponse'])){
    if(isset($_POST['id_reponse']) && isset($_POST['id_question']) && !empty($_POST['id_reponse']) && !empty($_POST['id_question']) ){
        $percent = get_percent($question['id_question']);
        echo $percent['pr_1']."% /".$percent['pr_2']."%";
    }
}


?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="app/css/style.css">

</head>
<body>

<script>
    window.onload = function() {
        var jauge = document.querySelector('.jauge-remplissage3');
        if (jauge) {
            jauge.style.width = '100%';
        }

        var jauge2 = document.querySelector('.jauge-remplissage4');
        if (jauge2) {
            jauge2.style.width = '100%';
        }

        var jauge3 = document.querySelector('.jauge-remplissage5-1');
        var jauge4 = document.querySelector('.jauge-remplissage5-2');
        if( jauge3 && jauge4){
            jauge3.style.width = '50%';
            jauge4.style.width = '50%';
        }

        var jauge5 = document.querySelector('.jauge-remplissage6-1');
        var jauge6 = document.querySelector('.jauge-remplissage6-2');
        if( jauge5 && jauge6){
            jauge5.style.width = '50%';
            jauge6.style.width = '50%';
        }
    };
</script>

<?php

include($_SERVER['DOCUMENT_ROOT']."/data/inc/header.php");

if(isset($_SESSION['userid'])){
    if(isset($_SESSION['userid']) && isset($_GET['id_cat'])){

        if(available_question($_SESSION['userid'], $id_cat)){
            include($_SERVER['DOCUMENT_ROOT']."/data/inc/view/question.view.php");
        } else {
            include($_SERVER['DOCUMENT_ROOT']."/data/inc/view/no_question.view.php");
        }
    }else{
        include($_SERVER['DOCUMENT_ROOT']."/data/inc/view/index.view.php");
    }
}else{
    include($_SERVER['DOCUMENT_ROOT']."/data/inc/view/index_nolog.view.php");
}



include($_SERVER['DOCUMENT_ROOT']."/data/inc/footer.php");

?>

</body>
</html>
