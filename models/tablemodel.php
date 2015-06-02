<?php

class TableModel extends Model
{
	public function getinfoTable($name)
	{
		$sql="SELECT * FROM ".$name;
		$this->_setSql($sql);	
		$table=$this->getAll();
		return $table;

	}
	public function getTableColumn($name)
	{
		$sql="SELECT * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='".$name."'";
		$this->_setSql($sql);	
		$table=$this->getAll();
		return $table;

	}
	public function deleteRow($key,$value,$nameTable)
	{
		$sql="DELETE FROM ".$nameTable." WHERE ".$key." = ".$value;
		$this->_setSql($sql);	
		$table=$this->executeSQL();
	}
	public function deleteTable($lineNumber,$nameTable)
	{
		$sql="SELECT * FROM ".$nameTable." LIMIT 1 OFFSET ".$lineNumber;
		$this->_setSql($sql);	
		$table=$this->getRow();
		$key1=null;
		foreach ($table as $key => $value) {
			$key1=$key;
			break;
		}
		echo $key1;
		$this->deleteRow($key1,$table[$key1],$nameTable);
		
	}
	
	
}