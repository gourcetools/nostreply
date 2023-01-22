#!/bin/bash


echo " == 🤔 Checking if node_modules exist "
echo ""
if [ -d "../crawl-and-reply/node_modules" ]; then
  echo " == 👌Ok. Skipping install. "
  echo ""
else
  echo " == 🚩 node_modules folder does not exist "
  echo ""
  echo " == 🚀 Let's install it! "
  echo ""
  cd ../crawl-and-reply/
  npm i puppeteer
  ../install/
fi


