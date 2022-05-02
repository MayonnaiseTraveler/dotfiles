<section class="cardnew art carrousel">
    <h5>| Latest Art |</h5>
    <hr>
    <!--button id="btnleft" onclick="moveleft()"><</button>
    <button id="btnright" onclick="moveright()">></button-->
    <section id="carrousel" data-pos="0">
        
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


        <script src="../js/carrousel.js" onload="start('#carrousel',true,1,600,300)"></script>
    </section>
    <btn id="carrousel-btn-left" onclick="start('#about-div',false,-1,500,500);"></btn>
    <btn id="carrousel-btn-right" onclick="start('#about-div',false,1,500,500);"></btn>
</section>