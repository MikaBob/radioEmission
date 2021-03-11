<?php
$INTERRUPTORS = [
	"BUTTON_1" => "12345665",
        "BUTTON_2" => "12345664",
        "BUTTON_3" => "12345666"
];

if(isset($_GET["interruptor"])) {
	foreach( $INTERRUPTORS as $interruptorName => $interruptorId){
		if( in_array($interruptorName, explode(";", $_GET["interruptor"], count($INTERRUPTORS)))) {
			if( isset($_GET["action"]) && $_GET["action"] === "ON" ){
				system('sudo ./switch.sh '.$interruptorName.' ON');
			} else {
				system('sudo ./switch.sh '.$interruptorName.' OFF');
			}
		}
	}
}
?>
