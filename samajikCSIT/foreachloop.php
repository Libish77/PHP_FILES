<?php
/*Foreach Loop : Special Type of Loop For Working with an array*/

$college= array(
	'Nutan'=>'Samajik College',
	'Nabin'=>'Ambition College',
	'Sudip'=>'KIST College',
	'Ranjan'=>'Samridhi College',
	'Bibek'=>'Premier College',
	'Amir'=>'Pentagon College'
	);
?>
<table border="1" width="400px" height="400px">
	<tr>
		<th>S.No.</th>
		<th>Students Name</th>
		<th>College Name</th>
	</tr>
	
<?php
$sn = 1;
foreach ($college as $key => $info) 
{
	echo "<tr>
		  <td>".$sn."</td>
		  <td>".$key."</td>
		  <td>".$info."</td></tr>";
		  $sn++;
}
?>

</table>