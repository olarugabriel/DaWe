<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title><?php echo $title; ?> | test</title>
    </head>
    <body>
	
		<?php include HOME . DS . 'includes' . DS . 'menu.inc.php'; ?>
		
		
			<h1>There is no article with the ID you specified.</h1>
			<?php
				echo $datePublished;
			?>
		
		<a href="/">Back to article list</a>
		
    </body>
</html>