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

        <main style="grid-area:center;">
                <div class="cardnew">
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
                                printf("<img  class='gallery-image async-image' style='max-width:50%%; ' data-src='%s%s'  loading='lazy' src='%s'/>", $dir, basename($i), $i);
                        }
                ?>       
                </div>
        </main>



        <script src="loadimages.js"></script>
</body>

<?php include '../components/generic/footer.php' ?>

</html>