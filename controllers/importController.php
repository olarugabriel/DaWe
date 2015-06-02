<?php
class ImportController extends Controller 
{
	public function __construct($model, $action)
	{
		parent::__construct($model, $action);
		$this->_setModel($model);
	}

	public function index()
	{
		try {
			
			$this->_view->set('title', 'Import');
			
			return $this->_view->output();
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}

	}

	public function importcsv()
	{	echo $_POST['table'];
		$this->_model->importcsv($_POST['table']);

		echo "<b>Your file has been imported.</b><br><br>";
		$link_address='/import/index';

		echo '<a href="'.$link_address.'">Back</a>';

	}
	public function importSuccess()
	{
	$this->_setView('success');
	$this->_view->set('title', 'Store success!');
	}
}

