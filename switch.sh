#!/bin/bash

# HOW TO USE:
# ./switch.sh SWITCH_ALL ON
# ./switch.sh BUTTON_1 OFF

BUTTON_1=12345665
BUTTON_2=12345664
BUTTON_3=12345666

STRING_BUTTON_1="BUTTON_1"
STRING_BUTTON_2="BUTTON_2"
STRING_BUTTON_3="BUTTON_3" 
STRING_SWITCH_ALL="SWITCH_ALL"
STRING_ON="ON"

CURRENT_DIR="/var/www/html/radioEmission/"

now=$(date)

sendRadioCommand () {
        sudo /var/www/html/radioEmission/radioEmission 7 $1 1 $2
}

echo -e "\n"
echo $now
echo $1
echo $2

if [[ $1 = $STRING_BUTTON_1 ]]; then
    if [[ $2 = $STRING_ON ]];
    then
        echo "Switching ON #1"
        sendRadioCommand $BUTTON_1 on
        sudo echo " " > $CURRENT_DIR$STRING_BUTTON_1
    else
        echo "Switching OFF #1"
        sendRadioCommand $BUTTON_1 off
        sudo rm $CURRENT_DIR$STRING_BUTTON_1
    fi
fi

if [[ $1 = $STRING_BUTTON_2 ]]; then
	if [[ $2 = $STRING_ON ]];
	then
		echo "Switching ON #2"
		sendRadioCommand $BUTTON_2 on
		sudo echo " " > $CURRENT_DIR$STRING_BUTTON_2
	else
		echo "Switching OFF #2"
		sendRadioCommand $BUTTON_2 off
		sudo rm $CURRENT_DIR$STRING_BUTTON_2
	fi
fi

if [[ $1 = $STRING_BUTTON_3 ]]; then
	if [[ $2 = $STRING_ON ]];
	then
		echo "Switching ON #3"
		sendRadioCommand $BUTTON_3 on
		sudo echo " " > $CURRENT_DIR$STRING_BUTTON_3
		sudo python /var/www/python/infrared/irrp.py -g16 -p -f /var/www/python/infrared/ir-galaxy modeminus
	else
		echo "Switching OFF #3"
		sendRadioCommand $BUTTON_3 off
		sudo rm $CURRENT_DIR$STRING_BUTTON_3
	fi
fi

if [[ $1 = $STRING_SWITCH_ALL ]]; then
    if [[ $2 = $STRING_ON ]];
    then
        echo "Switching ON everything"
        sendRadioCommand $BUTTON_1 on
        sendRadioCommand $BUTTON_2 on
        sendRadioCommand $BUTTON_3 on
        sudo echo " " > $CURRENT_DIR$STRING_BUTTON_1
        sudo echo " " > $CURRENT_DIR$STRING_BUTTON_2
        sudo echo " " > $CURRENT_DIR$STRING_BUTTON_3
	sudo python /var/www/python/infrared/irrp.py -g16 -p -f /var/www/python/infrared/ir-galaxy modeminus
    else
        echo "Switching OFF everything"
        sendRadioCommand $BUTTON_1 off
        sendRadioCommand $BUTTON_2 off
        sendRadioCommand $BUTTON_3 off
        sudo rm $CURRENT_DIR$STRING_BUTTON_1
        sudo rm $CURRENT_DIR$STRING_BUTTON_2
        sudo rm $CURRENT_DIR$STRING_BUTTON_3
    fi
fi
