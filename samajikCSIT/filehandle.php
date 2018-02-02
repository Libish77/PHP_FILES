<?php
/*
r = read mode
w = write mode
a = append mode
*/

$myFile  = fopen('samajik.txt','w')or die("Unable to open file");

$txt = " Hello CSIT Students";

fwrite($myFile,$txt);

fclose($myFile);

?>