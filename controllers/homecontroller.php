<?php
class HomeController extends Controller 
{
	public function __construct($model, $action)
	{
		parent::__construct($model, $action);
		$this->_setModel($model);
	}
	public function index()
	{
		try {
			
			$database=$this->_model->getDatabase($_SESSION['id']);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Home');
			
			return $this->_view->output();
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function add()
	{
		 $this->_setView('add');
        $database=$this->_model->getDatabase($_SESSION['id']);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Home');
			return $this->_view->output();
	}
	public function save()
	{
		 if (!isset($_POST['addFormSubmit']))
		{
			header('Location:/home/index');
		}
		
		$errors = array();
		$check = true;
			
		$name = isset($_POST['name']) ? trim($_POST['name']) : NULL;
		
		if (empty($name))
		{
			$check = false;
			array_push($errors, "Name is required!");
		}
			
        if (!$check)
		{
			 $this->_setView('add');
        	$database=$this->_model->getDatabase($_SESSION['id']);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Home');
			 $this->_view->set('title', 'Invalid form data!');
			$this->_view->set('errors', $errors);
			$this->_view->set('formData', $_POST);
			return $this->_view->output();
		}
		try {
			$this->_setView('index');
       		$ok=$this->_model->saveDB($name);
       		$database=$this->_model->getDatabase($_SESSION['id']);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Home');
			
			return $this->_view->output();
			
		}catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	
	public function logout()
	{
		session_destroy(); //destroy the session
		header('Location:/login/index'); //to redirect back to "index.php" after logging out
	}
	public function json()
	{
		try {
			$json = file_get_contents('results.json');
			$data = json_decode($json,true);
				$this->_view->set('data', $data);
				$error="Nu exista istoric";
			$database=$this->_model->getDatabase($_SESSION['id']);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Home');
			
			return $this->_view->output();
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
}