#!/bin/bash


# Check if "clust" is installed
echo " == 🤔 Checking if clust is installed "
if command -v clust > /dev/null; then
  echo " == 👌Ok.  "
  echo " "
  echo " "
else
  echo " == ⚠️ clust is not installed please install it"
  echo " == https://github.com/vinliao/clust "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi

# Check if "nostril" is installed
echo " == 🤔 Checking if nostril is installed "
if command -v nostril > /dev/null; then
  echo " == 👌Ok.  "
  echo " "
  echo " "
else
  echo " == ⚠️ nostril is not installed please install it."
  echo " == https://github.com/jb55/nostril "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi

# Check if "websocat" is installed
echo " == 🤔 Checking if websocat is installed "
if command -v websocat > /dev/null; then
  echo " == 👌Ok.  "
  echo " "
  echo " "
else
  echo " == ⚠️ websocat is not installed please install it"
  echo " == https://github.com/vi/websocat "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi

# Check if "node" is installed
echo " == 🤔 Checking if node is installed "
if command -v node > /dev/null; then
  echo " == 👌Ok.  "
  echo " "
else
  echo " == ⚠️ node is not installed please install it"
  echo " == https://nodejs.org "
  echo " "
  echo " == Waiting 15 seconds before exiting ..."
  sleep 15
  exit
fi




# Check if "fs" is installed
echo " == 🤔 Checking if node_modules/fs exist "
if [ -d "../check-and-reply/node_modules/fs" ]; then
  echo " == 👌Ok.  "
  echo ""
else
  echo " == 🚩 node_modules/fs folder does not exist "
  echo ""
  echo " == 🚀 Let's install it! "
  echo ""
  cd ../check-and-reply/
  npm i fs
  cd ../install
fi
echo " "

# Check if "ws" is installed
echo " == 🤔 Checking if node_modules/ws exist "
if [ -d "../check-and-reply/node_modules/ws" ]; then
  echo " == 👌Ok.  "
  echo ""
else
  echo " == 🚩 node_modules/fs folder does not exist "
  echo ""
  echo " == 🚀 Let's install it! "
  echo ""
  cd ../check-and-reply/
  npm i ws
  cd ../install
fi
echo " "

echo " == ✅ INSTALL OK "
echo " == Opening setup in 5 seconds ..."
