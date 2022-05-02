<!DOCTYPE HTML>
<html lang="en-US">

<head>
    <meta property="og:image" content="https://bnnuyblood.neocities.org/screenshot.png" />
    <?php include '../components/generic/head.php'; ?>

    <link rel="stylesheet" href="../css/blog.css">
</head>

<body class="gridmain">

    <!--?php include '../components/cutegifs.php' ?-->
    <?php include '../components/generic/navBar.php'; ?>
    <aside class="cardnew" style="grid-area:bloglist;">
        <h5 class="t-left">| Blog Index |</h5>
        <hr>
            <section class="clearfix-scroll">
                <ul class="blog-index">                               
                    <?php include '../components/blog/blogSys.php'; 
                        blog_print(1,false)
                    ?>
                </ul>
            </section>
    </aside>

    <header class="title">
        <img class="title-img" src="../media/general/Blog.png" alt="">
    </header>

    <main class="nomargin" style="grid-area:blogpost;">
        <?php include '../components/blog/blogSys.php'; 
            blog_print(3,false);
        ?>
    </main>

    <?php include '../components/generic/footer.php' ?>

</body>


</html>
