<?php

class TestModel extends Model
{
	private $_id;
	public function getName()
	{
		$sql = "SELECT * FROM test";
		
		$this->_setSql($sql);
		$articles = $this->getAll();
		
		if (empty($articles))
		{
			return false;
		}
		
		return $articles;
	}
	public function delete($id)
	{
		$sql = "delete from test where id=1";
		$sth = $this->_db->prepare($sql);
		return $sth->execute();
	}
		public function update()
	{
		$this->_id="Maria";
		$sql = "UPDATE test set 
					nume=? WHERE id=1";
		$data = array(
			$this->_id
		);
		$sth = $this->_db->prepare($sql);
		return $sth->execute($data);
	}
	
}