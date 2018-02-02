<?php

    function add($a,$b,$c)
    {
        echo "Sum is: ",$a+$b;
    }
    
if(isset($_POST['submit']))
{
    $a= $_POST["first"];
    $b= $_POST["last"];
    $sum=calculate($a,$b,'+');
}

?>
<html>
<head>
    <title>Calculate</title>
</head>
<body>
    <form  action="" method="post">
        <table>
            <tr>
                <td>
                    <input type="text" name="first"/>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="last"/>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="submit" Value="Calculate"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>