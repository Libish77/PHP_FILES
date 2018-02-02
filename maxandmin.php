<html>
<head>
<title>Min And MAx Value</title>
</head>
<body>
<?php
    $a=20;
    $b=10;
    $c=5;
    if($a>$c &$b>$c)
    {
        if($a>$b)
        {
            echo "Greatest is ".$a;
        }
        else
        {
            echo "Greatest is ".$b;
        }

    }
    else
    {
        echo "Greatest is ".$c;
    }
    echo "<br>";
    if($a<$c &$b<$c)
    {
        if($a<$b)
        {
            echo "Smallest is ".$a;
        }
        else
        {
            echo "Smallest is ".$b;
        }

    }
    else
    {
        echo "Smallest is ".$c;
    }
?>
</body>
</html>