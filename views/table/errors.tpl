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