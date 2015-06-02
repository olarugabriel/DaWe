<?php
class TableController extends Controller 
{
	public function __construct($model, $action)
	{
		parent::__construct($model, $action);
		$this->_setModel($model);
	}
	public function index($name)
	{
		try {
			$database=$this->_model->getDatabase($_SESSION['id']);
			$info=$this->_model->getinfoTable($name);
				$info2=$this->_model->getTableColumn($name);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Table');
			$this->_view->set('infoTable',$info);
			$this->_view->set('infoTable2',$info2);
			$this->_view->set('nameTable',$name);
			return $this->_view->output();
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function edit($lineNumber)
	{
		$params = explode("-", $lineNumber);
		$lineNumber=$params[0];
		$nameTable=$params[1];
		try {
			$info=$this->_model->getinfoRowTable($nameTable,$lineNumber);
			$info2=null;
			$database=$this->_model->getDatabase($_SESSION['id']);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Table');
			$this->_view->set('table', $nameTable);
			$this->_view->set('lineNumber', $lineNumber);
			$this->_view->set('infoTable',$info);
			return $this->_view->output();
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function delete($lineNumber)
	{
		$params = explode("-", $lineNumber);
		$lineNumber=$params[0];
		$nameTable=$params[1];
		try {
			
			$info=$this->_model->getinfoTable($nameTable);
			$this->_model->deleteTable($lineNumber,$nameTable);
			$info2=null;
			if(empty($info))
			{
				$info2=$this->_model->getTableColumn($nameTable);
				
			}
			header('Location:/table/index/'.$nameTable);
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function drop($nameTable)
	{
		try {
			$this->_model->dropTable($nameTable);
			header('Location:/table/index/');
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function add($nameTable)
	{
		try {
			$info2=$this->_model->getTableColumn($nameTable);
			$database=$this->_model->getDatabase($_SESSION['id']);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Table');
			$this->_view->set('table', $nameTable);
			$this->_view->set('infoTable', $info2);
			return $this->_view->output();
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function change()
	{

		$this->_model->change($_POST);

	}
	public function insert()
	{
		$this->_model->insert($_POST);
		if(!empty($this->_model->getErrors()))
		{
			$this->_setView('errors');
            $this->_view->set('title', 'There was an error in sql!');
			$database=$this->_model->getDatabase($_SESSION['id']);
			$this->_view->set('info', $database);
			$this->_view->set('errors', $this->_model->getErrors());
			return $this->_view->output();
		}
		else
		{
			header('Location:/table/index/'.$_POST['table']);
		}
	}
}
