
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="refresh" content="1;url=/home/index" />

    <link href="/views/login/css/main.css" type="text/css" rel="stylesheet"/>
    <title>DaWe</title>
</head>
<body>
	<section id="mesaj"	>
		<?php if (!empty(($userData['name']) && ($userData['password']))): ?>
			<p><?php echo $userData['name'].' ,te-ai logat cu succes!'; ?></p>
		<?php endif;?>
	</section>	
    </body>
</html>