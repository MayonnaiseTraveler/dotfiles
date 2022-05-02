<section class="cardnew art carrousel">
    <h3>| Latest Art |</h3>
    <hr>
    <section id="carrousel" class="nobar" data-pos="0">
        
        <?php
        // (B) GET LIST OF IMAGE FILES FROM GALLERY FOLDER
        $dir = '../media/art/jpg/';
        $dir_thumb = '../media/art/thumbnails/';
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
            printf("<a href='./art.html' class='imagecontainer' style='background-image:url(%s%s)'></a>", $dir_thumb,  $thumbname );
        }
        ?>


        <script src="../js/carrousel.js" onload="start('#carrousel',true,1)"></script>
    </section>
    <btn id="carrousel-btn-left" onclick="start('#carrousel',false,-1);"></btn>
    <btn id="carrousel-btn-right" onclick="start('#carrousel',false,1);"></btn>
</section>