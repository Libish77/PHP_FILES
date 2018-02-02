<?php

$day = date('D');

switch ($day) 
{
	case 'Sun':
		 echo "Today is Sunday";
		break;
	
	case 'Mon':
		 echo "Today is Monday";
		break;

	case 'Tue':
		 echo "Today is Tuesday";
		break;
		
	case 'Wed':
		 echo "Today is Wednesday";
		break;
		
	case 'Thu':
		 echo "Today is Thursday";
		break;
	case 'Fri':
		 echo "Today is Friday";
		break;
	case 'Sat':
		 echo "Today is Saturday";
		break;					


	default:
		 echo "Wonder which day is today?";
		break;
}

?>