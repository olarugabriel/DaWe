<?php

class UtilizatoriModel extends Model
{
	public function getinfoUser()
	{	
			$sql="SELECT name,id from USER";
			$this->_setSql($sql);
			$table = $this->getAll();
			return $table;
		
	}

	public function getAllBD($id)
	{	
		
			$sql=" SELECT * from database ";
			$data=array($id);
			$this->_setSql($sql);
			$table = $this->getAll($data);
			return $table;	
	}

	public function index()
	{
		try {
			
			$this->_view->set('title', 'Utilizatori');
			$infoUser=$this->_model->getinfoUser();
			$this->_view->set('infoUser',$infoUser);
			return $this->_view->output();
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function getDatabaseName($id)
	{
		$sql="SELECT * from databaseuser where ID=".$id;
		$this->_setSql($sql);
		$infoDatabase=$this->getRow(array($id));
		return $infoDatabase;
	}
	public function dropDatabase($name)
	{
		echo $name;
		$id=$this->getDatabaseId($name);
		$sql="SELECT * FROM databasetablejoin where ID_DATABASE=".$id['ID'];
		$this->_setSql($sql);	
		$table=$this->getAll();
		foreach ($table as $key => $value) {
			 $name2=$this->getTableId($value['ID_TABLE']);
			 $this->dropTable($name2['NAME']);
		}
		$sql="DELETE FROM databaseuser WHERE NAME='".$name."'";
		$this->_setSql($sql);	
		$table=$this->executeSQL();
		
		$sql="DELETE FROM databaseuserjoin WHERE ID_DATABASE=".$id['ID'];
		$this->_setSql($sql);	
		$table=$this->executeSQL();
		
		
	}
	public function delete($id)
	{
		$sql="SELECT ID_DATABASE FROM databaseuserjoin where ID_USER=".$id;
		$this->_setSql($sql);	
		$table=$this->getAll();
	
		foreach ($table as $key => $value) {
			$name=$this->getDatabaseName($value['ID_DATABASE']);
			$this->dropDatabase($name['NAME']);
		}
		$sql="DELETE FROM USER WHERE ID=".$id;
		$this->_setSql($sql);	
		$this->executeSQL();

	}


}