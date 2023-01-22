#!/bin/bash


current_path=$(pwd)
nostreply_folder=$(echo $current_path | rev | cut -d'/' -f4 | rev)
echo " Hello, i am $nostreply_folder "



trap "echo ' == Goodbye. Cleaning and exiting in 5 seconds...'; sleep 4; rm -d -r -f ../../../../../multi-nostreply/"$nostreply_folder"; exit" INT


#!/bin/bash



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
	echo " == ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ⌛ ="
	# NODE crawl.js for new messages 
	node ./crawl.js > /dev/null 2>&1
	# Set the outputs of crawl.js as id and pubkey
	NOTEID=$(cat ./id.txt)
	PUBKEY=$(cat ./pubkey.txt)
		# If it's the same note: multiply the timer interval
		if [ "$NOTEID" == "$OLDNOTE" ]; then   	
		cd ../adaptive-ask-interval
		./multiply.sh
		cd ../crawl-and-reply/
		unset ASKINTERVAL
		# Set new interval for the timer		
		ASKINTERVAL=$(cat ../../../config/ASK-INTERVAL)
        	echo " == ❌ No new messages... checking again in $ASKINTERVAL seconds"
		echo " "
		else
		echo " == 🆕 ✅ New messages found, let's reply"
		# If it's NOT the same note: divide the timer interval
		cd ../adaptive-ask-interval
		./divide.sh
		cd ../crawl-and-reply/
		unset ASKINTERVAL
		# Set new interval for the timer	
		ASKINTERVAL=$(cat ../../../config/ASK-INTERVAL)
				
		# Reply to message using nostril
		nostril --envelope --pow "$POW" --sec "$PRIVKEY" --content "$REPLYMESSAGE" --tag e "$NOTEID" --tag p "$PUBKEY" --tag " " "reply" | websocat "$RELAY" 
		echo " "
		echo " == OK . EVENT ID ABOVE.  RELAY: "$RELAY" "
		echo " "
		echo " == ⌛Checking for new messages in $ASKINTERVAL seconds..."
		echo " "
	fi
sleep $ASKINTERVAL
done
