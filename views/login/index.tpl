<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/views/login/css/main.css" type="text/css" rel="stylesheet" />
       <title>DaWe</title>
</head>
<body>
    <header>
        <section id="title"></section>
        <section id="bottomHeader"></section>
    </header>
    <main>
        <section></section>
        <form action="/login/save" method="post"> 
            <section id="formBox">
                <section>
                <div id="allForm">
                <h1>Logare sau <span>Inregistrare</span></h1>
                    <span class="type">USERNAME:</span><br>
                    <input type="text" name="name"  autocomplete="off"/>
                    <br>
                    <span class="type">PASSWORD:</span><br>
                    <input type="password" name="password"  autocomplete="off"/>
                    <br><br>
                    <input class="button" name="loginFormSubmit" type="submit" value="Logare">
                    <a  href="/inregistrare/index">
                    <input id="inre" class="button" type="button" value="Inregistrare "></a>
                    </form>
                </div>
            </section>
        </section>  
    <section id="error">
	<h1><?php echo $title; ?></h1>
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