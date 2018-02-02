<?php
/*Get Submitted Data From ANother Page */
if(isset($_POST['submitbtn']))
{
?>
<fieldset>
	<legend>User Profile</legend>
	<b>Full Name:</b> <?php echo $_POST['f_name']." ".$_POST['l_name']; ?>
	<hr>
	<b>Address: </b> <?php echo $_POST['address']; ?>
	<hr>
	<b>Contact: </b> <?php echo $_POST['contact']; ?>
	<hr>
	<b>Gender: </b> <?php echo $_POST['gender']; ?>
	<hr>
	<b>Country: </b> <?php echo $_POST['country']; ?>
</fieldset>





<?php
}

?>