#!/usr/bin/env bash
# Rofi Wi-Fi menu: list networks, connect, toggle Wi-Fi, open advanced settings.

THEME=~/manchs/dotfiles/rofi/nord.rasi
rofi_menu() { rofi -dmenu -i -theme "$THEME" -p "$1" "${@:2}"; }

notify-send "Wi-Fi" "Scanning networks..." -t 1500
nmcli device wifi rescan 2>/dev/null

# Wi-Fi state decides the first entry (toggle on/off)
if [ "$(nmcli radio wifi)" = "enabled" ]; then
    toggle="Turn Wi-Fi off"
else
    toggle="Turn Wi-Fi on"
fi

# Current connection (name and type) shown as a message above the list
current=$(nmcli -t -f TYPE,NAME connection show --active \
    | awk -F: '$1 ~ /wireless|ethernet/ { t = ($1 ~ /wireless/) ? "Wi-Fi" : "Cable"; print t ": " $2; exit }')
current=${current:-Not connected}

# Build "SSID  (signal%)  [lock]" lines, strongest first, no duplicates or hidden SSIDs
networks=$(nmcli -t -f IN-USE,SSID,SIGNAL,SECURITY device wifi list \
    | awk -F: '$2 != "" && !seen[$2]++ {
        mark = ($1 == "*") ? "* " : "  "
        lock = ($4 != "") ? "  [secured]" : ""
        printf "%s%s  (%s%%)%s\n", mark, $2, $3, lock
    }')

choice=$(printf '%s\n%s\n%s\n' "$toggle" "Advanced settings" "$networks" | rofi_menu "Wi-Fi" -mesg "Connected: $current") || exit 0

case "$choice" in
    "Turn Wi-Fi off") nmcli radio wifi off; exit 0 ;;
    "Turn Wi-Fi on")  nmcli radio wifi on; exit 0 ;;
    "Advanced settings") nm-connection-editor; exit 0 ;;
esac

# Strip the marker, signal and lock text to get the bare SSID
ssid=$(sed -E 's/^(\* |  )//; s/  \([0-9]+%\)(  \[secured\])?$//' <<< "$choice")

# Known network: just bring it up. New secured network: ask for the password.
if nmcli -t -f NAME connection show | grep -Fxq "$ssid"; then
    out=$(nmcli connection up "$ssid" 2>&1)
else
    pass=""
    if grep -q "secured" <<< "$choice"; then
        pass=$(rofi_menu "Password" -password < /dev/null) || exit 0
    fi
    out=$(nmcli device wifi connect "$ssid" ${pass:+password "$pass"} 2>&1)
fi

if [ $? -eq 0 ]; then
    notify-send "Wi-Fi" "Connected to $ssid"
else
    notify-send "Wi-Fi" "Could not connect to $ssid: $out"
fi
