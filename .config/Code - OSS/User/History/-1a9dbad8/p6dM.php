<section class="cardnew art">
    <h3>| Latest Art |</h3>
    <hr>
    <section class="center">
        <?php
        // (B) GET LIST OF IMAGE FILES FROM GALLERY FOLDER
        $dir = './media/art/jpg/';
        $dir_thumb = './media/art/thumbnails/';
        $image = glob("$dir*.{jpg,jpeg,gif,png,bmp,webp}", GLOB_BRACE);

        usort($image, function ($file1, $file2) {
            // NEWEST FILE FIRST
            return filectime($file2) <=> filectime($file1);
            // OLDEST FILE FIRST
            // return filemtime($file1) <=> filemtime($file2);
        });
        // (C) OUTPUT IMAGES 
        for ($i = 0; $i < 3; $i++) {
            $thumbname = str_replace(".jpg", "_thumb.jpg", basename($image[$i]));
            printf("<a href='./art.html' class='imagecontainer' ><img  class='imageswitch async-image'  loading='lazy' src='%s%s'/> </a>", $dir_thumb,  $thumbname );
        }
        ?>

    </section>
</section>