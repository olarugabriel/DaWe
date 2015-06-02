<?php
class UtilizatoriController extends Controller 
{
	public function __construct($model, $action)
	{
		parent::__construct($model, $action);
		$this->_setModel($model);
	}

	public function index()
	{
		try {
			
			$this->_view->set('title', 'Utilizatori');
			$infoUser=$this->_model->getinfoUser();
			$this->_view->set('infoUser',$infoUser);
			return $this->_view->output();
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}



	public function delete($id)
	{
		$this->_model->delete($id);
		header('Location:/Utilizatori/index');
	}



}