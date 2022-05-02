<!DOCTYPE HTML>
<html lang="en-US">
<head>
        <link rel="stylesheet" href="../css/styles.css">
        <link rel="stylesheet" href="../css/projects.css">
        <?php include '../components/generic/head.php';?>
</head>

<body class="gridmain">
        <?php include '../components/generic/navBar.php'; ?>
        <script src="../js/gallery.js"></script>

        <main class="cardnew" style="grid-area:center;">
                <div id='carrousel' class=" carrousel nobar" data-pos="0" >
                <?php
                        // (B) GET LIST OF IMAGE FILES FROM GALLERY FOLDER
                        $dir = '../media/projects/comic/pages/';
                        $dir_thumb = '../media/art/thumbnails/';
                        $images = glob("$dir*.{jpg,jpeg,gif,png,bmp,webp}", GLOB_BRACE);

                        usort($images, function ($file1, $file2) {
                                //sort by name
                                return strcasecmp($file1, $file2);
                        });
                        // (C) OUTPUT IMAGES 
                        foreach ($images as $i) {

                                $thumbname = str_replace(".jpg", "_thumb.jpg", basename($i));
                                printf("<img  class='comic-page gallery-image async-image' data-src='%s%s'  loading='lazy' src='%s'/>", $dir, basename($i), $i);
                        }
                ?>       
                <script src="../js/carrousel.js" onload="start('#carrousel','comic-page',false,1)"></script>
                
                </div>
                <button id="btn-comic-prev" onclick="start('#carrousel','comic-page',false,-1)"> prev</button>
                <button id="btn-comic-next" onclick="start('#carrousel','comic-page',false,1)">next </button>
        </main>



        <script src="loadimages.js"></script>
</body>

<?php include '../components/generic/footer.php' ?>

</html>