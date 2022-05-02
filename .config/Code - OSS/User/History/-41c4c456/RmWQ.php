<!DOCTYPE HTML>
<html lang="en">

<head>
    <link rel="stylesheet" href="./css/index.css">
    <meta property="og:image" content="https://bnnuyblood.neocities.org/screenshot.png" />
    <?php include './templates/head.php'; ?>
</head>

<body class="gridmain">
    <script type="text/javascript" src="//counter.websiteout.net/js/35/0/0/0"></script>
    <img id="niii" src="./media/general/niii-noborder_small.png" alt="Niii">

    <?php include './templates/navbar.php'; ?>
    <header style="grid-area:title;" class="nomargin">
        <img class="welcome" src="./media/gifs/fire_welcome.gif" title="welcome" alt="WELCOME!">
    </header>

    <main class="nomargin" style="grid-area:about">
        <?php include './templates/content/about.php'; ?>
    </main>

    <aside class="nomargin" style="grid-area:left;">

        <?php include './templates/blognews.php'; ?>
        <?php include './templates/imageslider.php'; ?>
        <section class="cardnew">
            <iframe src="https://www5.cbox.ws/box/?boxid=934146&boxtag=RLyDL0" width="100%" height="auto" allowtransparency="yes" allow="autoplay" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto"></iframe>
        </section>
    </aside>

    <aside class="nomargin" style="grid-area:right;">

        <?php include "./templates/content/updatebox.php" ?>
    </aside>

    <?php include './templates/footer.php' ?>

</body>



</html>










</html>