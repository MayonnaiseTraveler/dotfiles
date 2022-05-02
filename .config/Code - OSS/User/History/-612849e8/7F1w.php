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
    <?php include '../components/blog/blogIndex.php'; ?>

    <header class="title">
        <img class="title-img" src="../media/general/Blog.png" alt="">
    </header>

    <main class="nomargin" style="grid-area:blogpost;">
        <?php

        $dir = './blog';
        $dirs_inside= glob("$dir/*{}",GLOB_BRACE);
        //$entries = glob("$dirs_inside[1]/*.{*}",GLOB_BRACE);
        //echo $entries[0];

        foreach ($dirs_inside as $i){
            //push the files inside each dir to blogentries array
            $temparray = glob("$i/*.{html,php,md}",GLOB_BRACE);
            foreach($temparray as $j){
                $entries[] = $j;  
            }

            //array_push($entries, glob("$i/*.{html,php,md}",GLOB_BRACE) );
        };
        
       //$entry = glob("./blog*.{html,php,md}", GLOB_BRACE);

        
        usort($entries, function ($file1, $file2) {
            // NEWEST FILE FIRST
            return filemtime($file2) <=> filemtime($file1);
            // OLDEST FILE FIRST
            // return filemtime($file1) <=> filemtime($file2);
        });


        for ($i = 0;$i < 3;$i++) {

            $basefile = basename($entries[$i]);
            $name = pathinfo($basefile, PATHINFO_FILENAME);
            printf(" <article id='%s' class='cardnew clearfix gridblogpost'", $i); #Kinda hacky but works for now
            include $entries[$i];
            echo "</article>";
            #if $i = array_Len printf("</div>")    print one extra div to close the blogpost grid area
        };

        # check if this should be done with JS later and change if necessary
        ?>
        </main>

    <?php include '../components/generic/footer.php' ?>

</body>


</html>
