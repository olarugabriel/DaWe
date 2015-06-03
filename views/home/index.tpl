<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/views/home/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/views/home/css/_styles.css" type="text/css" rel="stylesheet"/>
<title>DaWe</title>


</head>
<body>
    <header>
        <section id="title">
        
        <a href="/home/logout">Log Out</a>
        </section>
        <section id="bottomHeader"></section>
    </header>
    <main>
         <?php
         require_once HOME . DS . 'includes' . DS . 'menu.inc.php';
         ?>
        <section id="right">
 
            <section id="formBox">

                <div class= "pozitionare">
                   <div class="img">
                     <a  href="/sql/index"><img src="/views/home/css/images/01.png" alt="" ><div class="desc"><h4>SQL</h4></div></a>
                    </div>
                    <?php
                    if($_SESSION['type']==2)
                    {
                        ?>
                        <div class="img">
                         <a  href="/utilizatori/index"><img src="/views/home/css/images/02.png" alt="" ><div class="desc"><h4>UTILIZATORI</h4></div></a>
                        </div>
                     <?php
                     }
                    ?>
                    
                    <div class="img">
                     <a  href="/cauta/index"><img src="/views/home/css/images/03.png" alt="" > <div class="desc"><h4>CAUTA</h4></div></a>
                    </div>   

                    <div class="img">
                     <a href="/setari/index"><img src="/views/home/css/images/04.png" alt="" ><div class="desc"><h4>SETARI</h4></div></a>
                    </div>

                    <div class="img">
                     <a href="/export/index"><img src="/views/home/css/images/05.png" alt="" ><div class="desc"><h4>EXPORTA</h4></div></a>
                    </div>

                    <div class="img">
                     <a  href="/import/index"><img src="/views/home/css/images/06.png" alt=""><div class="desc"><h4>IMPORTA</h4></div></a>
                    </div>   

            </section> 
    </section>    
    </main>
    <footer>
    </footer>
</body>
</html>