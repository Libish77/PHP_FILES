<html>
<head>
<title>Min And MAx Value</title>
</head>
<body>
<?php
    $name=array("Biplap"=>array("Roll"=>"05", "Address"=>"Kalanki","Contact"=>"9843509176"),
                "Soilesh"=>array("Roll"=>"06", "Address"=>"Saptari","Contact"=>"9862965844"),
                "Diwash"=>array("Roll"=>"07", "Address"=>"Jorpati","Contact"=>"9843000000"),
                "Trilok"=>array("Roll"=>"08", "Address"=>"New Bus Park","Contact"=>"9843000000"));

    ?>
    <table border="1" width="400px" height="400px">
        <tr>
                <th>Name</th>
                <th>Roll</th>
                <th>Address</th>
                <th>Contact</th>
        </tr>
        <?php
            foreach ($name as $key =>$value)
            {?>

                <tr>
                    <td><?php echo $key;?></td>
                    <td><?php echo $value['Roll'];?></td>
                    <td><?php echo $value['Address'];?></td>
                    <td><?php echo $value['Contact'];?></td>
                </tr>

         <?php
            }

            ?>
    </table>
