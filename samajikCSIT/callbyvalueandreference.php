<?php

function addFive($num) //Call By Value
{
	$num  += 5;

}

function addSix(&$num) //Call By reference
{
	$num += 6;
}

$originNum = 10;

addFive($originNum);

echo "The value of Original Number is: ".$originNum."<br>";

addSix($originNum);
echo "The value of Original Number is: ".$originNum;
