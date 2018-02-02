<html>
<head>
    <title>Min And MAx Value</title>
</head>
<body>
<?php
$name=array("Biplap", "Soilesh", "Diwash", "Trilok");
$roll=array(6,7,8,9);
$contact=array("Kalanki","Saptari","Jorpati","New Bus Park");
?>
<table border="1" width="400px" height="400px">
    <tr>
        <th>Name</th>
        <th>Roll</th>
        <th>Address</th>
        <th>Contact</th>
    </tr>
    <?php
    for($i=0;$i<4;$i++)
    {?>

        <tr>
            <td><?php echo $name[$i];?></td>
            <td><?php echo $roll[$i];?></td>
            <td><?php echo $contact[$i];?></td>
        </tr>
        <?php
    }

    ?>
</table>
