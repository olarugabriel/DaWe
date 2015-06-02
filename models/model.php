<?php

class Model 
{
	protected $_db;
	protected $_sql;
	protected $_errors;
	
	public function __construct()
	{
		$this->_db = Db::init();
	}
	
	protected function _setSql($sql)
	{
		$this->_sql = $sql;
	}
	public function getErrors()
	{
		return $this->_errors;
	}
	public function getAll($data = null)
	{
		if (!$this->_sql)
		{
			throw new Exception("No SQL query!");
		}
		
		$sth = $this->_db->prepare($this->_sql);
		$sth->execute($data);
		return $sth->fetchAll(PDO::FETCH_ASSOC);
	}
	
	public function getRow($data = null)
	{
		if (!$this->_sql)
		{
			throw new Exception("No SQL query!");
		}
		
		$sth = $this->_db->prepare($this->_sql);
		$sth->execute($data);
		return $sth->fetch(PDO::FETCH_ASSOC);
	}
	public function getDatabase($id_user)
	{
		$sql = "SELECT b.NAME, b.id FROM DATABASEUSERJOIN 
		AS a INNER JOIN databaseuser as b 
		ON a.id_database=b.id where 
		a.id_user= ?";
		
		$this->_setSql($sql);
		$database = $this->getAll(array($id_user));
		
		if (empty($database))
		{
			return false;
		}
		foreach ($database as $data) {
			$array[$data['NAME']]=$this->getTable($data['id']);
		}
		return $array;
	}
	public function getTable($id_table)
	{
		$sql = "SELECT b.name, b.id FROM
		 (SELECT * FROM DATABASETABLEJOIN WHERE ID_DATABASE=?) AS a 
		 INNER JOIN  tableuser as b on a.id_table=b.id";
		
		$this->_setSql($sql);
		$table = $this->getAll(array($id_table));
		
		if (empty($table))
		{
			return false;
		}
		
		return $table;
	}
	public function executeSQL($data= null)
	{

		if (!$this->_sql)
		{
			throw new Exception("No SQL query!");
		}
		$sth = $this->_db->prepare($this->_sql);
		if($sth->errorCode()!=0)
		{
			echo $this->_db->errorInfo();
		}
		if($sth->execute($data))
			return true;
		else
		{
			$this->_errors=$sth->errorInfo();
			return false;
		}
		
	}
	public function getDatabaseId($databaseName)
	{
		$sql="SELECT * from databaseuser where NAME=?";
		$this->_setSql($sql);
		$infoDatabase=$this->getRow(array($databaseName));
		return $infoDatabase;
	}
	public function getTableId($nameTable)
	{
		$sql="SELECT * from tableuser where NAME=? OR ID=?";
		$this->_setSql($sql);
		$infoDatabase=$this->getRow(array($nameTable,$nameTable));
		return $infoDatabase;
	}
	public function dropTable($nameTable)
	{
		$id=$this->getTableId($nameTable);
		$sql="DROP TABLE ".$nameTable;
		$this->_setSql($sql);	
		$table=$this->executeSQL();
		$sql="DELETE FROM databasetablejoin where ID_TABLE=".$id['ID'];
		$this->_setSql($sql);	
		$table=$this->executeSQL();
		$sql="DELETE FROM tableuser where NAME='".$nameTable."'";
		$this->_setSql($sql);	
		$table=$this->executeSQL();

	}
	
}