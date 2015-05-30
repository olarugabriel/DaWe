<?php

class InregistrareModel extends Model
{
	private $_name;
	private $_password;
	private $_password1;
	
	public function setName($name)
	{
		$this->_name = $name;
	}



	public function setPassword($password)
	{
		$this->_password = md5($password);
	}
	
	public function NameExist($name)
	{
		$sql=" SELECT name from USER WHERE name=?";
		$data=array($this->_name);
		$this->_setSql($sql);
		$table = $this->getRow($data);
		if (empty($table))
		{
			return false;
		}
		
		return true;

	}


	public function store()
	{
		$sql = "INSERT INTO USER(name,password,type) VALUES(?,?,1)";
		$data=array($this->_name,$this->_password);
		$this->_setSql($sql);
		$query = $this->executeSQL($data);

		if ($query)
		{
			return true;
		}
		
		return false;
	}
}