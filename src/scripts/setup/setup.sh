echo " == Enter the pattern you want to reply to:"
read ASKMESSAGE
rm -f ../../../config/REPLY-MESSAGE
echo $ASKMESSAGE>../../../config/ASK-MESSAGE

echo " == Enter the REPLYMESSAGE ex: scam! :"
read REPLYMESSAGE
rm -f ../../../config/REPLY-MESSAGE
echo $REPLYMESSAGE>../../../config/REPLY-MESSAGE


echo " == Enter the ASKINTERVAL in seconds ex: 10 "
read ASKINTERVAL
rm -f ../../../config/ASK-INTERVAL
echo $ASKINTERVAL > ../../../config/ASK-INTERVAL

echo " == Enter the private key you will be using to reply as HEX format:"
read PRIVKEY
rm -f ../../../config/REPLY-PRIVKEY
echo $PRIVKEY>../../../config/REPLY-PRIVKEY


echo " == Enter the relay you will be sending the reply to:"
read RELAY
rm -f ../../../config/RELAY
echo $RELAY > ../../../config/RELAY


echo " == SETUP OK "
echo " == Starting ..."
cd ../crawl-and-reply
./crawl-and-reply.sh
