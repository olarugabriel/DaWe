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
        <?php echo $title; ?>
        </section>
        <section id="bottomHeader"></section>
    </header>
    <main>
         <?php
         require_once HOME . DS . 'includes' . DS . 'menu.inc.php';
         ?>
        <section id="right">
                <form action="/database/changeNameDB" method="POST" >
                    <input type="text" name="nameDB" value="<?php echo $name; ?>">
                    <input type="hidden" name="oldName" value="<?php echo $name; ?>">
                    <input type="submit" value="Change" name="changeNameDb">
                </form>
           
            
    </section>    
    </main>
    <footer>
    </footer>
</body>
</html>