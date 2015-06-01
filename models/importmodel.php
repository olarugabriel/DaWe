<?php

class ImportModel extends Model
{
	public function importcsv(){

		if (@$_FILES['csv']['size'] > 0) { 

    //get the csv file 
    $file = $_FILES['csv']['tmp_name']; 
    $handle = fopen($file,"r"); 
     
    //loop through the csv file and insert into database 
   
    
    do { 
        if (@$data[0]) { 
        //	echo $data[1];
        $sql="INSERT INTO user (ID,NAME,PASSWORD,TYPE) VALUES (?,?,?,?)";            
        $data1=array($data[0],$data[1],$data[2],$data[3]);
		$this->_setSql($sql);
		$query = $this->executeSQL($data1);
                 
		
        } 
    } while ($data = fgetcsv($handle,1000,",","'")); 
    // 
//header('Location: success.php?success=1'); die; 


	}//end 
}
}//end class