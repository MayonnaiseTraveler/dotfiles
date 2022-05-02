<section class="cardnew art">
    <h5>| Latest Art |</h5>
    <hr>
    <section class="center">
           <?php
                // (B) GET LIST OF IMAGE FILES FROM GALLERY FOLDER
                $dir = './media/art/jpg/';
                $dir_thumb = './media/art/thumbnails/';
                $images = glob("$dir*.{jpg,jpeg,gif,png,bmp,webp}", GLOB_BRACE);

                usort($images, function ($file1, $file2) {
                    // NEWEST FILE FIRST
                    return fileatime($file2) <=> fileatime($file1);
                    // OLDEST FILE FIRST
                    // return filemtime($file1) <=> filemtime($file2);
                });
                // (C) OUTPUT IMAGES 
                for ($i = 0; $i < 3; $i++) {

                    $thumbname = str_replace(".jpg", "_thumb.jpg", basename($i));
                    printf("<img  class='gallery-image async-image' data-src='%s%s'  loading='lazy' src='%s%s'/>", $dir, basename($i), $dir_thumb, $thumbname);
                }
                ?>
        <?php
        $dir = './media/art/jpg/';
        $image = glob("$dir*.{jpg}", GLOB_BRACE);
        
        usort($image, function ($file1, $file2) {
            // NEWEST FILE FIRST
            return fileatime($file2) <=> fileatime($file1);
            // OLDEST FILE FIRST
            // return filemtime($file1) <=> filemtime($file2);
        });

        for ($i = 0; $i < 3; $i++) {
            $basefile = basename($image[$i]);
            if (isset($basefile) && $basefile !== '') {

                $name = pathinfo($basefile, PATHINFO_FILENAME);;
                $date = date("d M Y ", fileatime($image[$i]));
                printf("<img class='imageswitch' src='%s' alt='%s'>", $image[$i], $name);
            }
        };
        ?>

        <script src="./js/imageswitch.js"></script>
    </section>
</section>