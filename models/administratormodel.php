<?php


class AdministratorModel extends Model
{
	private $_name;
	private $_password;
	private $_passordadministrator;
	public function setName($name)
	{
		$this->_name = $name;
	}

	public function setPassword($password)
	{
		$this->_password = md5($password);
	}
	public function setPasswordAdministrator($password)
	{
		$this->_passordadministrator = md5($password);
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

	public function getinfoUser()
	{	
		
			$sql=" SELECT id,name from USER WHERE name=?";
			$data=array($this->_name);
			$this->_setSql($sql);
			$table = $this->getRow($data);
			return $table;
		
	}

	public function verifPassword()
	{
		$sql="SELECT password from passwordadmin WHERE password=?";
		$data=array($this->_passordadministrator);
			$this->_setSql($sql);
			$table = $this->getRow($data);
			if (empty($table))
			{
				return false;
			}
			
			return true;
	}
}