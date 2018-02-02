<?php

$myFile = fopen('samajik.txt','r')or die ("Unable to open file");

echo fgets($myFile);

fclose($myFile);

?>
