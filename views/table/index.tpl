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

        </section>
        <section id="bottomHeader"></section>
    </header>
    <main>
         <section id="left">

            <span><a href="/home/index">BAZE DE DATE :</a></span><br >
             <span><a href="/home/add">New Database</a></span>
            <section id="tree">
                <ol class="tree">
                    <?php
                    $k=1;
                    foreach ($info as $i => $value) {
                        ?>
                        <li>
                            <a href="/database/index/<?php echo $i; ?>"><?php echo $i; ?></a>
                            <?php
                                     if(!empty($value))
                                   { 
                                    ?>
                                     <ol>
                                                    <?php
                                                    foreach ($value as $key => $v) {
                                                        ?>
                                                         <li class="file"><a href="/table/index/<?php echo $v['name'];  ?>"><?php echo $v['name'];  ?></a></li>
                                                        <?php
                                                    }
                                                    ?>
                                                </ol>

                                  <?php
                                     }
                                  ?>
                        </li>   
                        <?php
                    }
                    ?>

                
                </ol>

            </section>
        </section>
        <section id="right">
 
            <section id="formBox">
            <?php 
            if(!empty($infoTable))
            {
            ?>
                    <table>
                      <thead>
                            <tr>
                             <th>OPTIONS</th>
                    <?php
                                 foreach ($infoTable2 as $key => $value) {
        
                                     echo '<th >'.$value['COLUMN_NAME'].'</th>';
                        }
                    ?>

                       </tr>
                         </thead>
                        <tbody>
                         <?php
                         
                            $i=0;
                            foreach ($infoTable as $key => $value) {
                                 echo '<tr>';
                               echo '<th><a href="/table/edit/'.$i.'-'.$nameTable.'">Edit </a> <a href="/table/delete/'.$i.'-'.$nameTable.'">Delete</a></th>';
                                    foreach($value as $key2=>$value2)
                                    {
                                        echo '<th >'.$value2.'</th>';
                                    }
                                    echo '</tr>';   
                                    $i++;     
                            }
                            
                         ?> 
                         </tbody>
                         </table>
                           <a href="/table/drop/<?php echo $nameTable;?>">Drop table</a>
                            <a href="/table/add/<?php echo $nameTable;?>">Insert </a>
                        <?php 
            }
            else
            {
                ?>

                     <table>
                      <thead>
                            <tr>
                    <?php
                        foreach ($infoTable2 as $key => $value) {
                               
                                    echo '<th >'.$value['COLUMN_NAME'].'</th>';
                        }
                    ?>
                    </tr>
                    </thead>
                    </table>
                      <a href="/table/drop/<?php echo $nameTable;?>">Drop table</a>
                       <a href="/table/add/<?php echo $nameTable;?>">Insert </a>
                <?php

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