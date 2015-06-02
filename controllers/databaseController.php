<?php
class DatabaseController extends Controller 
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
			$infoDatabase=$this->_model->getDatabaseId($name);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Database');
			$this->_view->set('name', $name);
			$this->_view->set('infoDatabase', $infoDatabase);
			return $this->_view->output();
			
		}catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function drop($name)
	{
		$this->_model->dropDatabase($name);
		//header('Location:/database/index');
	}
	public function edit($name)
	{

		try {
			$database=$this->_model->getDatabase($_SESSION['id']);
			$infoDatabase=$this->_model->getDatabaseId($name);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Database');
			$this->_view->set('name', $name);
			$this->_view->set('infoDatabase', $infoDatabase);
			return $this->_view->output();
			
		}catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function add($namedb=null)
	{
		if (!isset($_POST['addFormSubmit']))
		{
			header('Location:/database/index');
		}
		
		$errors = array();
		$check = true;

		$name = isset($_POST['name']) ? trim($_POST['name']) : NULL;
		$nr = isset($_POST['nr']) ? trim($_POST['nr']) : NULL;
		if (empty($name))
		{
			$check = false;
			array_push($errors, "Name is required!");
		}

		if (empty($nr))
		{
			$check = false;
			array_push($errors, "Number of rows is required!");
		}
		else
		{
			if(!is_numeric($nr))
			{
				if(!is_integer($nr))
				{
					$check = false;
					array_push($errors, "Number of rows is not a number!");
				}
			}
		}
		
		if (!$check)
		{
			$this->_setView('index');
			$database=$this->_model->getDatabase($_SESSION['id']);
			$infoDatabase=$this->_model->getDatabaseId($namedb);
			$this->_view->set('name', $name);
			$this->_view->set('infoDatabase', $infoDatabase);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Invalid form data!');
			$this->_view->set('errors', $errors);
			$this->_view->set('formData', $_POST);
			return $this->_view->output();
		}
		try {
			$this->_setView('add');
			$database=$this->_model->getDatabase($_SESSION['id']);
			$infoDatabase=$this->_model->getDatabaseId($namedb);
			$this->_view->set('name', $name);
			$this->_view->set('infoDatabase', $infoDatabase);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Add table!');
			$this->_view->set('namedb',$namedb);
			$this->_view->set('nr',$nr);
			return $this->_view->output();
			
		}catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}

	public function createTable($namedb=null)
	{
		if(isset($_POST['cencelTableSubmit']))
		{
			header('Location:/database/index/'.$namedb);
		}
		if (!isset($_POST['createTableSubmit']))
		{
			header('Location:/database/index');
		}
		$name=null;
		$type=null;
		$field_type=null;
		$field_type_index=null;
		$checknull=null;
		$value=null;
		$errors = array();
		$check = true;
		$nr = isset($_POST['nr']) ? trim($_POST['nr']) : NULL;
		$nameTable=isset($_POST['nameTable']) ? trim($_POST['nameTable']) : NULL;
		for($i=1;$i<=$_POST['nr'];$i++)
		{	
			$name[$i] = isset($_POST['name'.$i]) ? trim($_POST['name'.$i]) : NULL;
			$field_type[$i]= isset($_POST['field_type'.$i]) ? trim($_POST['field_type'.$i]) : NULL;;
			$value[$i]= isset($_POST['value'.$i]) ? trim($_POST['value'.$i]) : 11;;
			$checkai[$i]=isset($_POST['checkai'.$i]) ? trim($_POST['checkai'.$i]) : NULL;
			$checknull[$i]=isset($_POST['checknull'.$i]) ? trim($_POST['checknull'.$i]) : NULL;
			$field_type_index[$i]= isset($_POST['field_type_index'.$i]) ? trim($_POST['field_type_index'.$i]) : NULL;;
			
			if (empty($name[$i]))
			{
				$check = false;
				array_push($errors, "Name is required!");
			}
			if(!empty($value[$i]))
			{
				if(!is_numeric($value[$i]))
				{
					if(!is_integer($value[$i]))
					{
						$check = false;
						array_push($errors, "Value line ".$i." is not a number!");
					}
				}
			}
		}
		
		if (!$check)
		{
			$this->_setView('add');
			$database=$this->_model->getDatabase($_SESSION['id']);
			$infoDatabase=$this->_model->getDatabaseId($namedb);
			$this->_view->set('name', $namedb);
			$this->_view->set('infoDatabase', $infoDatabase);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Invalid form data!');
			$this->_view->set('errors', $errors);
			$this->_view->set('formData', $_POST);
			$this->_view->set('nr',$nr);
			return $this->_view->output();
		}
		try {
			$this->_setView('index');
			$database=$this->_model->getDatabase($_SESSION['id']);   
			$infoDatabase=$this->_model->getDatabaseId($namedb);
			$this->_view->set('name', $namedb);
			$this->_view->set('infoDatabase', $infoDatabase);
			$this->_view->set('title', 'Database!');
			$this->_view->set('info', $database);
			$tableSucces=$this->_model->createTable($nr,$nameTable,$name,$type,$field_type,$value,$checknull,$field_type_index,$checkai,$infoDatabase['ID']);


			if($tableSucces)
				return $this->_view->output();
			else
			{
				$ero=$this->_model->getErrors();
				$this->_setView('add');
				$database=$this->_model->getDatabase($_SESSION['id']);
				$infoDatabase=$this->_model->getDatabaseId($namedb);
				$this->_view->set('name', $namedb);
				$this->_view->set('infoDatabase', $infoDatabase);
				$this->_view->set('info', $database);
				$this->_view->set('title', 'Invalid form data!');
				$this->_view->set('errors', $ero);
				$this->_view->set('formData', $_POST);
				$this->_view->set('nr',$nr);
				return $this->_view->output();
			}

			
		}catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function changeNameDB()
	{
		$check=true;
		$errors = array();
		if (!isset($_POST['changeNameDb']))
		{
			header('Location:/database/index');
		}
		$nameDB=isset($_POST['nameDB']) ? trim($_POST['nameDB']) : NULL;
		$old=isset($_POST['oldName']) ? trim($_POST['oldName']) : NULL;
		if (empty($nameDB))
		{
			$check = false;
			array_push($errors, "Name is required!");
		}
		if (!$check)
		{
			$this->_setView('edit');
			$database=$this->_model->getDatabase($_SESSION['id']);
			$infoDatabase=$this->_model->getDatabaseId($nameDB);
			$this->_view->set('name', $nameDB);
			$this->_view->set('infoDatabase', $infoDatabase);
			$this->_view->set('info', $database);
			$this->_view->set('title', 'Invalid form data!');
			$this->_view->set('errors', $errors);
			$this->_view->set('formData', $_POST);
			return $this->_view->output();
		}
		try {
				$this->_model->changeNameDB($nameDB,$old);
				header('Location:/database/index');

		}catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}

	}
}