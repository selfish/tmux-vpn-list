#!/bin/zsh

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# shellcheck disable=SC2120
vpn_list() {
  # shellcheck disable=SC2034
  vpns="$(osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "get name of configurations" -e "end tell")"
  # shellcheck disable=SC2034
  states="$(osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "get state of configurations" -e "end tell")"
  vpnlist=("${(@ps:, :)vpns}")
  statelist=("${(@ps:, :)states}")
#  for i in "${(@ps:, :)vpns}"; do
#    echo "$i";
#  done

  res=("${vpnlist[@]}")

  for ((i=($#vpnlist); i > 0; i--)); do
    if [ "${statelist[i]}"  != 'CONNECTED' ]; then
           # shellcheck disable=SC2206
           res=(${res[1,$i-1]} ${res[$i+1,-1]})
    fi
  done
  delim=""
  joined=""
  for item in "${res[@]}"; do
    joined="$joined$delim$item"
    delim=" | "
  done
  echo "$joined"
}

main() {
	vpn_list
}
main
