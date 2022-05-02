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
                    <h3 class="glow"> Hey professor read this!!!</h3>
                    <hr>
                </section >
                
                <section id="content" class="clearfix">
                    <p>Hi <strong>professor</strong>, in case you're reading this, i just want to tell you how i've made this website! <br> 
                actually i'm using php to make this just so i don't have to manually copy and paste the same pieces of code on every webpage and all that stuff, but there's a twist, i'm using a python script to convert php int pure html and then just cleaning up the code a bit. Also i've already made the css of the website aswell, if you think i should change anything or have any good advice fell free to tell me! hope you like the website!</p>                             
               </section >
            
            </article>   
         
        </main>

        <?php include '../components/zines/zinenav.php'?>
        <?php include '../components/general/footer.php' ?>
    </body>


</html>
