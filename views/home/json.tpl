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
 
            <?php
                    var_dump($data);
            ?>
    </section>    
    </main>
    <footer>
    </footer>
</body>
</html>