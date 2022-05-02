<section class="cardnew art">
    <h5>| Latest Art |</h5>
    <hr>
    <section class="center">
        <?php
        $dir = './media/art/jpg/';
        $image = glob("$dir*.{jpg}", GLOB_BRACE);
        usort($entry, function ($file1, $file2) {
            // NEWEST FILE FIRST
            return filemtime($file2) <=> filemtime($file1);
            // OLDEST FILE FIRST
            // return filemtime($file1) <=> filemtime($file2);
        });

        for ($i = 0; $i < 3; $i++) {
            $basefile = basename($image[$i]);
            if (isset($basefile) && $basefile !== '') {

                $name = pathinfo($basefile, PATHINFO_FILENAME);;
                $date = date("d M Y ", filectime($image[$i]));
                printf("<img class='imageswitch' src='%s' alt='%s' date='%s'>", $image[$i], $name, $date);
            }
        };
        ?>

        <script src="./js/imageswitch.js"></script>
    </section>
</section>