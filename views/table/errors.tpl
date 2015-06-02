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
    <button onclick="goBack()">Go Back</button>
      <?php 
        echo "<br >Errors:<br >";
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
<script>
function goBack() {
    window.history.back();
}
</script>

  </section>    
</main>
<footer>
</footer>
</body>
</html>