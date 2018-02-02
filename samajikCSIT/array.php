<?php
/*Three Type Of Arrays
 1.Numeric Array(Array With Numeric Index)
*/

 $array = array(1,2,3,4,5);

/*Function to print array as a whole*/
 print_r($array);


/*If You need to access individual value by array index*/
 echo " First Element of an array is :". $array[0]."<br>";

 echo " Second Element of an array is :". $array[1];


 /*2. Associative Array(Array With String as index)
	 Strong Association between key and value
 */

	 $salary = array("Ram"=>50000, "Shyam"=>25000, "Hari"=>40000, "Gopal"=>30000);

	 /*Here index remains as string so simply use string to access an array*/

	 print_r($salary); //Print whole data

	 /*To disply individual data*/

	 echo "Salary of Ram :". $salary['Ram']."<br>";
	 echo "Salary of Shyam :". $salary['Shyam']."<br>";
	 echo "Salary of Hari :". $salary['Hari']."<br>";
	 echo "Salary of Gopal :". $salary['Gopal']."<br>";



/*3.Multidimensional Array
	Each sub element can be an array as itself 
	mechanism of doing so in known as multidimensional array
*/

	$results = array(
		"Sunil"=>array(
			"C++"=>80,
			"Operating"=>60,
			"Computer"=>50
		),

		"Ranjan"=>array(
			"C++"=>40,
			"Operating"=>30,
			"Computer"=>30
		),

		"Nutan"=>array(
			"C++"=>60,
			"Operating"=>50,
			"Computer"=>40
		),

		"Sudip"=>array(
			"C++"=>45,
			"Operating"=>55,
			"Computer"=>65
		));

	/*Now use multi-index to access the specified value*/

	echo "Marks Of Sunil in C++ is :".$results['Sunil']['C++']."<br>";
	echo "Marks Of Sunil in Operating System is :".$results['Sunil']['Operating']."<br>";
	echo "Marks Of Sunil in Computer Architecuture is :".$results['Sunil']['Computer']."<br>";



 ?>

