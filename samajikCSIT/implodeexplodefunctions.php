<?php
/*Explode Functions:
	Converts String to Array based on specified delimeter
*/

	$name = "Nutan,Nabin,Anjan,Sudip,Amir,Sunil";

	//echo $name;
	$nameArray = explode(',', $name);

	print_r($nameArray);
/*Implode Functions:
  Converts Array To String based on glue provided
 */	

  $string = implode('|', $nameArray);

echo $string;
