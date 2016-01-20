#!/bin/bash
#sudo iw dev wlp2s0 link (parse this command)
# Signal: is reported in a wireless power ratio in dbm (e.g. from -100 to 0). The closer the negative value gets to zero, the better the signal. Observing the reported power on a good quality link and a bad one should give an idea about the individual range. 

# check for ethernet connection and exit if true
#iwconfig wlan0 2>&1 | grep -q no\ wireless\ extensions\. && {
#  echo wired
#  exit 0
#}

ssid=`sudo iw dev wlp2s0 link | awk -F SSID: '{print $2}'`
strength=`sudo iw dev wlp2s0 link | awk -F signal: '{print $2}' | cut -c3-5`

bars=`expr $strength / 20`

case $bars in
  0)  bar='[/////]' ;;
  1)  bar='[////-]' ;;
  2)  bar='[///--]' ;;
  3)  bar='[//---]' ;;
  4)  bar='[/----]' ;;
  5)  bar='[-----]' ;;
  *)  bar='[--!--]' ;;
esac

echo $ssid $bar

exit 0
