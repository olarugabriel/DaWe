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
	public function getinfoRowTable($nameTable,$lineNumber)
	{
		$sql="SELECT * FROM ".$nameTable." LIMIT 1 OFFSET ".$lineNumber;
		$this->_setSql($sql);	
		$table=$this->getRow();
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
	public function change($post)
	{
		$i=1;
		$sql="UPDATE ".$post['table']." set ";
		foreach ($post as $key => $value) {
			$i++;
			if($i==$post['nr'])
			{
				$sql.=$key."='".$value."'";
				break;
			}
			else
			{
				$sql.=$key."='".$value."' ,";
			}
			
		}
		$sql.=" where ".$post['cheie']."='".$post['val']."'";
		$this->_setSql($sql);
		$this->executeSQL();
		header('Location:/table/index/'.$post['table']);
	}
	public function insert($post)
	{
		$i=1;
		$sql="insert into  ".$post['table']." VALUES (";
		foreach ($post as $key => $value) {
			$i++;
			if($i==$post['nr'])
			{
				$sql.="'".$value."'";
				break;
			}
			else
			{
				$sql.="'".$value."',";
			}
			
		}
		$sql.=" )";
		$this->_setSql($sql);
		$this->executeSQL();
	}
	
	
}