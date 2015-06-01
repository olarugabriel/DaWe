<?php

class SqlModel extends Model
{
	public function run($sql1)
	{

$this->_setSql($sql1);
$query = $this->executeSQL();

	}
}