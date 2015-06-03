 <section id="left">
 			 <span><a href="/home/logout">Logout</a></span><br >    
             <span><a href="/home/json">Istoric</a></span><br >
             <span><a href="/home/add">New Database</a></span><br >
                <span><a href="/home/index">BAZE DE DATE :</a></span><br >
            <section id="tree">
                <ol class="tree">
                    <?php
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