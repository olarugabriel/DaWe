<?php
define ('DS', DIRECTORY_SEPARATOR);
define ('HOME', dirname(__FILE__));


require_once HOME . DS . 'config.php';
require_once HOME . DS . 'utilities' . DS . 'session.php';
require_once HOME . DS . 'utilities' . DS . 'rooter.php';


function __autoload($class)
{	if (file_exists(HOME . DS . 'utilities' . DS . strtolower($class) . '.php'))
	{
		require_once HOME . DS . 'utilities' . DS . strtolower($class) . '.php';
	}
	else if (file_exists(HOME . DS . 'models' . DS . strtolower($class) . '.php'))
	{
		require_once HOME . DS . 'models' . DS . strtolower($class) . '.php';
	}
	else if (file_exists(HOME . DS . 'controllers' . DS . strtolower($class) . '.php'))
	{
		require_once HOME . DS . 'controllers'  . DS . strtolower($class) . '.php';
	}

}


?>