<?php

class NewsController extends Controller
{
	public function __construct($model, $action)
	{
		parent::__construct($model, $action);
		$this->_setModel($model);
	}
	
	public function index()
	{
		try {
			
			$articles = $this->_model->getNews();
			$this->_view->set('articles', $articles);
			$this->_view->set('title', 'News articles from database');
			
			return $this->_view->output();
			
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	
	public function details($articleId)
	{
		try {
			
			$article = $this->_model->getArticleById((int)$articleId);
			
			if ($article)
			{
				$this->_view->set('title', $article['title']);
				$this->_view->set('articleBody', $article['article']);
				$this->_view->set('datePublished', $article['date']);
			}
			else 
			{
				$this->_view->set('title', 'Invalid article ID');
				$this->_view->set('noArticle', true);
			}
			
			return $this->_view->output();
			 
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	public function test()
	{
		try {

				$this->_view->set('title', 'test');
				$this->_view->set('articleBody', 'lala');
				$this->_view->set('datePublished','maine');
				return $this->_view->output();
			 
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	// public function downloadCsv(){

	// 	$count = 0;
	// 	$header = "";
	// 	$data = "";
	// 	//query
	// 	$result = $this->con->query("SELECT * FROM articles");
	// 	//count fields
	// 	$count = $result->field_count;
	// 	//columns names
	// 	$names = $result->fetch_fields();
	// 	//put column names into header
	// 	foreach($names as $value) {
	// 	    $header .= $value->name.";";
	// 	    }

	// 	//put rows from your query
	// 	while($row = $result->fetch_row())  {
	// 	    $line = '';
	// 	    foreach($row as $value)       {
	// 	        if(!isset($value) || $value == "")  {
	// 	            $value = ";"; //in this case, ";" separates columns
	// 	    } else {
	// 	            $value = str_replace('"', '""', $value);
	// 	            $value = '"' . $value . '"' . ";"; //if you change the separator before, change this ";" too
	// 	        }
	// 	        $line .= $value;
	// 	    } //end foreach
	// 	    $data .= trim($line)."\n";
	// 	} //end while
	// 	//avoiding problems with data that includes "\r"
	// 	$data = str_replace("\r", "", $data);
	// 	//if empty query
	// 	if ($data == "") {
	// 	    $data = "\nno matching records found\n";
	// 	}
	// 	$count = $result->field_count;

	// 	//Download csv file
	// 	header("Content-type: application/octet-stream");
	// 	header("Content-Disposition: attachment; filename=ExportCSV.csv");
	// 	header("Pragma: no-cache");
	// 	header("Expires: 0");
	// 	echo $header."\n".$data."\n";

	// 	}
	
}