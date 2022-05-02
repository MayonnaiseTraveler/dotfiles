<?php
/** 
*
* Prints andlists Blog Posts
*
* @param mode $mode There are 3 modes: 
* mode 1 prints a blog index where different folders are shown as different topics. 
* mode 2 prints a simpler blog index with the latest 3 blog posts
* mode 3 prints the actual contents of the blog post 
*
* @param sort $sort If True then the output will be sorted , if false it will not 
*/
function blog_print(int $mode, bool $sort)
{  
    
    //make it so optionally you can specify a different dir for the blog later
    $dir = './blog';
    $dirs_inside = glob("$dir/*{}", GLOB_BRACE);
    
    foreach ($dirs_inside as $i) {
        //push the files inside each dir to blogentries array
        $temparray = glob("$i/*.{html,php,md}", GLOB_BRACE);
        foreach ($temparray as $j) {
            $entries[] = $j;
        }

    };
    if ($sort) {
        usort($entries, function ($file1, $file2) {
            // NEWEST FILE FIRST
            return filemtime($file2) <=> filemtime($file1);
            // OLDEST FILE FIRST
            // return filemtime($file1) <=> filemtime($file2);
        });
    }

    $n = 0; // used to count on case 2 when printing
    foreach ($entries as $i) {
        $basefile = basename($i);
        $name = pathinfo($basefile, PATHINFO_FILENAME);;
        $date = date("d/m/Y ", filectime($i));

        switch ($mode) {
            case 1:
                //Print BlogIndex
                echo "<h6 class='t-left'>";
                echo basename(dirname($i, 1));
                echo "</h6><hr style='margin-bottom:0t'>";
                printf("<br><li> %s - <a href='./blog.html#%s'> %s </a> </li>", $date, $i, $name);
                break;
            case 2:
                //Print BlogNews (latest 3 blogs in the index, without topics)
                if ($n < 3) {
                    printf("<br><li> %s - <a href='./blog.html#%s'> %s </a> </li>", $date, $name, $name);
                }
                $n++;
                break;
            case 3:
                //Print BlogPosts (Latest 3 Blog posts in the index)
                printf(" <article id='%s' class='cardnew clearfix gridblogpost'", $i);
                include $i;
                echo "</article>";
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
