<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/views/export/css/exporta.css" type="text/css" rel="stylesheet" />
    <link href="/views/export/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/views/export/css/_styles.css" type="text/css" rel="stylesheet" />
<title>DaWe</title>
</head>
<body>
    <header>
        <section id="title">
        <h1><?php  echo $title; ?></h1>
        </section>
        <section id="bottomHeader"></section>
        <!-- <a href="/export/downloadxml">DownloadXML</a>
        <a href="/export/downloadcsv">DownloadCSV</a> -->
        <!-- <a href="export/downloadxls">DownloadXLS</a> -->
    </header>
    <main>  
        <!-- <p>Pagina test</p> -->
    <section id="right">
    <section id="formBox">

<form action="/export/downloadcsv" method="POST">
Choose table name to export: <textarea rows="1" cols="25" name="table"> </textarea><br>
<input type="submit" name="Submit" value="Exportcsv">
</form>

<form action="/export/downloadxml" method="POST">
Choose table name to export: <textarea rows="1" cols="25" name="name"> </textarea><br>
<input type="submit" name="Submit" value="Exportxml">
</form>

</section>
</section>


    </main>
    <footer>
    </footer>
</body>
</html>