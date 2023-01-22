ask_interval=$(cat ../../../config/ASK-INTERVAL)
min_interval=$(cat ../../../config/MIN-INTERVAL)
max_interval=$(cat ../../../config/MAX-INTERVAL)


new_ask_interval=$((ask_interval / 2))

if [[ $new_ask_interval -lt $min_interval ]]; then
  echo $min_interval > ../../../config/ASK-INTERVAL
elif [[ $new_ask_interval -gt $max_interval ]]; then
  echo $max_interval > ../../../config/ASK-INTERVAL
elif [[ $new_ask_interval = $max_interval ]]; then
  echo $max_interval > ../../../config/ASK-INTERVAL
else
  echo $new_ask_interval > ../../../config/ASK-INTERVAL
fi
