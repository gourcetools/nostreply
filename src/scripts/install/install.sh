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




# Check if "nodes_modules" is installed
echo " == 🤔 Checking if node_modules exist "
if [ -d "../crawl-and-reply/node_modules" ]; then
  echo " == 👌Ok.  "
  echo ""
else
  echo " == 🚩 node_modules folder does not exist "
  echo ""
  echo " == 🚀 Let's install it! "
  echo ""
  cd ../crawl-and-reply/
  npm i puppeteer
  ../install
fi


