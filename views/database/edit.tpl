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

             <span><a href="/home/index">BAZE DE DATE :</a></span>
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