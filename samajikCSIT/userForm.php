<?php
/*User From*/
?>
<fieldset>
	<legend>Personal Info</legend>
	<form method="POST" action="profile.php">
		First Name: <input type="text" required name="f_name" placeholder="First Name">
		<hr>
		Last Name: <input type="text" required name="l_name" placeholder="Last Name">
		<hr>
		Address: <input type="text" required name="address" placeholder="Address">
		<hr>
		Contact: <input type="text" required name="contact" placeholder="Contact">
		<hr>
		Gender : <input type="radio" checked name="gender" value="Male">Male
		<input type="radio" name="gender" value="Female">Female
		<hr>
		Country:
		<select name="country">
			<option value="Nepal">Nepal</option>
			<option value="India">India</option>
			<option value="China">China</option>
			<option value="Japan">Japan</option>
		</select>
		<hr>
		<button type="submit" name="submitbtn">Submit</button>
	</form>
</fieldset>