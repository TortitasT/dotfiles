#!/bin/bash

CACHE_DIR="${HOME}/.cache/utils_ssh"
HISTORY_FILE="${CACHE_DIR}/history"
KEYS_DIR="${CACHE_DIR}/keys"
PORTS_DIR="${CACHE_DIR}/ports"
mkdir -p "$KEYS_DIR" "$PORTS_DIR"
touch "$HISTORY_FILE"

# Move entry to top of file (most recently used first)
bump_entry() {
  local file="$1" entry="$2"
  local tmp="${file}.tmp"
  echo "$entry" > "$tmp"
  grep -vxF "$entry" "$file" 2>/dev/null >> "$tmp" || true
  mv "$tmp" "$file"
}

# Get history file for a server (user@ip), sanitized for filename
server_hash() {
  echo "$1" | sed 's/[^a-zA-Z0-9@._-]/_/g'
}

show_menu() {
  local cyan='\033[36m'
  local yellow='\033[33m'
  local reset='\033[0m'

  printf "${cyan}"
  cat << 'MASCOT'
    .---.
   /     \
   \.@-@./
   /`\_/`\
  //  _  \\
 | \     )|_
/`\_`>  <_/ \
\__/'---'\__/
MASCOT
  printf "${reset}"
  printf "${yellow}  ~ SSH Utils ~${reset}\n\n"

  choice=$(printf "SSH Connect\nSSH Tunnel\nExit" | fzf --prompt="Utils> " --height=10 --reverse --no-info)
}

select_server() {
  history_entry=""
  if [[ -s "$HISTORY_FILE" ]]; then
    history_entry=$(fzf --prompt="Server history> " --height=10 --reverse < "$HISTORY_FILE" || true)
  fi

  if [[ -n "$history_entry" ]]; then
    ssh_user=$(echo "$history_entry" | cut -d'@' -f1)
    server_ip=$(echo "$history_entry" | cut -d'@' -f2 | cut -d':' -f1)
  else
    read -rp "Server IP: " server_ip
    read -rp "SSH user [tortitas]: " ssh_user
    ssh_user="${ssh_user:-tortitas}"
  fi

  entry="${ssh_user}@${server_ip}"
  local skey
  skey=$(server_hash "$entry")

  # Select SSH key: show per-server history first, then all keys
  local keys_file="${KEYS_DIR}/${skey}"
  touch "$keys_file"
  local all_keys
  all_keys=$(find ~/.ssh -type f ! -name "*.pub" ! -name "known_hosts*" ! -name "config" ! -name "authorized_keys" 2>/dev/null)

  # Merge: server history on top, then remaining keys
  local key_list
  key_list=$(cat "$keys_file" 2>/dev/null; echo "$all_keys" | while read -r k; do
    grep -qxF "$k" "$keys_file" 2>/dev/null || echo "$k"
  done)

  ssh_key=$(echo "$key_list" | grep -v '^$' | fzf --prompt="SSH key> " --height=10 --reverse || true)

  # Save histories
  bump_entry "$HISTORY_FILE" "$entry"
  [[ -n "$ssh_key" ]] && bump_entry "$keys_file" "$ssh_key"
}

select_port() {
  local entry="${ssh_user}@${server_ip}"
  local skey
  skey=$(server_hash "$entry")
  local ports_file="${PORTS_DIR}/${skey}"
  touch "$ports_file"

  port=""
  if [[ -s "$ports_file" ]]; then
    port=$(fzf --prompt="Port history (ESC for new)> " --height=10 --reverse < "$ports_file" || true)
  fi

  if [[ -z "$port" ]]; then
    read -rp "Port to forward: " port
  fi

  [[ -n "$port" ]] && bump_entry "$ports_file" "$port"
}

ssh_tunnel() {
  select_server
  select_port

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
  "SSH Connect") ssh_connect ;;
  "SSH Tunnel") ssh_tunnel ;;
  "Exit"|"") exit 0 ;;
esac
