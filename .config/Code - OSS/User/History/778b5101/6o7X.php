<!DOCTYPE HTML>
<html lang="en-US">

<head>
    <link rel="stylesheet" href="../css/art.css">
    <meta property="og:image" content="https://bnnuyblood.neocities.org/screenshot.png" />
    <?php include '../components/generic/head.php'; ?>
</head>

<body class="gridmain"> 


    <!--?php include '../components/cutegifs.php'?-->

        <?php include '../components/generic/footer.php' ?>
        <?php include '../components/generic/navBar.php'; ?>
        <main style="grid-area:middle;">
            <img class="logo"src="../media/general/art.png" alt="art">

            <section>
                <script src="../js/gallery.js"></script>
                <?php
                // (B) GET LIST OF IMAGE FILES FROM GALLERY FOLDER
                $dir = '../media/art/jpg/';
                $dir_thumb = '../media/art/thumbnails/';
                $images = glob("$dir*.{jpg,jpeg,gif,png,bmp,webp}", GLOB_BRACE);

                usort($images, function ($file1, $file2) {
                    // NEWEST FILE FIRST
                    return filectime($file2) <=> filectime($file1);
                    // OLDEST FILE FIRST
                    // return filemtime($file1) <=> filemtime($file2);
                });
                // (C) OUTPUT IMAGES 
                foreach ($images as $i) {

                    $thumbname = str_replace(".jpg", "_thumb.jpg", basename($i));
                    printf("<img  class='gallery-image async-image' data-src='%s%s'  loading='lazy' src='%s%s'/>", $dir, basename($i), $dir_thumb, $thumbname);
                }
                ?>
            </section>
        </main>

    <script src="../js/loadimages.js"></script>
</body>


</html>
