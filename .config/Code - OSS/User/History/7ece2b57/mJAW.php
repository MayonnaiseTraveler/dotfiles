<section class="cardnew">
    <h6 class="t-left">| Latest Blogs |</h6>
    <hr>
    <section class="clearfix-scroll">
        <ul class="blog-index">
            <?php
           

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
</section>
