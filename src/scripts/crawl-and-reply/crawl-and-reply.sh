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
	POW=$(cat ../../../config/POW)
	# Save NOTE to OLDNOTE variable before checking note, so 
	# we can compare them later to see if there is a new event id.
 	OLDNOTE=$NOTE
 	# Unset NOTE variable
	unset NOTE
	echo " == ❓Asking nostr.band for new messages..."
	# Check for new messages using extract-value.js
	NOTE=$(node crawl-and-reply.js)
		if [ "$NOTE" == "$OLDNOTE" ]; then   	
        	echo " == ⌛ No new messages... checking again in $ASKINTERVAL seconds"
		echo " "
		else
		echo " == 🆕 New messages found, let's reply"
		nostril --envelope --pow "$POW" --sec "$PRIVKEY" --content "$REPLYMESSAGE" --tag e $NOTE --tag e $NOTE | websocat wss://relay.nostr.info 
		echo " == ⌛Checking for new messages in $ASKINTERVAL seconds..."
		echo " "
	fi
sleep $ASKINTERVAL
done
