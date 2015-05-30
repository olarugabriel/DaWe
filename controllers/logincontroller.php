<?php

class LoginController extends Controller
{
		public function __construct($model, $action)
	{
		parent::__construct($model, $action);
		$this->_setModel($model);
	}
	public function index()
	{
		$this->_view->set('title', 'Simple site Contact Form');
		return $this->_view->output();
	}

    public function save()
    {
        if (!isset($_POST['loginFormSubmit']))
		{
			header('Location: /login/index');
		}
		
		$errors = array();
		$check = true;
			
		$name = isset($_POST['name']) ? trim($_POST['name']) : NULL;
		$password = isset($_POST['password']) ? trim($_POST['password']) : "";
			
			
		if (empty($name))
		{
			$check = false;
			array_push($errors, "Introduceti numele!");
		}

		if (empty($password))
		{
			$check = false;
			array_push($errors, "Introduceti parola!");
		}
        if (!$check)
		{
            $this->_setView('index');
            $this->_view->set('title', 'Invalid form data!');
			$this->_view->set('errors', $errors);
			$this->_view->set('formData', $_POST);
			return $this->_view->output();
		}
			
		try {
					
			$contact = new LoginModel();
			$contact->setName($name);
			$contact->setPassword($password);
			$var=$contact->store();
			if(!empty ($var))
			{
				
				$this->_setView('success');
				$this->_view->set('title', 'Store success!');
						
				$data = array(
					'name' => $name,
					'password' => $password
				);
						
				$this->_view->set('userData', $data);

			}
				else
				{

		            $this->_setView('index');
		            $this->_view->set('title', 'User/PArola sunt gresite!');
					return $this->_view->output();
				
				}	
				
		} catch (Exception $e) {
            $this->_setView('index');
            $this->_view->set('title', 'There was an error saving the data!');
            $this->_view->set('formData', $_POST);
			$this->_view->set('saveError', $e->getMessage());
		}
		return $this->_view->output();
    }
}