<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/views/home/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/views/home/css/_styles.css" type="text/css" rel="stylesheet"/>
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
                    <?php 
                    if(!empty($infoUser))
                    {
                    ?>
                            <table>
                              <thead>
                                    <tr>
                                     <th>Actions</th>
                              <th>Name</th>

                               </tr>
                                 </thead>
                                <tbody>
                                     <?php
                                     
                                        $i=0;
                                        foreach ($infoUser as $key => $value) 
                                        {
                                            echo '<tr>';
                                            echo '<th><a href="/utilizatori/edit/'.$value['id'].'">Edit </a> <a href="/utilizatori/delete/'.$value['id'].'">Delete</a></th>';

                                  
                                                    echo '<th >'.$value['name'].'</th>';

                                                echo '</tr>';   
                                                $i++;     
                                        }
                                        
                                     ?> 
                                 </tbody>
                                 </table>
                                 
                                <?php 
                    }
                    else
                    {

                        echo 'Nu exista useri!';
                           


                    }
                                 ?>
                                 </section>
                    </section> 
            </section>    

    </main>
    <footer>
    </footer>
</body>
</html>