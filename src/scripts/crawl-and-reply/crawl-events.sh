if [ -d "node_modules" ]; then
  echo "node_modules folder exists, skipping install"
else
  echo "node_modules folder does not exist"
  echo "npm i puppeteer"
  npm i puppeteer
fi



while true; do
	PRIVKEY=$(cat ../../../config/REPLY-PRIVKEY)
	REPLYMESSAGE=$(cat ../../../config/REPLY-MESSAGE)
	ASKINTERVAL=$(cat ../../../config/ASK-INTERVAL)
	RELAY=$(cat ../../../config/RELAY)
	POW=$(cat ../../../config/POW)
	
	# Save NOTE to OLDNOTE variable before checking note, so 
	# we can compare them later to see if there is a new event id.
 	OLDNOTE=$NOTEID
 	# Unset NOTE variable
	unset NOTE
	echo " == ❓Asking nostr.band for new messages..."
	# Check for new messages using js script
	node ./crawl-events.js
	NOTEID=$(cat id.txt)
	PUBKEY=$(cat pubkey.txt)
		if [ "$NOTEID" == "$OLDNOTE" ]; then   	
        	echo " == ⌛ No new messages... checking again in 5 seconds"
		echo " "
		else
		echo " == 🆕 New messages found, let's reply"
		nostril --envelope --pow "$POW" --sec "$PRIVKEY" --content "$REPLYMESSAGE" --tag e "$NOTEID" --tag p "$PUBKEY" --tag " " "reply" | websocat "$RELAY" 
		echo " == ⌛Checking for new messages in $ASKINTERVAL seconds..."
		echo " "
	fi
sleep $ASKINTERVAL
rm -f pubkey.txt
rm -f id.txt
done
