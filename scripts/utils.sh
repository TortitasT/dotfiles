#!/bin/bash

HISTORY_FILE="${HOME}/.cache/utils_ssh_history"
mkdir -p "$(dirname "$HISTORY_FILE")"
touch "$HISTORY_FILE"

show_menu() {
  echo "=== Utils ==="
  echo "1) SSH Tunnel"
  echo "2) SSH Connect"
  echo "3) Exit"
  echo ""
  read -rp "Select an option: " choice
}

select_server() {
  history_entry=""
  if [[ -s "$HISTORY_FILE" ]]; then
    echo "Select from history (ESC for new entry):"
    history_entry=$(fzf --prompt="History> " --height=10 --reverse < "$HISTORY_FILE" || true)
  fi

  if [[ -n "$history_entry" ]]; then
    ssh_user=$(echo "$history_entry" | cut -d'@' -f1)
    server_ip=$(echo "$history_entry" | cut -d'@' -f2 | cut -d':' -f1)
  else
    read -rp "Server IP: " server_ip
    read -rp "SSH user [tortitas]: " ssh_user
    ssh_user="${ssh_user:-tortitas}"
  fi

  echo "Select SSH key (ESC for default):"
  ssh_key=$(find ~/.ssh -type f ! -name "*.pub" ! -name "known_hosts*" ! -name "config" ! -name "authorized_keys" 2>/dev/null | fzf --prompt="SSH key> " --height=10 --reverse || true)

  # Save to history
  entry="${ssh_user}@${server_ip}"
  grep -qxF "$entry" "$HISTORY_FILE" 2>/dev/null || echo "$entry" >> "$HISTORY_FILE"
}

ssh_tunnel() {
  select_server
  read -rp "Port to forward: " port

  cmd="ssh -N -L ${port}:127.0.0.1:${port}"
  [[ -n "$ssh_key" ]] && cmd+=" -i ${ssh_key}"
  cmd+=" ${ssh_user}@${server_ip}"

  echo "Running: $cmd"
  eval "$cmd"
}

ssh_connect() {
  select_server

  cmd="ssh"
  [[ -n "$ssh_key" ]] && cmd+=" -i ${ssh_key}"
  cmd+=" ${ssh_user}@${server_ip}"

  echo "Running: $cmd"
  eval "$cmd"
}

show_menu

case $choice in
  1) ssh_tunnel ;;
  2) ssh_connect ;;
  3) exit 0 ;;
  *) echo "Invalid option" ;;
esac
