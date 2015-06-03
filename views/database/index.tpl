<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link href="/views/database/css/main.css" type="text/css" rel="stylesheet" />
  <link href="/views/home/css/_styles.css" type="text/css" rel="stylesheet"/>
  <link href="/views/database/css/database.css" type="text/css" rel="stylesheet"/>
  <title>DaWe</title>
</head>
<body>
  <header>
    <section id="title">
      
    </section>
    <section id="bottomHeader"></section>
  </header>
  <main>
    <?php
    require_once HOME . DS . 'includes' . DS . 'menu.inc.php';
    ?>
    <section id="right">

      <section id="formBox">
        <a class="button_example" href="/database/index/" >DataBase</a> 
        <div class= "pozitionare">
         <div class="img">
           <a  href="/database/drop/<?php echo $infoDatabase['NAME']; ?>"><img src="/views/home/css/images/07.png" alt=""  ><div class="desc"><h4>Drop</h4></div></a>
         </div>
         <div class="img">
           <a  href="/database/edit/<?php echo $infoDatabase['NAME']; ?>"><img src="/views/home/css/images/08.png" alt=""  ><div class="desc"><h4>Edit</h4></div></a>
         </div>
         <div class="img">
           <a href="/database/export/<?php echo $infoDatabase['NAME']; ?>"><img src="/views/home/css/images/05.png" alt="" ><div class="desc"><h4>EXPORTA</h4></div></a>
         </div>

         <div class="img">
           <a  href="/datatabase/importa/<?php echo $infoDatabase['NAME']; ?>"><img src="/views/home/css/images/06.png" alt="" ><div class="desc"><h4>IMPORTA</h4></div></a>
         </div> 

       </section> <br ><br >
       
       <section id="addForm" >
        <form action="/database/add/<?php echo $infoDatabase['NAME']; ?>" method="POST">
          <span class="type" ><br>Name:</span><br>
          <input type="text" name="name">
          <br>
          <span class="type">Number of rows:</span><br>
          <input type="text" name="nr"  ><br ><br >
          <input id="inre" class="button_db" type="submit" name="addFormSubmit"  value="Add Table" >
        </form>
        <?php 
        if (isset($errors)) 
        {
          echo '<ul>';
          foreach ($errors as $e)
          {
            echo '<li>' . $e . '</li>';
          }
          echo '</ul>';
        } 

        if (isset($saveError))
        {
          echo "<h2>Error saving data. Please try again.</h2>" . $saveError;
        }
        ?>
      </section>

    </section>    
  </main>
  <footer>
  </footer>
</body>
</html>