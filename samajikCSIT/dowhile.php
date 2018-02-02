<?php

/*Do While Loop*/
$number = array(10,11,12,13,14,15,16,17,18,19,20);
$i=0;
/*For counting the elements in an array*/
$length = count($number);
do
{
  echo 	"Element key ".$i." And Value :".$number[$i]."<br>";
	
	$i++; 
}
while ($i < $length); 