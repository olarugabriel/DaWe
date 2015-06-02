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
   <section id="left">

    <span><a href="/home/index">BAZE DE DATE :</a></span><br >
    <span><a href="/home/add">New Database</a></span>
    <section id="tree">
      <ol class="tree">
        <?php
        $k=1;
        foreach ($info as $i => $value) {
          ?>
          <li>
            <a href="/database/index/<?php echo $i; ?>"><?php echo $i; ?></a>
            <?php
            if(!empty($value))
            { 
              ?>
              <ol>
                <?php
                foreach ($value as $key => $v) {
                  ?>
                  <li class="file"><a href="/table/index/<?php echo $v['name'];  ?>"><?php echo $v['name'];  ?></a></li>
                  <?php
                }
                ?>
              </ol>

              <?php
            }
            ?>
          </li>   
          <?php
        }
        ?>


      </ol>

    </section>
  </section>
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
     <input type="submit" value="Add">
    </form>

  </section>    
</main>
<footer>
</footer>
</body>
</html>