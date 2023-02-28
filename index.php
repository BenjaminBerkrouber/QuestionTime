<?php

include('app/php/config.php');
include('app/php/functions/question.php');
include('app/php/functions/security/user.php');

//addUser('benjamin','benjamin2.berkrouber@gmail.com','password', 'password' );

$userinfo = logUser('benjamin.berkrouber@gmail.com', 'password');
$question = get_question();
$reponses = get_reponse($question['id_question']);
//logout();

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

<?php

include($_SERVER['DOCUMENT_ROOT']."/data/inc/header.php");
include($_SERVER['DOCUMENT_ROOT']."/data/inc/view/index.view.php");
include($_SERVER['DOCUMENT_ROOT']."/data/inc/footer.php");

?>

</body>
</html>
