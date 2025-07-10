#!/bin/bash

external_keyboards() {
  hyprctl devices -j | jq '[.keyboards[].name|select((contains("adc-keys") or contains("rk805") or contains("ws8100_pen") or contains("virtual")|not))] | length'
}

while sleep 1; do
	if [ $(external_keyboards) != "0" ] && pidof squeekboard > /dev/null; then
    echo "Detected external keyboard plugged in, killing virtual keyboard"
      pkill squeekboard
elif [ $(external_keyboards) == "0" ] && !(pidof squeekboard > /dev/null); then
  echo "No external keyboards connected, restarting squeekboard"
  squeekboard &
fi
done
