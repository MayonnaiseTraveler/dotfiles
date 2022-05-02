<?php

        $dir = './blog';
        $dirs_inside = glob("$dir/*{}", GLOB_BRACE);
        //$entries = glob("$dirs_inside[1]/*.{*}",GLOB_BRACE);
        //echo $entries[0];

        foreach ($dirs_inside as $i) {
            //push the files inside each dir to blogentries array
            $temparray = glob("$i/*.{html,php,md}", GLOB_BRACE);
            foreach ($temparray as $j) {
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


        for ($i = 0; $i < 3; $i++) {

            $basefile = basename($entries[$i]);
            $name = pathinfo($basefile, PATHINFO_FILENAME);
            printf(" <article id='%s' class='cardnew clearfix gridblogpost'", $i); #Kinda hacky but works for now
            include $entries[$i];
            echo "</article>";
            #if $i = array_Len printf("</div>")    print one extra div to close the blogpost grid area
        };

        # check if this should be done with JS later and change if necessary
?>