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
         <section id="left">

            <span>BAZE DE DATE :</span>
            <section id="tree">
                <ol class="tree">
                    <li>
                        <label for="folder1">Folder 1</label> <input type="checkbox"  id="folder1" /> 
                        <ol>
                            <li class="file"><a href="document.html.pdf">File 1</a></li>
                            <li class="file"><a href="document.html.pdf">File 2</a></li>
                            <li class="file"><a href="document.html.pdf">File 3</a></li>    
                        </ol>
                    </li>

                    <li>
                        <label for="folder2">Folder 2</label> <input type="checkbox" id="folder2" /> 
                         <ol>
                            <li class="file"><a href="document.html.pdf">File 1</a></li>
                            <li class="file"><a href="document.html.pdf">File 2</a></li>
                            <li class="file"><a href="document.html.pdf">File 3</a></li>    
                        </ol>
                    </li>


                    <li>
                        <label for="folder3">Folder 3</label> <input type="checkbox" id="folder3" /> 
                         <ol>
                            <li class="file"><a href="document.html.pdf">File 1</a></li>
                            <li class="file"><a href="document.html.pdf">File 2</a></li>
                            <li class="file"><a href="document.html.pdf">File 3</a></li>    
                        </ol>
                        
                    </li>
                    <li>
                        <label for="folder4">Folder 4</label> <input type="checkbox" id="folder4" /> 
                        <ol>
                            <li class="file"><a href="document.html.pdf">File 1</a></li>
                            <li class="file"><a href="document.html.pdf">File 2</a></li>
                            <li class="file"><a href="document.html.pdf">File 3</a></li>    
                        </ol>
                        
                    </li>
                    <li>
                        <label for="folder5">Folder 5</label> <input type="checkbox" id="folder5" /> 
                         <ol>
                            <li class="file"><a href="document.html.pdf">File 1</a></li>
                            <li class="file"><a href="document.html.pdf">File 2</a></li>
                            <li class="file"><a href="document.html.pdf">File 3</a></li>    
                        </ol> 
                    </li>
                     <li>
                        <label for="folder5">Folder 5</label> <input type="checkbox" id="folder5" /> 
                         <ol>
                            <li class="file"><a href="document.html.pdf">File 1</a></li>
                            <li class="file"><a href="document.html.pdf">File 2</a></li>
                            <li class="file"><a href="document.html.pdf">File 3</a></li>    
                        </ol> 
                    </li>
                     <li>
                        <label for="folder5">Folder 5</label> <input type="checkbox" id="folder5" /> 
                         <ol>
                            <li class="file"><a href="document.html.pdf">File 1</a></li>
                            <li class="file"><a href="document.html.pdf">File 2</a></li>
                            <li class="file"><a href="document.html.pdf">File 3</a></li>    
                        </ol> 
                    </li>
                </ol>

            </section>
        </section>
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