<?php

class AdministratorController extends Controller
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
        if (!isset($_POST['administratorFormSubmit']))
		{
			header('Location: /administrator/index');
		}
		
		$errors = array();
		$check = true;
			
		$name = isset($_POST['name']) ? trim($_POST['name']) : NULL;
		$password = isset($_POST['password']) ? trim($_POST['password']) : "";
		$password1 = isset($_POST['password1']) ? trim($_POST['password1']) : "";
		$password2 = isset($_POST['password2']) ? trim($_POST['password2']) : "";
			
			
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

		if (empty($password1))
		{
			$check = false;
			array_push($errors, "Introduceti parola!");
		}

		if (empty($password2))
		{
			$check = false;
			array_push($errors, "Introduceti parola serverului!");
		}

		if (strcmp($password, $password1)!=0)
		{
			$check=false;
			array_push($errors, "Parolele nu coincid!");

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
					
			$contact = new AdministratorModel();
			$contact->setName($name);
			$contact->setPassword($password);
			$contact->setPasswordAdministrator($password2);
			$ok=$contact->verifPassword();
			if($ok)
			{
				$var=$contact->store();
				if($var)
				{	
					$var1=$contact->getinfoUser();

					session_start();
				
					if(!isset($_SESSION['id']))
					{
						$_SESSION['id']=$var1['id'];
						$_SESSION['name']=$var1['name'];
					}

					$this->_setView('success');
					$this->_view->set('title', 'Store success!');
					header('Location: /login/index');
							
					$data = array(
						'name' => $name,
						'password' => $password,
						'password1'=>$password1
					);
							
					$this->_view->set('userData', $data);

				}
					else
					{

			            $this->_setView('index');
			            $this->_view->set('title', 'User/Parola sunt gresite!');
						return $this->_view->output();
					
					}	
					
			}	
			else
			{	
				array_push($errors, "Parola serverului este gresita!");
				 $this->_setView('index');
	            $this->_view->set('title', 'Invalid form data!');
				$this->_view->set('errors', $errors);
				$this->_view->set('formData', $_POST);
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