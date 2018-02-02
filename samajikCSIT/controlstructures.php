<?php
/*
Control Structure OR Decision Making in Programming:

The process of controlling the flow of program execution based upon the 
certain condition is known as control structure.

For example : If something is true execute some block and if something is flase then execute some block of the code.

So the process of taking the decision based upon some decision parameter 
is known as decision making/Control Structure.
In Php we can use:
1.If Else
2.If Elseif Else
3.Switch

*/
$num = 5;
if($num==5)
{
	echo "The Number is Exactly Five";
}

else
{
	echo "The Number is not Five";
}



/*If Elseif Else*/


$abc = 7;
if($abc==5)
{
	echo "The Number is Exactly Five";	
}
elseif ($abc==6) 
{
	echo "The Number is Exactly Six";
}

elseif ($abc==7) 
{
	echo "The Number is Exactly Seven";
}

else
{
	echo "The Number is Neither Five Nor Six";
}