#!/bin/bash
# Domoticz server
SERVER="IP@_server:Port"

#IDX
# le numéro de l IDX dans la liste des peripheriques
DHTIDX="ID_number"

TMPFILE="/var/tmp/pol"
curl "http://api.airvisual.com/v1/nearest?lat=Coord_latitude&lon=Coord_longitude&key=AirVisual_key" > $TMPFILE
POL=$(more /var/tmp/pol | grep aqius | awk -F: '{print $2}' | awk -F"," '{print $1}')
#echo $POL
polu=$(echo $POL)
curl -s -i -H "Accept: application/json" "http://$SERVER/json.htm?type=command&param=udevice&idx=$DHTIDX&nvalue=0&svalue=$polu"
rm $TMPFILE
exit 1
