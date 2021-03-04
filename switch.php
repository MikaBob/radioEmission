<?php
$INTERRUPTORS = [
	"BUTTON_1" => "12345665",
	"BUTTON_2" => "12345664",
	"BUTTON_3" => "12345666" 
];

if(isset($_GET["interruptor"])) {
	foreach( $INTERRUPTORS as $interruptorName => $interruptorId){
		if( in_array($interruptorName, explode(";", $_GET["interruptor"], count($INTERRUPTORS)))) {
			if( !file_exists($interruptorName) ){
				system('./radioEmission 7 '.$interruptorId.' 1 on');
				fopen($interruptorName, "w");
			} else {
				system('./radioEmission 7 '.$interruptorId.' 1 off');
				unlink($interruptorName);
			}
		}
	}
}
?>
