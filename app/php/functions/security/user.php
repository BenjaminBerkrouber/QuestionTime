<?php

function logUser($usermail, $userpass)
{
    $usermailVerified = htmlspecialchars($usermail);
    $userpassVerified = htmlspecialchars($userpass);
    $userpassVerified = sha1($userpassVerified);
    $results = executeRequest
    (
        "SELECT * FROM users WHERE usermail = ? AND password = ?",
        [
            $usermailVerified,
            $userpassVerified
        ]
    );

    if ($results->rowCount() === 1)
    {
        $userinfo = $results->fetch();
        $_SESSION['id'] = $userinfo['id'];
        $_SESSION['username'] = $userinfo['usermail'];
        $_SESSION['usermail'] = $userinfo['usermail'];
        return $userinfo;
    }
    else
    {
        $error = "Mail ou mot de passe invalide !";
        return $error;
    }

}

function addUser($username,$usermail,$userpass,$userpass2)
{
    $username = htmlspecialchars($username);
    $usermail = htmlspecialchars($usermail);

    $userpass = htmlspecialchars($userpass);
    $userpass2 = htmlspecialchars($userpass2);

    $passlenght = strlen($userpass);
    $usernamelenght = strlen($username);
    $maillenght = strlen($usermail);


    if($passlenght < 8)
    {
        $error = "Votre mot de passe fait moins de 8 caractères";
    }

    if($userpass !== $userpass2) {
        $error = "Vos mots de pass sont différent";
    }

    $userpassEnc = sha1($userpass);

    if($usernamelenght > 20)
    {
        $error = "Votre prénom de doit pas dépasser 20 caractères";
    }

    if ($maillenght > 40)
    {
        $error = "Votre Email ne doit pas dépasser 40 caractères";
    }

    $results = executeRequest(
        "SELECT * FROM users WHERE usermail = ?",
        [
            $usermail
        ]
    );


    if ($results->rowCount() === 1)
    {
        $error = "Adresse mail déjà utiliser";
    }

    if(isset($error)){echo $error;}

    addUserValidate($username, $userpassEnc, $usermail);

    logUser($usermail, $userpass);

}

function addUserValidate($username, $usermail, $userpass)
{
    executeRequest(
        "INSERT INTO users(username, usermail, password) VALUES (?, ?, ?)",
        [
            $username,
            $usermail,
            $userpass
        ]
    );
}

function delUser($userid)
{
    executeRequest(
        "DELETE FROM users WHERE id = ?",
        [
            $userid
        ]
    );
    echo "Utilisateur supprimer";
}

function logout()
{
    $_SESSION = array();
    session_destroy();
}

?>