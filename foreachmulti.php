<?php
    $student= array("umesh"=>array(
                                    "Roll no"=>"10",
                                    "Address"=>"kathmandu"
                                    ),
                    "Faijan"=>array(
                                    "Roll no"=>"11",
                                    "Address"=>"India"
                                    ),
                    "soilesh"=>array(
                                    "Roll no"=>"1",
                                    "Address"=>"saptari"
                                    )
                    );

    foreach ($student as $key =>$students)
    {
        echo $key."<br>";
        foreach ($students as $key2=>$item)
        {
            echo $key2.":".$item."<br>";
        }
    }
