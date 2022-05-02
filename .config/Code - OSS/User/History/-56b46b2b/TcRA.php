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
        
        <?php include '../components/home/cbox.php'; ?>
    </aside>

    <aside class="nomargin " style="grid-area:right;">
        <?php include '../components/home/about.php'; ?>
        <div class="nomargin flex">
            <?php include "../components/home/updateBox.php" ?>
            
            <article class="cardnew webrings">
                <h3>| Webrings |</h3>    
                <hr>
                <div class="center-column" style="height:90%;">
                    <p>havent joined any yet :P</p>
                </div>
            </article>
        </div>
    </aside>

    <?php include '../components/generic/footer.php' ?>

</body>



</html>