<?php

  if(isset($_POST['colorSubmit']))
  {
   define ('CULOARE_IMPLICITA', '');
   define ('FONT_IMPLICIT','Copperplate Gothic Light');
   define ('DIMENSIUNE_FONT_IMPLICITA','16px');   
   define ('CULOARE_FONT_IMPLICITA','black');
   $culoare=null;
   $font=null;
   $fontSize=null;   
   $fontColor=null;     
   //verificam daca exista culoarea
   if(isset($_REQUEST['culoare']))
    $culoare_fundal = $_REQUEST['culoare'];
   
    if(isset($_REQUEST['font']))
     $font_pagina= $_REQUEST['font'];

     if(isset($_REQUEST['fontSize']))
     $fontSize_pagina = $_REQUEST['fontSize'];

     if(isset($_REQUEST['fontColor']))
     $fontColor_pagina = $_REQUEST['fontColor'];

     if (!$culoare) // nu exista
        $culoare = CULOARE_IMPLICITA; // stabilim culoarea implicita
     
     if (!$font) // nu exista
        $font = FONT_IMPLICIT; 
     
     if (!$fontSize) // nu exista
        $fontSize = DIMENSIUNE_FONT_IMPLICITA; 
     
     if (!$fontColor) // nu exista
        $fontColor = CULOARE_FONT_IMPLICITA;                 
     
 // setam cookie-ul sa expire peste o zi
   if (!setcookie('culoare_fundal', $culoare_fundal, time() + 60 * 60 * 24 * 1,"/")) {
      echo 'Cookie-ul n-a putut fi setat';
}  

   if (!setcookie('font_pagina', $font_pagina, time() + 60 * 60 * 24 * 1)) {
      echo 'Cookie-ul n-a putut fi setat';
   }   

 if (!setcookie('fontSize_pagina', $fontSize_pagina, time() + 60 * 60 * 24 * 1)) {
      echo 'Cookie-ul n-a putut fi setat';
   } 

 if (!setcookie('fontColor_pagina', $fontColor_pagina, time() + 60 * 60 * 24 * 1)) {
      echo 'Cookie-ul n-a putut fi setat';
   }
}
else
{
 (isset($_COOKIE['culoare_fundal'])) ? $culoare_fundal = $_COOKIE['culoare_fundal'] : $culoare_fundal='gray';
 (isset($_COOKIE['font_pagina'])) ? $font_pagina = $_COOKIE['font_pagina'] : $font_pagina='Copperplate Gothic Light';
 (isset($_COOKIE['fontSize_pagina'])) ? $fontSize_pagina = $_COOKIE['fontSize_pagina'] : $fontSize_pagina='16px';
 (isset($_COOKIE['fontColor_pagina'])) ? $fontColor_pagina = $_COOKIE['fontColor_pagina'] : $fontColor_pagina='black';

}
?> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/views/setari/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/views/setari/css/setari.css" type="text/css" rel="stylesheet"/>
<title>DaWe</title>
</head>
<body>
    <header>
        <section id="title">

        </section>
        <section id="bottomHeader"></section>
    </header>
    <main>
        <!--  <?php include HOME . DS .  'includes' . DS . 'menu.inc.php'; 
    ?> -->
<section id="right">               
            <section id="formBox"> 
                        <main>  
                         <style type="text/css">

                         body { background: <?php echo $culoare_fundal; ?>;
                                font-family:<?php echo $font_pagina; ?>;
                                font-size:<?php echo $fontSize_pagina; ?>;
                                color:<?php echo $fontColor_pagina; ?>;}
                         </style>
                          <a class="button_example" href="/setari/index/" >SETARI</a> 
                       <p>Alegeti setarile ce vor aparea la urmatoarea vizita:</p>
                        <form action="/setari/index" method="post">

                            <select id="culoare_fundal" name="culoare">
                            <option <?php if ($culoare_fundal == 'gray' ) echo 'selected'; ?> value="gray">Gray</option>
                            <option <?php if ($culoare_fundal == 'lightblue') echo 'selected'; ?> value="lightblue">Light Blue</option>
                            <option <?php if ($culoare_fundal == 'lightgreen' ) echo 'selected'; ?> value="lightgreen">Light Green</option>
                            <option <?php if ($culoare_fundal == 'black' ) echo 'selected'; ?> value="black">Black</option>
                            <option <?php if ($culoare_fundal == 'orange' ) echo 'selected'; ?> value="orange">Orange</option>
                            </select>

                            <select id="font_pagina" name="font">
                            <option <?php if ($font_pagina == 'Copperplate Gothic Light' ) echo 'selected'; ?> value="Copperplate Gothic Light">Copperplate Gothic Light</option>
                            <option <?php if ($font_pagina == 'Georgia') echo 'selected'; ?> value="Georgia">Georgia</option>
                            <option <?php if ($font_pagina == 'Lucida Console' ) echo 'selected'; ?> value="Lucida Console">Lucida Console</option>
                             <option <?php if ($font_pagina == 'Palatino Linotype' ) echo 'selected'; ?> value="Palatino Linotype">Palatino Linotype</option>
                              <option <?php if ($font_pagina == 'Book Antiqua' ) echo 'selected'; ?> value="Book Antiqua">Book Antiqua</option>
                            </select>

                            <select id="fontSize_pagina" name="fontSize">
                            <option <?php if ($fontSize_pagina == '14'.'px' ) echo 'selected'; ?> value="14px">14px</option>
                            <option <?php if ($fontSize_pagina == '16'.'px' ) echo 'selected'; ?> value="16px">16px</option>
                            <option <?php if ($fontSize_pagina == '18'.'px' ) echo 'selected'; ?> value="18px">18px</option>
                            <option <?php if ($fontSize_pagina == '20'.'px' ) echo 'selected'; ?> value="20px">20px</option>
                            </select>

                            <select id="fontColor_pagina" name="fontColor">
                            <option <?php if ($fontColor_pagina == 'black' ) echo 'selected'; ?> value="black">Black</option>
                            <option <?php if ($fontColor_pagina == 'white' ) echo 'selected'; ?> value="white">White</option>
                            <option <?php if ($fontColor_pagina == 'blue') echo 'selected'; ?> value="blue">Blue</option>
                            <option <?php if ($fontColor_pagina == 'green' ) echo 'selected'; ?> value="green">Green</option>
                            <option <?php if ($fontColor_pagina == 'orange' ) echo 'selected'; ?> value="orange">Orange</option>
                            </select>
                            <input type="submit" name="colorSubmit" class="button_setari" value="Executa" />

                        
                        </form>
                </div>
<button onclick="goBack()">Go Back</button>
     
<script>
function goBack() {
    window.history.back();
}
</script>
            </section>
        </section> 

        </section>
    </main>
    <footer>
    </footer>
</body>
</html>