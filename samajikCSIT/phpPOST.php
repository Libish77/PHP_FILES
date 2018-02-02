<?php
/*Form Handling In PHP
  Mainly FORM Processing can be Categorized into Two Methods
	1.$_POST[''] //For Method Post
	2.$_GET[''] // For Method GET

	$_POST and $_GET are Superglobal Arrays
	Which Can be accessed From Anywhere Whenever Required
*/
?>
<fieldset>
	<legend>Info Form</legend>
<form method="POST">
  First Name : <input type="text" required name="f_name" placeholder="First Name">
  <hr>
  Last Name : <input type="text" required name="l_name" placeholder="Last Name">
  <hr>
  <button type="submit" name="submitbtn">Get Full Name</button>
</form>	
</fieldset>

<?php 
if(isset($_POST['submitbtn']))
{
	$f_name = $_POST['f_name'];
	$l_name = $_POST['l_name'];

	if(!empty($f_name) && !empty($l_name))
		echo "Your Full Name is: ".$f_name." ".$l_name;
}
