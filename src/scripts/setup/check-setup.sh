# Checking if the content of ../../../config/RELAY is empty and apply default value if empty


RELAY=$(cat "../../../config/RELAY")

if [ -z "$RELAY" ]; then
echo "wss://relay.nostr.info" > "../../../config/RELAY"
echo "File created and filled with 'wss://relay.nostr.info'."
else
echo " "
fi
unset RELAY




echo " ========================== "
echo " ==   ✅ SETUP OK ✅"
echo " == Starting in 5 seconds..."
echo " ========================== "
cd ../crawl-and-reply
./crawl-and-reply.sh


