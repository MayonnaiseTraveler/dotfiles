<section class="cardnew">
    <h6 class="t-left">| Latest Blogs |</h6>
    <hr>
    <section class="clearfix-scroll">
        <ul class="blog-index">
            <?php
            $dir = './blog/';
            $entry = glob("$dir*.{html,php}", GLOB_BRACE);
            usort($entry, function ($file1, $file2) {
                // NEWEST FILE FIRST
                return filemtime($file2) <=> filemtime($file1);
                // OLDEST FILE FIRST
                // return filemtime($file1) <=> filemtime($file2);
            });

            if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')
                $url = "https://";
            else
                $url = "http://";
            // Append the host(domain name, ip) to the URL.   
            $url .= $_SERVER['HTTP_HOST'];
            // Append the requested resource location to the URL   
            $url .= $_SERVER['REQUEST_URI'];

            for ($i = 0; $i < 3; $i++) {
                $basefile = basename($entry[$i]);
                if (isset($basefile) && $basefile !== '') {

                    $name = pathinfo($basefile, PATHINFO_FILENAME);;
                    $date = date("d M Y ", filectime($entry[$i]));
                    printf("<li> %s - <a href='./blog.html#%s'> %s </a> </li>", $date, $name, $name);
                    #printf("<li> %s - <a href='%s#%s'> %s </a> </li>", $date, $url, $name, $name);
                }
            };
            ?>
        </ul>


    </section>
</section>
