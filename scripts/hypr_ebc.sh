#!/bin/sh
# set -x
handle() {
  case $1 in
    'workspacev2'*) global_refresh ;;
    'openwindow'*) (sleep 1 && global_refresh ) ;;
    'closewindow'*) (sleep 1 && global_refresh) ;;
    # focusedmon*) do_something_else ;;
  esac
}
SOCK2_PATH="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -U - UNIX-CONNECT:$SOCK2_PATH | while read -r line; do handle "$line"; done