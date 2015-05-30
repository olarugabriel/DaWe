<?php

class HomeModel extends Model
{
	public function getDatabase($id)
	{
		$sql = "SELECT b.NAME, b.id FROM DATABASEUSERJOIN 
		AS a INNER JOIN databaseuser as b 
		ON a.id_database=b.id where 
		a.id_user= ?";
		
		$this->_setSql($sql);
		$database = $this->getAll(array($id));
		
		if (empty($database))
		{
			return false;
		}
		$i=0;
		foreach ($database as $data) {
			$array[$data['NAME']]=$this->getTable($data['id']);
		}
		return $array;
	}
	public function getTable($id_table)
	{
		$sql = "SELECT b.name FROM
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
}