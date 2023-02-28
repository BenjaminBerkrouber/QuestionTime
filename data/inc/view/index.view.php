<section>

    <div class="flip-horizontal-bottom box-question">
        <div class="box">
            <div class="head">
                <h3><?= $question['libelle']?></h3>
            </div>
            <div class="foot">
                <form action="">
                    <?php 
                        foreach ($reponses as $reponse) { ?>
                            <div class="rep">
                                <button><?= $reponse['libelle'] ?></button>
                            </div>
                        <?php }
                    ?>
                </form>
            </div>  
        </div>

    </div>

</section>