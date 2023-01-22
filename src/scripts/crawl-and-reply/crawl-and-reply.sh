#!/bin/bash


current_path=$(pwd)
nostreply_folder=$(echo $current_path | rev | cut -d'/' -f4 | rev)
echo " Hello, i am $nostreply_folder "



trap "echo ' == Goodbye. Cleaning and exiting in 5 seconds...'; sleep 4; rm -d -r -f ../../../../../multi-nostreply/"$nostreply_folder"; exit" INT


while true; do
	PRIVKEY=$(cat ../../../config/REPLY-PRIVKEY)
	REPLYMESSAGE=$(cat ../../../config/REPLY-MESSAGE)
	RELAY=$(cat ../../../config/RELAY)
	POW=$(cat ../../../config/POW)
	ASKINTERVAL=$(cat ../../../config/ASK-INTERVAL)
	# Save NOTE to OLDNOTE variable before checking note, so 
	# we can compare them later to see if there is a new event id.
 	OLDNOTE=$NOTEID
 	# Unset NOTE variable
	unset NOTE
	echo " == ❓Asking nostr.band for new messages..."
	# Check for new messages using js script
	node ./crawl.js
	NOTEID=$(cat id.txt)
	PUBKEY=$(cat pubkey.txt)
		if [ "$NOTEID" == "$OLDNOTE" ]; then   	
		../adaptive-ask-interval/multiply.sh
		unset ASKINTERVAL
		ASKINTERVAL=$(cat ../../../config/ASK-INTERVAL)
        	echo " == ⌛ No new messages... checking again in $ASKINTERVAL seconds"
		echo " "
		else
		echo " == 🆕 New messages found, let's reply"
		../adaptive-ask-interval/divide.sh
		unset ASKINTERVAL
		ASKINTERVAL=$(cat ../../../config/ASK-INTERVAL)
		echo " "
		nostril --envelope --pow "$POW" --sec "$PRIVKEY" --content "$REPLYMESSAGE" --tag e "$NOTEID" --tag p "$PUBKEY" --tag " " "reply" | websocat "$RELAY" 
		echo " == OK . RELAY "$RELAY" "
		echo " "
		echo " == ⌛Checking for new messages in $ASKINTERVAL seconds..."
		echo " "
	fi
sleep $ASKINTERVAL
rm -f pubkey.txt
rm -f id.txt
done
