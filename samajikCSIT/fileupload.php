<?php
/*We can use $_FILES Super Global Array to upload files in PHP
  enctype attribute is required to upload file from HTML Form	
*/
if(isset($_POST['uploadbtn']))
{
	$fileName = $_FILES['photo']['name'];
	$temp = explode('.',$fileName);
	$newName = $temp[0]."_".time()."_".rand(1000000000, 1999999999).".".$temp[1];

	$folder = 'uploads/';
	if(!is_dir($folder))
	{
		mkdir($folder,777);
	}

	$size = 2*1024*1024;
	
 	if($_FILES['photo']['size']> $size)
 	{
 		echo "File Size large";
 	}
 	elseif($temp[1]!='jpeg' && $temp[1]!='jpg' && $temp[1]!='png' && $temp[1]!='gif')
 	{
 		echo "Image Format Not Valid";
 	}

 	else
 	{
 	if(move_uploaded_file($_FILES['photo']['tmp_name'], $folder.$newName))
	{
		echo "File Uploaded Successfylly";
	}	
 	}
	

	
}


 ?>

 <fieldset>
 	<legend>Upload File</legend>
 	<form method="POST" enctype="multipart/form-data">  
 		<!-- enctype attribute required -->
 		Photo: <input type="file" name="photo" required>
 		<hr>
 		<button type="submit" name="uploadbtn"> Upload</button>

 	</form>
 </fieldset>