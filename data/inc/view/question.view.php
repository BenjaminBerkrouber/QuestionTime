<section>
    <div class="flip-horizontal-bottom box-question">
        <div class="box">
            <div class="head"><h3><?= $question['libelle']?></h3></div>
            <div class="foot">
                <form action="index.php?id_cat=<?= $id_cat ?>" method="POST">
                    <?php foreach ($reponses as $reponse) { ?>
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