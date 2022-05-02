<aside class="cardnew" style="grid-area:bloglist;">
    <h5 class="t-left">| Blog Index |</h5>
    <hr>
    <section class="clearfix-scroll">
        <ul class="blog-index">
            <?php

            function blog_print(int $mode, bool $sort)
            {
                //make it so optionally you can specify a different dir for the blog
                $dir = './blog';
                $dirs_inside = glob("$dir/*{}", GLOB_BRACE);
                foreach ($dirs_inside as $i) {
                    //push the files inside each dir to blogentries array
                    $temparray = glob("$i/*.{html,php,md}", GLOB_BRACE);
                    foreach ($temparray as $j) {
                        $entries[] = $j;
                    }

                    //array_push($entries, glob("$i/*.{html,php,md}",GLOB_BRACE) );
                };
                if ($sort){
                    usort($entries, function ($file1, $file2) {
                        // NEWEST FILE FIRST
                        return filemtime($file2) <=> filemtime($file1);
                        // OLDEST FILE FIRST
                        // return filemtime($file1) <=> filemtime($file2);
                    });
                }               
                foreach ($entries as $i) {
                    $j=0;
                    $basefile = basename($i);
                    $name = pathinfo($basefile, PATHINFO_FILENAME);;
                    $date = date("d M Y ", filectime($i));

                    switch ($mode){
                        case 1:
                            //Print BlogIndex
                            if ($j=0){
                                echo '
                                <aside class="cardnew" style="grid-area:bloglist;">
                                    <h5 class="t-left">| Blog Index |</h5>
                                    <hr>
                                    <section class="clearfix-scroll">
                                        <ul class="blog-index">';                               
                            }

                                        <h6 class="t-left">';
                            echo basename(dirname($i,1));
                            echo "</h6><hr style='margin-bottom:0t'>";
                            printf("<br><li> %s - <a href='./blog.html#%s'> %s </a> </li>", $date, $name, $name);
                            break;
                        case 2:
                            //Print BlogNews (latest 3 blogs in the index, without topics)
                            if ($j<3){
                                printf("<br><li> %s - <a href='./blog.html#%s'> %s </a> </li>", $date, $name, $name);
                                $j++;
                            }
                            break;
                        case 3:
                            echo "</article>";
                            printf(" <article id='%s' class='cardnew clearfix gridblogpost'", $i); #Kinda hacky but works for now
                            include $entries[$i];
                            //Print BlogPosts (Latest 3 Blog posts in the index)
                            break;
                    }
                    
                };
            }

            //$entries = glob("$dirs_inside[1]/*.{*}",GLOB_BRACE);
            //echo $entries[0];


            //$entry = glob("./blog*.{html,php,md}", GLOB_BRACE);




            
            
            

            if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')
                $url = "https://";
            else
                $url = "http://";
            // Append the host(domain name, ip) to the URL.   
            $url .= $_SERVER['HTTP_HOST'];
            // Append the requested resource location to the URL   
            $url .= $_SERVER['REQUEST_URI'];


            ?>
        </ul>

    </section>
</aside>