<!DOCTYPE HTML>
<html lang="en-US">

<head>
    <link rel="stylesheet" href="../css/home.css">
    <meta property="og:image" content="https://bnnuyblood.neocities.org/media/screenshots/Home.jpg" />
    <?php include '../components/generic/head.php'; ?>
</head>

<body class="gridmain">
    <img id="niii" src="../media/general/niii-noborder_small.png" alt="Niii" title="nothing clickable here yet">

    <?php include '../components/generic/navBar.php'; ?>
    <header style="grid-area:title;" class="nomargin btncontainer">
        <img class="btn88x31" src="../media/smallbuttons/logo.png" alt="">
        <img class="welcome pixel" src="../media/gifs/fire_welcome.gif" title="welcome" alt="WELCOME!">
        <img class="btn88x31" src="../media/smallbuttons/ouch.png" alt="">
    </header>

    </main>

    <aside class="nomargin" style="grid-area:left;">
        <?php include '../components/home/blogNews.php'; ?>
        <?php include '../components/home/latestArt.php'; ?>
        <section class="cardnew ">
            <h3>| chat | </h3>
            <hr>
            <iframe id="chat" src="https://www5.cbox.ws/box/?boxid=934146&boxtag=RLyDL0" width="100%" height="auto" allowtransparency="yes" allow="autoplay" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto"></iframe>
        </section>
    </aside>

    <aside class="nomargin" style="grid-area:right;">
        <?php include '../components/home/about.php'; ?>
        <div class="nomargin" style="display:flex;">
            <?php include "../components/home/updateBox.php" ?>
            
            <article class="cardnew webrings">
                <h3>| Webrings |</h3>    
                <div class="center-column" style="height:90%;">
                    <p>havent joined any yet :P</p>
                </div>
            </article>
        </div>
    </aside>

    <?php include '../components/generic/footer.php' ?>

</body>



</html>