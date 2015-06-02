<?php

class HomeModel extends Model
{
	public function saveDB($name)
	{
		$sql="CREATE DATABASE ".$name;
		$this->_setSQL($sql);
		$sql="INSERT INTO DATABASEUSER VALUES(?,?)";
		$this->_setSql($sql);
		if($this->executeSQL(array(NULL,$name)))
		{
			$id=$this->getDatabaseId($name);
			$this->insertDBUserJoin($id['ID'],1);
			return true;
		}
		return false;
	}

	public function insertDBUserJoin($idDB,$idUser)
	{
		$sql="INSERT INTO databaseuserjoin VALUES(?,?,?)";
		$this->_setSql($sql);	
		$ok=$this->executeSQL(array(NULL,$idDB,$idUser));
	}
}