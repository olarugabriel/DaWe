<?php

class ExportModel extends Model
{
	 var $separator = ',';
        var $line_break = "\n";
    var $field_names = true;
    var $dbhost = '';   // mysql database server
    var $dbuser = '';   // database username
    var $dbpass = '';   // database password
    var $dbname = '';   // database name
    var $data = '';
    var $error = '';
    var $result = false;
    var $temp_path = '';

	 public function exportxml($name)
	{
		$filename = "Sample_".date("Y-m-d-h-i-s-A");
		$tables = array($name);
		
	    

	header('Content-type: text/xml');
	header('Content-Disposition: attachment; filename="'.$filename.'.xml"');

	$text ='<?xml version="1.0" encoding="iso-8859-1"?-->';

	foreach($tables as $table){
		$sql = "SELECT * FROM  `$table`";
		$this->_setSql($sql);
		$result=$this->getAll();
	    $text .='
	    <table_'.$table.'>';
	    $i=0;
	     foreach($result as $key1=> $val2)
	     {
	     	if($i%2==0)
	     	{
	        $text .=  "
	        <$table>";

	            foreach($val2 as $key=> $val)

	            { 
	                if (!preg_match('#^d+$#', $key, $match)){
	                    $text .=  "
	                    <$key>$val</$key>";
	                }
	            }
	        $text .= "
	        </$table>";
	    }
	    $i++;
	    }

	    $text .= "
	    ";
	}
	    $text .= "
	";
	// $text .="
	// </$db_name>";
	$text .= "
	";
	echo $text;                       


	}
	

// public function exportxls($table){

// $filename = "Export_".date("Y-m-d-h-i-s-A"); // File Name
// // Download file
// header('Content-Disposition: attachment; filename="'.$filename.'.xls"');
//  header("Content-Type: application/vnd.ms-excel");
//  // header("Content-Type: text/plain");
// $sql = "SELECT * FROM  `$table`";
// $this->_setSql($sql);
// $result=$this->getAll();

// // Write data to file
// $flag = false;
// $i=0;
// foreach ($result as $key => $value) {
// 	if($i%2==0)
// 	{
// 	  if (!$flag) {
//         // display field/column names as first row
//         echo implode("\t", array_keys($result)) . "\r\n";
//         $flag = true;
//     }
//     echo implode("\t", array_values($value)) . "\r\n";
// }
// $i++;
// }
// }//end exportxls



public function echocsv($fields)
{
    $separator = '';
    //pt a elimina campurile duplicat
    foreach ($fields as $field=>$val) {
    	
    	
	        if (preg_match('/\\r|\\n|,|"/', $val)) {
	            $val = '"' . str_replace('"', '""', $val) . '"';
	        }
	        echo $separator . $val;
	        $separator = ',';
	    
	    
    }
    echo "\r\n";
}

public function exportcsv($table)
{
$sql = "SELECT * FROM  `$table`";
$this->_setSql($sql);
$result=$this->getAll();

$filename = "Export_".date("Y-m-d-h-i-s-A");
header('Content-Type: text/csv');
header('Content-Disposition: attachment;filename="'.$filename.'.csv"');

foreach($result as $key1=> $val2)
	     {
	     	
	     	
	     		 $this->echocsv(array_keys($val2));   
				
	     	

	       $this->echocsv($val2);        
	    }





}// end exportcsv


}//end class