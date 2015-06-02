<?php
$controller = "Login";
$action = "index";
$query = null;
if (isset($_GET['load']))
{
	$params = array();
	$params = explode("/", $_GET['load']);

	$controller = ucwords($params[0]);
	
	if (isset($params[1]) && !empty($params[1]))
	{
		$action = $params[1];
	}
	
	if (isset($params[2]) && !empty($params[2]))
	{
		$query = $params[2];
	}
}
if(strcmp($controller,"Login")!=0 && strcmp($controller,"Inregistrare")!=0 && strcmp($controller,"Administrator")!=0)
{

	if(!isset($_SESSION['id']))
	{
		
		header('Location:/login/index');
	}
}
else{

	if(isset($_SESSION['id']))
		header('Location:/home');
}
$modelName = $controller;
$controller .= 'Controller';

$load = new $controller($modelName, $action);
if (method_exists($load, $action))
{
    $load->{$action}($query);
}
else 
{
	die('Invalid method. Please check the URL.');
}