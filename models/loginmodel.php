<?php

class LoginModel extends Model
{
	private $_name;
	private $_password;
	
	public function setName($name)
	{
		$this->_name = $name;
	}
	
	public function setPassword($password)
	{
		$this->_password = md5($password);
	}
	
	public function store()
	{
		$sql = "SELECT * FROM USER WHERE NAME=? and PASSWORD=?";
		$data=array($this->_name,$this->_password);
		$this->_setSql($sql);
		$table = $this->getRow($data);
		if (empty($table))
		{
			return false;
		}
		
		return $table;
	}
}