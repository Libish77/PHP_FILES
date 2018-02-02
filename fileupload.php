<?php
/* $_FILES Super Global Array is used to handle multi-media files in PHP*/

if(isset($_POST['uploadbtn']))
{
	$oldName = $_FILES['photo']['name'];
	$temp = explode('.', $oldName);
	if($temp[1]=='jpg'|$temp[1]=='png'|$temp[1]=='jpeg'|$temp[1]=='bmp')

	    {
        $newName =
            $temp[0] . time() .
            rand(000000000, 999999999) .
            "_" . rand(000000000, 999999999) .
            "." . $temp[1];

        $folder = 'uploads/';
        if (!is_dir($folder))
            mkdir($folder, 777);

        if (move_uploaded_file($_FILES['photo']['tmp_name'], $folder . $newName))
        {
            echo "File Uploaded Successfully";
        }
    }
    else
        echo "Only JPG Formats";
}
?>
<fieldset>
	<legend>File Upload</legend>
<form method="POST" enctype="multipart/form-data">
	<!-- Enctype Attribute is Mandatory To Upload a File From Form -->
	<input type="file" name="photo" required>
	<button type="submit" name="uploadbtn">Uplaod</button>
</form>
</fieldset>