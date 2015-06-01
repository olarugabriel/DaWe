<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="main.css" type="text/css" rel="stylesheet" />
    <link href="_styles.css" type="text/css" rel="stylesheet"/>
<title>DaWe</title>
</head>
<body>
    <header>
        <section id="title">
        <h1><?php  echo $title; ?></h1>
        </section>
        <section id="bottomHeader"></section>
    </header>
    <main>  


<form action="/sql/run" method="POST">
Your MySQL Query: <textarea rows="4" cols="50" name="sql"> </textarea><br>
<input type="submit" name="Submit" value="RUN">
</form>


    </main>
    <footer>
    </footer>
</body>
</html>