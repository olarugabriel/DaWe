<?php
class SqlController extends Controller 
{
	public function __construct($model, $action)
	{
		parent::__construct($model, $action);
		$this->_setModel($model);
	}
	public function index()
	{
		try {
			
			$this->_view->set('title', 'SQL');
			
			return $this->_view->output();
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function run()
	{ echo "your query: "; 
		echo $_POST['sql'];
		echo"was successfully executed!";
	$this->_model->run($_POST['sql']);

	}

}