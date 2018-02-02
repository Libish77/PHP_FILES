<?php

$students = array('
	Nutan'=>array(
		'Address'=>"Sallaghari",
		'Contact'=>"9823123456",
		'Semester'=>"3rd",
		'College'=>"Samajik",
		'Email'=>"nutan@gmail.com"
	),

	'Nabin'=>array(
		'Address'=>"Koteshwor",
		'Contact'=>"9823167456",
		'Semester'=>"3rd",
		'College'=>"Samajik",
		'Email'=>"nabin@gmail.com"
	),

	'Sudip'=>array(
		'Address'=>"Melamchi",
		'Contact'=>"9823167455",
		'Semester'=>"3rd",
		'College'=>"Samajik",
		'Email'=>"sudip@gmail.com"
	),

		'Ranjan'=>array(
		'Address'=>"Nagarakot",
		'Contact'=>"9823199455",
		'Semester'=>"3rd",
		'College'=>"Samajik",
		'Email'=>"ranjan@gmail.com"
	),

	
		'Bibek'=>array(
		'Address'=>"Surybinayak",
		'Contact'=>"9823167400",
		'Semester'=>"3rd",
		'College'=>"Samajik",
		'Email'=>"bibek@gmail.com"
	),	

		'Reshab'=>array(
		'Address'=>"Lokanthali",
		'Contact'=>"9823167905",
		'Semester'=>"3rd",
		'College'=>"Samajik",
		'Email'=>"reshab@gmail.com"
	)	

);

/*Prinitinf in Tabular Form Using Nested Foreach*/
?>


<?php
	
	
   foreach ($students as $key => $value) 
   {

   		echo "<h1>".$key."</h1>";
 foreach ($value as $key1 => $info) 
 			{
    		 echo	$key1. " is ". $info."<br>";
    		}  

    		echo "<hr>"; 		

   	}
   
?>   

</table>