<html>
<head>
    <title>Calculate</title>
</head>
<body>
<?php
        function calculate($a, $b, $operator)
        {
            switch($operator)
            {
                case "+":
                    return $a+$b;
                case "-":
                    return $a-$b;
                case "*":
                    return $a*$b;
                case "/":
                    return $a/$b;
                default:
                    return false;
            }
      }
      if(is)
        $a= $_POST["first"];
        $b= $_POST["last"];
      $sum=calculate($a,$b,'*');
      echo "Sum is ".$sum;
?>
</body>
</html>