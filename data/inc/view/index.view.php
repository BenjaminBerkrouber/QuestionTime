<section>
    <div class="flip-horizontal-bottom box-question">
        <div class="box">
            <div class="head"><h3>Choisiez votre cat</h3></div>
            <div class="foot">
                <?php foreach ($id_cats as $id_cat){ ?>
                    <div class="box-cat">
                        <a href="?id_cat=<?= $id_cat['id_cat'] ?>"><?= $id_cat['libelle'] ?></a>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
</section>