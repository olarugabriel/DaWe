<?php

class Db
{
	private static $db;
	
	public static function init()
	{
		if (!self::$db)
		{
			try {
				$dsn = 'mysql:host='.DB_HOST.';dbname='.DB_NAME;
				self::$db = new PDO($dsn, DB_USER, DB_PASS);
			} catch (PDOException $e) {
				die('Connection error: ' . $e->getMessage());
			}
		}
		return self::$db;
	}
}
