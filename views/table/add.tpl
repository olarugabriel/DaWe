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

    </section>
    <section id="bottomHeader"></section>
  </header>
  <main>
    <?php
          require_once HOME . DS . 'includes' . DS . 'menu.inc.php';
         ?>
  <section id="right">
  <form action="/table/insert" method="POST">
     <?php
     $i=1;
      foreach ($infoTable as $key => $value) {
        $i++;
          echo $value['COLUMN_NAME'].'<input type="text" name="'.$value['COLUMN_NAME'].'" ><br >';
      }
     ?>
     <input type="hidden" name="table" value="<?php echo $table; ?>">
     <input type="hidden" name="nr" value="<?php echo $i; ?>">
     <input class="button_example" type="submit" value="Add">
    </form>

  </section>    
</main>
<footer>
</footer>
</body>
</html>