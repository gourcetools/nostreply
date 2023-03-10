#!/bin/bash


# Check if "clust" is installed
echo " == ð¤ Checking if clust is installed "
if command -v clust > /dev/null; then
  echo " == ðOk.  "
  echo " "
  echo " "
else
  echo " == â ï¸ clust is not installed please install it"
  echo " == https://github.com/vinliao/clust "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi

# Check if "nostril" is installed
echo " == ð¤ Checking if nostril is installed "
if command -v nostril > /dev/null; then
  echo " == ðOk.  "
  echo " "
  echo " "
else
  echo " == â ï¸ nostril is not installed please install it."
  echo " == https://github.com/jb55/nostril "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi

# Check if "websocat" is installed
echo " == ð¤ Checking if websocat is installed "
if command -v websocat > /dev/null; then
  echo " == ðOk.  "
  echo " "
  echo " "
else
  echo " == â ï¸ websocat is not installed please install it"
  echo " == https://github.com/vi/websocat "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi

# Check if "node" is installed
echo " == ð¤ Checking if node is installed "
if command -v node > /dev/null; then
  echo " == ðOk.  "
  echo " "
else
  echo " == â ï¸ node is not installed please install it"
  echo " == https://nodejs.org "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi




# Check if "fs" is installed
echo " == ð¤ Checking if node_modules/fs exist "
if [ -d "../check-and-reply/node_modules/fs" ]; then
  echo " == ðOk.  "
  echo ""
else
  echo " == ð© node_modules/fs folder does not exist "
  echo ""
  echo " == ð Let's install it! "
  echo ""
  cd ../check-and-reply/
  npm i fs
  cd ../install
fi
echo " "

# Check if "ws" is installed
echo " == ð¤ Checking if node_modules/ws exist "
if [ -d "../check-and-reply/node_modules/ws" ]; then
  echo " == ðOk.  "
  echo ""
else
  echo " == ð© node_modules/fs folder does not exist "
  echo ""
  echo " == ð Let's install it! "
  echo ""
  cd ../check-and-reply/
  npm i ws
  cd ../install
fi
echo " "

echo " == â INSTALL OK "
echo " == Opening setup in 5 seconds ..."
