<?php
/*Used to execute  a block of code multiple times until the condition is meet
 Can be Classified into two categories: i.e:
 1. Entry Control Loop(If Condition is checked before entering the loop)
 2. Exit Control Loop(If condition is checked after execution of the loop, Loopis executed once although the condition is false)
Further more there are 4 types of loops:
1.For Loop
*/

for ($i=0; $i <10 ; $i++) 
{ 
	//echo "Value of I:".$i."<br>";
}

/*Printing an array elements using for loop*/

$number = array(10,11,12,13,14,15,16,17,18,19,20);

/*For counting the elements in an array*/
$length = count($number);
for ($i=0; $i <$length ; $i++) 
{ 
  echo 	"Element key ".$i." And Value :".$number[$i]."<br>";
}

echo "There are ".$length. " element(s) in Number array";