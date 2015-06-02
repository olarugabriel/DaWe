<?php

class DatabaseModel extends Model
{
	
	public function createTable($nr,$nameTable,$name,$type,$field_type,$value,$checknull,$field_type_index,$checkai,$idDatabase)
	{
			$sql="CREATE TABLE ".$nameTable." (";
				for($i=1;$i<=$nr;$i++)
				{
					if($i==$nr)
					{
						$sql.=$name[$i]." ".$field_type[$i]." (".$value[$i].") ".$checkai[$i]." ".$field_type_index[$i]." ".$checknull[$i];
					}
					else
					{
						$sql.=$name[$i]." ".$field_type[$i]." (".$value[$i].") ".$checkai[$i]." ".$field_type_index[$i]." ".$checknull[$i].",";
					}
				}

				$sql.=")";
		$this->_setSql($sql);	
		if($this->executeSQL())
		{
			$this->InsertTableUser($nameTable);
			$id=$this->getTableID($nameTable);
			$this->insertJoinDBTB($idDatabase,$id['ID']);
			return true;
		}
		return false;
	}
	public function insertJoinDBTB($idDb,$idT)
	{
		$sql="INSERT INTO databasetablejoin VALUES(?,?,?)";
		$this->_setSql($sql);	
		$ok=$this->executeSQL(array(NULL,$idDb,$idT));
	}
	public function InsertTableUser($name)
	{
		$sql="INSERT INTO TABLEUSER VALUES(?,?)";
		$this->_setSql($sql);
		$ok=$this->executeSQL(array(NULL,$name));
	}
	
	public function dropDatabase($name)
	{
		$id=$this->getDatabaseId($name);
		$sql="SELECT * FROM databasetablejoin where ID_DATABASE=".$id['ID'];
		$this->_setSql($sql);	
		$table=$this->getAll();
		foreach ($table as $key => $value) {
			 $name=$this->getTableId($value['ID_TABLE']);
			 $this->dropTable($name['NAME']);
		}
		echo  $name;
		$sql="DELETE FROM databaseuser WHERE NAME='".$name."'";
		$this->_setSql($sql);	
		$table=$this->executeSQL();
		
		$sql="DELETE FROM databaseuserjoin WHERE ID_DATABASE=".$id['ID'];
		$this->_setSql($sql);	
		$table=$this->executeSQL();
		
		
	}


}