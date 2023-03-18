<section>
    <div class="flip-horizontal-bottom box-question">
        <div class="box">
            <div class="head"><h3><?= $question['libelle']?></h3></div>
            <div class="foot">
                <form action="index.php?id_cat=<?= $id_cat ?>" method="POST">
                    <?php foreach ($reponses as $reponse) {  ?>
                        <div class="rep" <?php if((int)$reponse['id_reponse'] %2 == 0){ ?> id="red" <?php }?>>
                            <input type="hidden" name="id_question" value="<?= $question['id_question'] ?>">
                            <input type="hidden" name="id_reponse" value="<?= $reponse['id_reponse'] ?>">
                            <input type="submit" name="form-rep" value="<?= $reponse['libelle'] ?>">
                        </div>
                    <?php } ?>
                </form>
            </div>
        </div>
    </div>
</section>

<section>
    <div class="box-pr">
        <?php

        if($percent['pr_1'] == 100){ ?>
            <div class="pr2" style="width:<?= $percent['pr_1'] ?>%">
                <span class="jauge-remplissage5-1"></span>
                <span class="jauge-remplissage5-2"></span>
                <span class="jauge-text"><?= $percent['pr_1'] ?>%b</span>
            </div>
        <?php }elseif($percent['pr_1'] > 0){ ?>
            <div class="pr2" style="width:<?= $percent['pr_1'] ?>%">
                <span class="jauge-remplissage4"></span>
                <span class="jauge-text"><?= $percent['pr_1'] ?>%b</span>
            </div>

        <?php } if($percent['pr_2'] > 0){ ?>
            <div class="pr2" style="width:<?= $percent['pr_2'] ?>%">
                <span class="jauge-remplissage3"></span>
                <span class="jauge-text"><?= $percent['pr_2'] ?>%r</span>
            </div>
        <?php } ?>
    </div>
</section>

<?php sleep(0.5); ?>
