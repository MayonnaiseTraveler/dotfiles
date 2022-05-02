
<aside class="cardnew" style="grid-area:bloglist;">
    <h5 class="t-left">| Blog Index |</h5>
    <hr>
    <section class="clearfix-scroll">
        <ul class="blog-index">
            <?php
            $dir = './blog/';
            $entry = glob("$dir*.{html,php,md}", GLOB_BRACE);


            if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')
                $url = "https://";
            else
                $url = "http://";
            // Append the host(domain name, ip) to the URL.   
            $url .= $_SERVER['HTTP_HOST'];
            // Append the requested resource location to the URL   
            $url .= $_SERVER['REQUEST_URI'];

            foreach ($entry as $i) {
                $basefile = basename($i);
                $name = pathinfo($basefile, PATHINFO_FILENAME);;
                $date = date("d M Y ", filectime($i));

                #printf("<li> %s - <a href='%s#%s'> %s </a> </li>", $date, $url, $name, $name);
                printf("<li> %s - <a href='./blog.html#%s'> %s </a> </li>", $date, $name, $name);
            };
            ?>
        </ul>


    </section>
</aside>