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
         <section id="left">

             <span><a href="/home/index">BAZE DE DATE :</a></span><br >
             <span><a href="/home/add">New Database</a></span>
            <section id="tree">
                <ol class="tree">
                    <?php
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
 
            <section id="formBox">

                <div class= "pozitionare">
                     <div class="img">
                     <a  href="/database/drop/<?php echo $infoDatabase['NAME']; ?>"><img src="/views/home/css/images/07.png" alt="" width="10" height="50" ><div class="desc"><h4>Drop</h4></div></a>
                    </div>
                    <div class="img">
                     <a  href="/database/edit/<?php echo $infoDatabase['NAME']; ?>"><img src="/views/home/css/images/08.png" alt="" width="10" height="50" ><div class="desc"><h4>Edit</h4></div></a>
                    </div>
                    <div class="img">
                     <a href="/database/export/<?php echo $infoDatabase['NAME']; ?>"><img src="/views/home/css/images/05.png" alt="" width="10" height="50" ><div class="desc"><h4>EXPORTA</h4></div></a>
                    </div>

                    <div class="img">
                     <a  href="/datatabase/importa/<?php echo $infoDatabase['NAME']; ?>"><img src="/views/home/css/images/06.png" alt="" width="10" height="50"><div class="desc"><h4>IMPORTA</h4></div></a>
                    </div> 
                   
            </section> <br ><br >
            <section id="addForm">
                <form action="/database/add/<?php echo $infoDatabase['NAME']; ?>" method="POST">
                      <span class="type" >Name:</span><br>
                      <input type="text" name="name">
                      <br>
                          <span class="type">Number of rows:</span><br>
                      <input type="text" name="nr"  ><br ><br >
                      <input id="inre" class="button" type="submit" name="addFormSubmit"  value="Add Table" >
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