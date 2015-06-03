
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/views/login/css/main.css" type="text/css" rel="stylesheet" />
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
        <form action="/login/save" method="post" autocomplete="off"> 
            <section id="formBox">
                <section>
                <div id="allForm">
                <h1>Logare sau <span>Inregistrare</span></h1>
                    <span class="type">USERNAME:</span><br>
                    <input type="text" name="name">
                    <br>
                    <span class="type">PASSWORD:</span><br>
                    <input type="password" name="password">
                    <br><br>
                    <input class="button" name="loginFormSubmit" type="submit" value="Logare">
                    <a  href="/inregistrare/index">
                    <input id="inre" class="button" type="button" value="Inregistrare "></a>
                    </form>
                    
                </div>
                
            </section>

        </section>  
<a id="adm" href="/administrator">Administrator</a>
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
            echo "<h2>Eroare la salvarea datelor. Reincercati!</h2>" . $saveError;
        }
        ?>
        </section>
    </main>
    <footer>
    </footer>
</body>
</html>