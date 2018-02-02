<?php
/*
PHP Functions: PHP funtions are same as the the functions in other programming languages. 

Simply Function Can be divided into two parts:
1.Defining Part (Where Function's Functionality is Defined)
2.Calling Part (Where Function is called to do some task)

Boardly Functions can be categorized into two types:
1.Built-in Functions (Functions Provied by language itself for some specified task)
2.User-defined Function (Function that a developer define for some task that is not defined by programming language itself)

In PHP we can simply use keyword "function" to define the function. 
*/
date_default_timezone_set('Asia/Kathmandu');

function addNumber($num1, $num2) // Function Definig Part
{
	echo "SUM of given Number is:".($num1+$num2)."<br>";
}

addNumber(5,5); //Calling Part we can call a=y function multiple time
addNumber(10,5);
addNumber(4,5);
addNumber(9,5);


/*User-Defined Function With Built-in function*/

function displayTodaysDate()
{
	echo "<h1>Today is: ".date('Y-M-D')."</h1><br><h2> Current time:".date('H:i:s')."</h2>";
}


displayTodaysDate();