<section id="latestzines" class="card">
    <h2 class="t-left">Latest Zines </h2>    
    <hr>
    <ul id="zineimages">
        <script src="./js/loadimages.js"></script>
           <?php
               // (B) GET LIST OF IMAGE FILES FROM GALLERY FOLDER
               $dir = './media/zines/thumbs/jpg/'; ##big images
               $dir_thumb = './media/zines/thumbs/thumbnails/'; ##small thumbnail images
                $dir_zines = './zines/';
               $images = glob("$dir*.{jpg,jpeg,gif,png,bmp,webp}", GLOB_BRACE);

               usort($images, function ($file1, $file2) {
                   // NEWEST FILE FIRST
                   return filemtime($file2) <=> filemtime($file1);
                   // OLDEST FILE FIRST
                   // return filemtime($file1) <=> filemtime($file2);
               });
               // (C) OUTPUT IMAGES 
               $num = 0;

               foreach ($images as $i) {
                   $thumbname = str_replace('.jpg', "_thumb.jpeg", basename($i));
                   $zinename = str_replace('.jpeg', ".php", basename($i));
                   $num+=1;    
                   if($num <= 5) {
                       printf("<li><a href='%s%s'><img  class='zine-cover async-image' data-src='%s%s'  loading='lazy' src='%s%s'></a></li>",$dir_zines,$zinename, $dir, basename($i), $dir_thumb, $thumbname);
                   }
                }
           ?>
    </ul>
</section>
