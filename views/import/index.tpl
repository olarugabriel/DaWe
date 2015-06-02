?> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/views/import/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/views/import/css/setari.css" type="text/css" rel="stylesheet"/>
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

        <span>BAZE DE DATE :</span>
          <!--   <section id="tree">
                <ol class="tree">
                    <?php
                    $k=1;
                    foreach ($info as $i => $value) {
                        ?>
                        <li>
                            <label for="folder<?php echo $k; ?>"><?php echo $i; ?></label> <input type="checkbox"  id="folder<?php echo $k; $k++; ?>" /> 
                             <ol>
                                <?php
                                foreach ($value as $key => $v) {
                                    ?>
                                     <li class="file"><a href="/table/index"><?php echo $v['name'];  ?></a></li>
                                    <?php
                                }
                                ?>
                            </ol>
                        </li>   
                        <?php
                    }
                    ?>
                </ol>

            </section> -->
        </section> 
        <section id="right">
 
            <section id="formBox">

             <a class="button_example"><input type="submit" name="Submit" value="Importa" /> </a>



             <!-- <input type="file" />    -->
             <div> <span>Selecteaza locatia:       <a class="button_cauta" href="#">CAUTA ...   
<input name="csv" type="file" id="csv" /> 
 <input type="submit" name="colorSubmit" class="button_setari" value="Executa" />
             </a></span></div>
            <!--  <a class="button_cauta" href="#">CAUTA ...   </a>
 -->
            </section> 
    </section>    
    </main>
    <footer>
    </footer>
</body>
</html>