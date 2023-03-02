<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">QuestionTime.com</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <?php if($_SESSION){ ?>
        <div>
            <a href="user.php?action=profil">profil </a>
            <a href="user.php?action=logout">logout</a>
        </div>
        </br>
        <br>
    <?php } else{ ?>
        <div>
            <a href="user.php?action=login"> login</a>
            <a href="user.php?action=register">register</a>
        </div>
    <?php } ?>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">

        </ul>
    </div>
</nav>

