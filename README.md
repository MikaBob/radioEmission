# radioEmission
send radio wave to radio Emitter connected on your Raspbery (PIN 7)

The C++ file is not from me but from **Idleman** (idleman@idleman.fr - http://blog.idleman.fr)


# Compile
`g++ radioEmission.cpp -o radioEmission -lwiringPi`

# Usage
## C++
Change DEVICE_ID and SENDER_ID with the id you set for your devices
`./radioEmission PIN RECEIVER_ID SENDER_ID on`

`./radioEmission 7 12345666 1 on`

## Php

`http://127.0.0.1/radioEmission/switch.php?interruptor=BUTTON_1`

`http://127.0.0.1/radioEmission/switch.php?interruptor=BUTTON_1;BUTTON_2;BUTTON_3`

## Bash

`./switch.sh SWITCH_ALL OFF`

`./switch.sh BUTTON_1 OFF`
