<section>
    <div class="flip-horizontal-bottom box-cats">
        <div class="box">
            <div class="head"><h3>Choisiez votre cat</h3></div>
            <div class="foot">
                <?php foreach ($id_cats as $id_cat){ ?>
                    <div class="box-cat">
                        <a
                                class="<?php if(available_question($_SESSION['userid'], $id_cat['id_cat'])){ echo "active"; }else{ echo "disable";}?>"
                                style=" background-image: url('../../data/img/<?= $id_cat['libelle'] ?>.jpg') "
                                href="<?php if(available_question($_SESSION['userid'], $id_cat['id_cat'])){ echo '?id_cat='.$id_cat['id_cat']; }?>"></a>
                        </a>
                    </div>
                <?php }?>
            </div>
        </div>
    </div>
</section>