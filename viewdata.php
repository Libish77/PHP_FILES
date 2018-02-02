<?php
    if(isset ($_POST['submitbtn']))
    {    ?>
     <fieldset>
         <legend>User Profiles</legend>
         <b>Full name: </b><?php echo $_POST['fname']."".$_POST['lname'];?>
         <hr>
         <b>Contact: </b><?php echo $_POST['contact'];?>
         <hr>
         <b>Address: </b><?php echo $_POST['address'];?>
         <hr>
         <b>Gender: </b><?php echo $_POST['gender'];?>
         <hr>
     </fieldset>
<?php }
$str=expl
?>