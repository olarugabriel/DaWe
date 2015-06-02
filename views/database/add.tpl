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
        <?php echo $title; ?>
        </section>
        <section id="bottomHeader"></section>
    </header>
    <main>
         <section id="left">

             <span><a href="/home/index">BAZE DE DATE :</a></span>
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
            <form action="/database/createTable/<?php echo $infoDatabase['NAME']; ?>" method="POST" enctype="multipart/form-data">
                 <table>
                    <thead>
                        <tr>
                            <th >Name</th>
                            <th >TYPE</th>
                            <th >VALUE</th>
                            <th >NULL</th>
                            <th >INDEX</th>
                            <th >A_I</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php
                            echo "Name of Table: ".$name;
                            for($i=1;$i<=$nr;$i++)
                            {
                                ?>
                                 <tr>
                                 <td><input type"text" name="name<?php echo $i;  ?>"></td>
                                <td>
                                    <select name="field_type<?php echo $i;  ?>" id="field_type">
                                        <option >INT</option>
                                        <option >VARCHAR</option>
                                        <option >TEXT</option>
                                        <option >DATE</option>
                                    </select>
                                    <td><input type="value<?php echo $i;  ?>"></td>
                                    <td><input type="checkbox" name="checknull<?php echo $i;  ?>" value="NOT NULL"></td>
                                    <td>
                                        <select name="field_type_index<?php echo $i;  ?>" id="field_type">
                                            <option ></option>
                                            <option >PRIMARY KEY</option>
                                            <option >UNIQUE</option>
                                            <option >INDEX</option>
                                        </select>
                                    </td>
                                    <td><input type="checkbox" name="checkai<?php echo $i;  ?>" value="AUTO_INCREMENT"></td>
                                </td>
                                 </tr>
                                <?php
                            }
                        ?>
                    </tbody>
                    </table>
                    <input type="hidden" name="nr" value="<?php echo $nr; ?>">
                     <input type="hidden" name="nameTable" value="<?php echo $name; ?>">
                    <input type="submit" name="createTableSubmit" value="CREATE">
                    <input type="submit" name="cencelTableSubmit" value="CENCEL">
                </form>
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
            echo "<h2>Eroare la salvarea datelor. Reincercati!</h2>" . $saveError;
        }
        ?>
        </section> 
    </main>
    <footer>
    </footer>
</body>
</html>