<?php

class SqlModel extends Model
{
	public  function myprint_r($my_array) {
    if (is_array($my_array)) {
        echo "<table border=1 cellspacing=0 cellpadding=3 width=100%>";
        echo '<tr><td colspan=2 style="background-color:#333333;"><strong><font color=white>ARRAY</font></strong></td></tr>';
        $i=0;
        foreach ($my_array as $k => $v) {
        	        	
                echo '<tr><td valign="top" style="width:40px;background-color:#F0F0F0;">';
            
                echo '<strong>' . $k . "</strong></td><td>";
                $this->myprint_r($v);
                
                
            
                echo "</td></tr>";
            
        }
        echo "</table>";
        return;
    }
    echo $my_array;
}
	public function run($sql1)
	{

$this->_setSql($sql1);
$query = $this->executeSQL();
$result=$this->getAll();
$this->myprint_r($result);




// echo '<pre>';
// print_r($result);

// echo '</pre>';

	}
}