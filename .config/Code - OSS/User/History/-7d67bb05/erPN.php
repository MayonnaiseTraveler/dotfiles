<!doctype html>
<html lang="en">
    
    <head>

        <link rel="stylesheet" href='../css/styles.css' >
        <?php include '../components/general/head.php' ?>
    </head>
    

    <body>
        <?php include '../components/zines/header-zines.php' ?>
        <?php include '../components/zines/zinenav.php'?>
        <main>
            <article id="zine"class="card">
                <section id="zine-title">
                <h1> <?php echo str_replace("-"," ",pathinfo(basename(__FILE__), PATHINFO_FILENAME));?></h1>
                    <p> ##author - ##date </p>
                    <hr>
                </section >
                
                <section id="content" class="clearfix">
                    <p id="rainbow" style="font-size:2vw;text-align:center;margin:20% 0vw">~ <i>W e l c o m e   B a c k !</i> ~<br> Thx for stopping by to  ~ <b> C h e c k p o i n t   Y o u r   L i f e ! ~</b> <br> now have a break and a nice coffee!</p>
                </section >
            
            </article>   
         
        </main>

        <?php include '../components/zines/zinenav.php'?>
        <?php include '../components/general/footer.php' ?>
    </body>


</html>
