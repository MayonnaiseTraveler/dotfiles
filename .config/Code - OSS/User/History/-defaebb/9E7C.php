<!DOCTYPE HTML>
<html lang="en">

<head>

    <link rel="stylesheet" href="./css/projects.css">
    <meta property="og:image" content="https://bnnuyblood.neocities.org/screenshot.png" />
    <?php include './templates/head.php'; ?>
</head>

<body class="gridmain">

    <?php include './templates/cutegifs.php' ?>
    <?php include './templates/navbar.php' ?>
    <header style="grid-area:title">
        <img class="title-img" src="media/general/projects.png" alt="projects" style="width:50%;">
    </header>

    <main class=" cardnew " style="grid-area:middlecenter">
        <header>
            <img id="construction" src="/media/gifs/construction_board.gif" alt="">
        </header>
        <section class="center">

            <div class="project">
                <img class="project-soon" src="media/projects/comic/page0light.jpg" alt="Coming Soon">
                <h5>Coming Soon</h5>
            </div>
            <div class="project">
                <a href="https://mayotraveller.itch.io/nyon" target="_blank" rel="noopener noreferrer">
                    <img class="project-img" src="media/projects/nyon.jpg" alt="Coming Soon">
                </a>
                <h5>Old little game i made</h5>
            </div>

        </section>
    </main>
    <?php include './templates/footer.php' ?>

</body>


</html>
