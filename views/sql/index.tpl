<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/views/sql/css/importa.css" type="text/css" rel="stylesheet" />
    <link href="/views/sql/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/views/sql/css/_styles.css" type="text/css" rel="stylesheet" />
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

 <section id="right">
 
            <section id="formBox">
<form action="/sql/run" method="POST">
Your table name to export: <textarea rows="5" cols="50" name="sql"> </textarea><br>
<input type="submit" name="Submit" value="RUN">
</form>
<br>
<p>Ex: SELECT col1,col2 FROM table1 WHERE col1=2
</section>
</section>

    </main>
    <footer>
    </footer>
</body>
</html>