<html>
<head>
<title>PHP Intro</title>
</head>
<body>
<?php 
$marks=array(
        "Faijan" =>array(
                "Web"=>"Subject",
                "java"=>50,
                "Database"=>35),

        "soilesh"=>array("web"=>50,"java"=>45,"Database"=>50)
);

echo "Marks of Soilesh in Database:".$marks['soilesh']['Database']."<br>";
echo "Marks of Soilesh in Web:".$marks['soilesh']['web']."<br>";
echo "Marks of Soilesh in Java:".$marks['soilesh']['java']."<br>"."<br>"."<br>";
echo "Marks of Faijan in Database:".$marks['Faijan']['Database']."<br>";
echo "Marks of Faijan in Web:".$marks['Faijan']['Web']."<br>";
echo "Marks of Faijan in Java:".$marks['Faijan']['java']."<br>";
?>
</body>
</html>