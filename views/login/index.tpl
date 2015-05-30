<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title><?php echo $title; ?></title>
    </head>
    <body>
	
		<?php include HOME . DS . 'includes' . DS . 'menu.inc.php'; ?>
		
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
			echo "<h2>Error saving data. Please try again.</h2>" . $saveError;
		}
		?>
		
		<form action="/login/save" method="post">
			
			<section id="formBox">
	            <section>
	                <div id="allForm">
	                <h1>Introduceti datele:</h1>
	             
	                    <span class="type">USERNAME:</span><br>
		                    <input type="text" name="name" ><br>
                        <span class="type">PASSWORD:</span><br>
	                    	<input type="password" name="password" ><br><br>
	                    	<input id="inre" name="loginFormSubmit" class="button" type="submit"  value="Logare ">
	   	                  
	                </div>
	            </section>
        	</section> 
		</form>
		
    </body>
</html>