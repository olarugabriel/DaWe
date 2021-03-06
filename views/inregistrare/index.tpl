<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

   <link href="/views/inregistrare/css/inregistrare.css" type="text/css" rel="stylesheet" />
   <!--  <link href="../_styles.css" type="text/css" rel="stylesheet"/> -->
<title>DaWe</title>
</head>
<body>
    <header>
        <section id="title">
        
        </section>
        <section id="bottomHeader"></section>
    </header>


    <main>
        <section></section>
        <section id="formBox">
            <section>
                <div id="allForm">
                <h1>Introduceti datele:</h1>
                    <form action="/inregistrare/save" method="post"  autocomplete="off">
                        <span class="type">USERNAME:</span><br>
                    <input type="text" name="name">
                    <br>
                        <span class="type">PASSWORD:</span><br>
                    <input type="password" name="password"  >
                    <br><br>
                        <span class="type">RETYPE PASSWORD:</span><br>
                    <input type="password" name="password1" >
                    <br><br>

                    <input id="inre" class="button" type="submit" name="inregistrareFormSubmit"  value="Inregistrare ">
                    </form>
                  
                </div>
            </section>
        </section>    
        <section id="error">
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
    </main>
    <footer>
    </footer>
</body>
</html>

