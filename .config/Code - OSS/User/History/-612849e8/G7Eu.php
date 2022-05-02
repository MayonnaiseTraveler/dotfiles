<!DOCTYPE HTML>
<html lang="en">

<head>
    <meta property="og:image" content="https://bnnuyblood.neocities.org/screenshot.png" />
    <?php include '../components/generic/head.php'; ?>

    <link rel="stylesheet" href="./css/blog.css">
</head>

<body class="gridmain">

    <!--?php include '../components/cutegifs.php' ?-->
    <?php include '../components/navbar.php'; ?>
    <?php include '../components/blogindex.php'; ?>

    <header class="title">
        <img class="title-img" src="/media/general/Blog.png" alt="">
    </header>


        <?php

        $dir = './blog/';
        $entry = glob("$dir*.{html,php,md}", GLOB_BRACE);

        usort($entry, function ($file1, $file2) {
            // NEWEST FILE FIRST
            return filemtime($file2) <=> filemtime($file1);
            // OLDEST FILE FIRST
            // return filemtime($file1) <=> filemtime($file2);
        });



        foreach ($entry as $i) {
            $basefile = basename($i);
            $name = pathinfo($basefile, PATHINFO_FILENAME);
            printf(" <article id='%s' class='cardnew clearfix gridblogpost' style='grid-area:blogpost'>", $name); #Kinda hacky but works for now
            include $i;
            printf("\n </article> ");
            #if $i = array_Len printf("</div>")    print one extra div to close the blogpost grid area
        };
        # check if this should be done with JS later and change if necessary
        ?>




    <?php include '../components/footer.php' ?>

</body>


</html>
