<?php
/*Functions Returning Value
 return keyword returns the value from functionto calling part.
 value can be either simple value, array or an object.
*/

 function getFullName($fName,$lName)
 {
 	return "Your Full Name is:".$fName." ".$lName."<br>";
 }


 echo getFullName('Nutan','Dahal');

/*Holds the returning value*/
 $fullName = getFullName('Nabin','Lav');

 echo $fullName;

 /*Functions with default parameter Value*/

 function sayHelloCSIT($msg=null)
 {
 	echo $msg;
 }


 /*Call With no Value*/
sayHelloCSIT();
//sayHelloCSIT('Hello CSIT Students');

/*Dynamic Function Call*/

function sayHi()
{
	echo 'Hi All';
}
$say = "sayHi";

 $say();
