<section class="cardnew">
    <h6 class="t-left">| Latest Blogs |</h6>
    <hr>
    <section class="clearfix-scroll" style="margin:0; padding:0 .5vw">
        <ul class="blog-index">
            <?php
           
            include "../components/blog/blogSys.php";

            if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')
                $url = "https://";
            else
                $url = "http://";
            // Append the host(domain name, ip) to the URL.   
            $url .= $_SERVER['HTTP_HOST'];
            // Append the requested resource location to the URL   
            $url .= $_SERVER['REQUEST_URI'];
            
            blog_print(2,true);
           
            ?>
        </ul>


    </section>
</section>
