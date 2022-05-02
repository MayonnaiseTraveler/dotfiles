<!DOCTYPE HTML>
<html lang="en-US">

<head>
    <link rel="stylesheet" href="../css/sitemap.css">
    <meta property="og:image" content="https://bnnuyblood.neocities.org/screenshot.png" />
    <?php include '../components/generic/head.php'; ?>
</head>

<body class="gridmain">


    <!--?php include '../components/cutegifs.php'?-->

    <?php include '../components/generic/footer.php' ?>
    <?php include '../components/generic/navBar.php'; ?>
    <header style="grid-area:title;">
        <img class="logo" src="../media/general/sitemap.png" alt="sitemap">
    </header>
    <main style="grid-area:content;" class="cardnew">
        <article>
            <?php
            // (B) GET LIST OF IMAGE FILES FROM GALLERY FOLDER
            $dir = './';
            $page = glob("$dir*.{.php}", GLOB_BRACE);

            // (C) OUTPUT IMAGES 
            foreach ($page as $i) {

                $pagename = str_replace(".php", "_thumb.jpg", basename($i));
                printf("<img  class='gallery-image async-image' data-src='%s%s'  loading='lazy' src='%s%s'/>", $dir, basename($i), $dir_thumb, $thumbname);
            }
            ?>
            
        </article>
    </main>

</body>


</html>