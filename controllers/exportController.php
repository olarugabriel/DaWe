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
			
			
		}
		catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function downloadxml()
	{ echo $_POST['name'];
		// $database=$this->_model->exportxml('user');
		$this->_model->exportxml($_POST['name']);
	}
	public function downloadcsv()
	{
		// $database=$this->_model->exportcsv('user');
		$this->_model->exportcsv($_POST['table']);
		//  echo "your table: "; 
		// echo $_POST['table'];
		// echo"was successfully exported in CSV!";
	
	}
	// public function downloadxls()
	// {
	// 	$database=$this->_model->exportxls('user');
	// }
}