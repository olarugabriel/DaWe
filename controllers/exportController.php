<?php
class ExportController extends Controller 
{
	public function __construct($model, $action)
	{
		parent::__construct($model, $action);
		$this->_setModel($model);
	}

    	public function index()
	{
		try
		{
			$this->_view->set('title','EXPORT');
			return $this->_view->output();
			// $database=$this->_model->export('user');
			
		}
		catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function downloadxml()
	{
		$database=$this->_model->exportxml('database');
	}
	public function downloadcsv()
	{
		$database=$this->_model->exportcsv('database');
	}
	// public function downloadxls()
	// {
	// 	$database=$this->_model->exportxls('user');
	// }
}