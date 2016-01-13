#!/bin/bash

vol=$(amixer get Master | awk -F'[][]' '/%/ {if ($4 == "off") { print "mute" } else { print $2 }}' | head -n 1)

echo $vol

exit 0
