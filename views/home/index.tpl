<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/views/home/css/main.css" type="text/css" rel="stylesheet" />
    <link href="/views/home/css/_styles.css" type="text/css" rel="stylesheet"/>
<title>DaWe</title>

 <header>
        <section id="title">
          <a href="/home/logout">Log Out</a>
        </section>
        <section id="bottomHeader"></section>
  </header>
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

                <div class= "pozitionare">
                   <div class="img">
                     <a  href="/sql/index"><img src="/views/home/css/images/01.png" alt="" ><div class="desc"><h4>SQL</h4></div></a>
                    </div>

                    <div class="img">
                     <a  href="/utilizatori/index"><img src="/views/home/css/images/02.png" alt="" ><div class="desc"><h4>UTILIZATORI</h4></div></a>
                    </div>
                    
                    <div class="img">
                     <a  href="/cauta/index"><img src="/views/home/css/images/03.png" alt="" > <div class="desc"><h4>CAUTA</h4></div></a>
                    </div>   

                    <div class="img">
                     <a href="/setari/index"><img src="/views/home/css/images/04.png" alt="" ><div class="desc"><h4>SETARI</h4></div></a>
                    </div>

                    <div class="img">
                     <a href="/export/index"><img src="/views/home/css/images/05.png" alt="" ><div class="desc"><h4>EXPORTA</h4></div></a>
                    </div>

                    <div class="img">
                     <a  href="/import/index"><img src="/views/home/css/images/06.png" alt=""><div class="desc"><h4>IMPORTA</h4></div></a>
                    </div>   

            </section> 
    </section>    
    </main>
    <footer>
    </footer>
</body>
</html>