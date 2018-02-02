<?php
/**
 * Created by PhpStorm.
 * User: KIST
 * Date: 1/8/2018
 * Time: 12:38 PM
 */
$a=array(1,2,3,4,5,6,7);
$i=0;
$as=count($a);
do
{
    echo "Value of I is: ".$a[$i]."<br>";
    $i++;
}
while($i<7);
echo "<br>Total no is: ".$as."<br>";
?>