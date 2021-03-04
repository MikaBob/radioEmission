#!/bin/bash

BUTTON_1=12345665
BUTTON_2=12345664
BUTTON_3=12345666

STRING_BUTTON_1="BUTTON_1"
STRING_BUTTON_2="BUTTON_2"
STRING_BUTTON_3="BUTTON_3"
STRING_SWITCH_ALL="SWITCH_ALL"
STRING_ON="ON"

now=$(date)
echo -e "\n"
echo $now

echo $1
echo $2

if [[ $1 = $STRING_BUTTON_1 ]];
then
    if [[ -f $1 ]];
    then
        echo "Switching OFF #1"
        /var/www/html/radioEmission/radioEmission 7 $BUTTON_1 1 off
        rm $STRING_BUTTON_1
    else
        echo "Switching ON #1"
        /var/www/html/radioEmission/radioEmission 7 $BUTTON_1 1 on
        touch $STRING_BUTTON_1
    fi
fi

if [[ $1 = $STRING_BUTTON_2 ]];
then
        if [[ -f $1 ]];
        then
        echo "Switching OFF #2"
                /var/www/html/radioEmission/radioEmission 7 $BUTTON_2 1 off
                rm $STRING_BUTTON_2
        else
        echo "Switching ON #2"
                /var/www/html/radioEmission/radioEmission 7 $BUTTON_2 1 on
                touch $STRING_BUTTON_2
        fi
fi

if [[ $1 = $STRING_BUTTON_3 ]];
then
        if [[ -f $1 ]];
        then
        echo "Switching OFF #3"
        /var/www/html/radioEmission/radioEmission 7 $BUTTON_3 1 off
        rm $STRING_BUTTON_3
        else
        echo "Switching ON #3"
        /var/www/html/radioEmission/radioEmission 7 $BUTTON_3 1 on
        touch $STRING_BUTTON_3
        fi
fi

if [[ $1 = $STRING_SWITCH_ALL ]];
then
    if [[ $2 =  $STRING_ON ]];
    then
        echo "Switching ON everything"
        /var/www/html/radioEmission/radioEmission 7 $BUTTON_1 1 on
        /var/www/html/radioEmission/radioEmission 7 $BUTTON_2 1 on
        /var/www/html/radioEmission/radioEmission 7 $BUTTON_3 1 on
        touch $STRING_BUTTON_1
        touch $STRING_BUTTON_2
        touch $STRING_BUTTON_3
    else
        echo "Switching OFF everything"
        /var/www/html/radioEmission/radioEmission 7 $BUTTON_1 1 off
        /var/www/html/radioEmission/radioEmission 7 $BUTTON_2 1 off
        /var/www/html/radioEmission/radioEmission 7 $BUTTON_3 1 off
        rm $STRING_BUTTON_1
        rm $STRING_BUTTON_2
        rm $STRING_BUTTON_3
    fi
fi

