<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title><?php echo $title; ?></title>
    </head>
    <body>
	
		<?php include HOME . DS .  'includes' . DS . 'menu.inc.php'; ?>
		
		<h1><?php echo $title; ?></h1>
		<h2>Data stored:</h2>
		
		<?php if (!empty(($userData['name']) && ($userData['password']) && ($userData['password1']))): ?>
			<p><?php echo $userData['name'].' ,te-ai inregistrat cu succes!'; ?></p>
		<?php endif;?>
		
		
		
    </body>
</html>