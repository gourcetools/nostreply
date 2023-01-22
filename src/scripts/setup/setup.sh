#!/bin/bash


echo "┌─┐┌─┐┌┬┐┬ ┬┌─┐";
echo "└─┐├┤  │ │ │├─┘";
echo "└─┘└─┘ ┴ └─┘┴  ";
echo " "
echo " == 🔍 Enter the pattern you want to reply to ex: HEY HEY HEY"
read ASKMESSAGE
rm -f ../../../config/ASKMESSAGE
echo $ASKMESSAGE>../../../config/ASK-MESSAGE

echo " "
echo " == 💬 Enter the REPLYMESSAGE ex: THATZ A SCAM! :"
read REPLYMESSAGE
rm -f ../../../config/REPLY-MESSAGE
echo $REPLYMESSAGE>../../../config/REPLY-MESSAGE

echo " "
echo " == 🕰️ Enter the ASKINTERVAL in seconds ex: 10 "
read ASKINTERVAL
rm -f ../../../config/ASK-INTERVAL
echo $ASKINTERVAL > ../../../config/ASK-INTERVAL

echo " "
echo " == 🐇 Enter the minimum ask in seconds ex: 5 "
read MINASKINTERVAL
rm -f ../../../config/MIN-INTERVAL
echo $MINASKINTERVAL > ../../../config/MIN-INTERVAL

echo " "
echo " == 🐢 Enter the maximum ask interval in seconds ex: 600 "
read MAXASKINTERVAL
rm -f ../../../config/MAX-INTERVAL
echo $MAXASKINTERVAL > ../../../config/MAX-INTERVAL

echo " "
echo " == 🔑 Enter the private key you will be using to reply as HEX format:"
read PRIVKEY
rm -f ../../../config/REPLY-PRIVKEY
echo $PRIVKEY>../../../config/REPLY-PRIVKEY

echo " "
echo " == 📡 Enter the relay you will be sending the reply to:"
read RELAY
rm -f ../../../config/RELAY
echo $RELAY > ../../../config/RELAY

echo " "
echo " == ✅ SETUP OK "


