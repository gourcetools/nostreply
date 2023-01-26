#!/bin/bash
# START.sh
echo "";
echo "";
echo "";
echo "		┌┐┌┌─┐┌─┐┌┬┐┬─┐┌─┐┌─┐┬ ┬ ┬";
echo "		││││ │└─┐ │ ├┬┘├┤ ├─┘│ └┬┘";
echo "		┘└┘└─┘└─┘ ┴ ┴└─└─┘┴  ┴─┘┴ ";
echo "";
echo "-----------------------------------------------------";
echo "-------------- 🤖 Welcome to Nostreply 🤖 ----------- ";
echo "---------  Version: 0.1.0 | Liscence: MIT  -----------";
echo "                  ┌─────────────────┐";
echo "                  │   📜 MAIN MENU  │";
echo "   ┌──────────────┴─────────────────┴──────────────────┐";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    1) 🔧 Setup Nostreply                          │";
echo "   │    2) 🤖 Start Nostreply using ASK-MESSAGE        │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    3) 🤖 Start Nostreply using  ASK-MESSAGE-LIST  │";
echo "   │        └─>You have to config ASK-MESSAGE-LIST     │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    4) 🔃 Update Nostreply (will also reset)       │";
echo "   ├───────────────────────────────────────────────────┤";
echo "   │    5) 🚪 Exit                                     |";
echo "   └───────────────────────────────────────────────────┘";
echo -n "    └─> Enter your choice [1-5]:";



# Running a forever loop using while statement
# This loop will run untill select the exit option.
# User will be asked to select option again and again

while :
do

# reading choice
read choice

# case statement is used to compare one value with the multiple cases.
case $choice in
  

  
  # Pattern 1
  1)  echo "🔧 Setup Nostreply  " 
    cd ../setup
   ./setup.sh
  source ../menu/START.sh ;;
  

  
  # Pattern 2
  2)  echo "🤖 Start Nostreply using  ASK-MESSAGE" 
    cd ../check-and-reply
   ./check-and-reply.sh
  source ../menu/START.sh ;;
  

  
  # Pattern 3
  3)  echo "🤖 Start Nostreply using  ASK-MESSAGE-LIST=="
  cd ../list-splitter
   ./list-split-and-start.sh
  source ../menu/START.sh ;;
  

 
  # Pattern 4
  4)  echo "🔃 Update Nostreply (will also reset) "
  cd ../../../
  git pull
  source ../menu/START.sh ;;
    
  
  # Pattern 5
  5)  echo "🚪 Exit"
      exit;;

  # Default Pattern
  *) echo " ❌ ERROR ❌  "
    echo "    $choice is not a valid number..."
    echo "     └─> Enter your choice [1-5]:";;
esac
  echo " "
done

