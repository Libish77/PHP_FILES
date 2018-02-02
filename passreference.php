<html>
<head>
<title>Min And MAx Value</title>
</head>
<body>
<?php
    function addFive($num)
    {
        $num += 5;
    }
    function adSix(& $num)
    {
        $num+=6;
    }
    $org=5;
    addFive($org);
    echo "Original Value is".$org."<br>";
    adSix($org);
    echo "New Value is".$org;
?>
</body>
</html>