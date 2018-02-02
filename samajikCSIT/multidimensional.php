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

<table border="1" cellspacing="0" cellpadding="5">
<tr>
	<th>S.No.</th>
	<th>Name</th>
	<th>Address</th>
	<th>Contact</th>
	<th>Semester</th>
	<th>College</th>
	<th>Email</th>
</tr>

<?php
	$sn =1; 
	//print_r($students);
	
   foreach ($students as $key => $value) 
   {
   		
?>
	<tr>
		<td><?php echo $sn; ?></td>
		<td><?php echo $key; ?></td>
		<td><?php echo $value['Address']; ?></td>
		<td><?php echo $value['Contact']; ?></td>
		<td><?php echo $value['Semester']; ?></td>
		<td><?php echo $value['College']; ?></td>
		<td><?php echo $value['Email']; ?></td>
	</tr>

<?php   		
   	$sn++;
   	
   	}
   
?>   

</table>