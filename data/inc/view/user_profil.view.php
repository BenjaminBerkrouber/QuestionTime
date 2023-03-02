<div class="background">
    <div class="shape"></div>
    <div class="shape"></div>
</div>
<form action="user.php?action=profil" method="POST">
    <h3>Profil</h3>

    <label for="username">Username</label>
    <input type="text" placeholder="Username" id="username" name="username" value="<?= $_SESSION['username']?>">

    <label for="usermail">mail</label>
    <input type="email" placeholder="Email@gmail.com" id="usermail" name="usermail" <?= $_SESSION['usermail']?>>

    <input type="submit" name="up-user" id="submit" value="update">
    
    <div>
        <a href="">up password</a>
        <a href="index.php">go home</a>
    </div>
</form>

<div class="box-reponse">
    <?php foreach ($reponses as $reponse){ ?>
        <div>
            <p><?= $reponse['question'] ?></p>
            <p><?= $reponse['reponse'] ?></p>
        </div>
    <?php } ?>
</div>
