<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/views/import/css/import.css" type="text/css" rel="stylesheet" />
    <link href="/views/import/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/views/import/css/_styles.css" type="text/css" rel="stylesheet" />
   
<title>DaWe-Import a CSV File</title>
</head>
<body>
    <header>
        <section id="title">

        </section>
        <section id="bottomHeader"></section>
    </header>
    <main>
<?php 
$link_address='/import/index';
if (!empty($_GET['success'])) {
 echo "<b>Fisierul a fost importat</b><br><br>";
echo '<a href="'.$link_address.'">Link</a>';
 } //generic success notice 
?> 
          <?php
         require_once HOME . DS . 'includes' . DS . 'menu.inc.php';
         ?>
        <section id="right">
 
            <section id="formBox">

             <a class="button_example">

             </a>
             <!-- <input type="file" />    -->
             <div> <span>Selecteaza locatia:       <a class="button_cauta" href="#"> 

            <form action="/import/importcsv" method="post" enctype="multipart/form-data" name="form1" id="form1">Selecteaza fisierul: <br /> 
            <input name="csv" type="file" id="csv" /><br />
            Choose table name to import into:
            <textarea rows="1" cols="25" name="table"></textarea><br>
            <input type="submit" name="Submit" value="Submit" /> 
            </form> 
 

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