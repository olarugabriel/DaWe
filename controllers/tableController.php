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
			$info2=null;
			if(empty($info))
			{
				$info2=$this->_model->getTableColumn($name);
				
			}
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
	public function edit($lineNumber,$nameTable)
	{
		try {
			$database=$this->_model->getDatabase($_SESSION['id']);
			$info=$this->_model->getinfoTable($name);
			$info2=null;
			if(empty($info))
			{
				$info2=$this->_model->getTableColumn($name);
				
			}
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Table');
			$this->_view->set('infoTable',$info);
			$this->_view->set('infoTable2',$info2);
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
}
