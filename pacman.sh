#!/bin/bash

ask_to_continue() {
  read -p "Something went wrong. Do you want to continue? [y/n]: " choice

  case "$choice" in
  [Yy] | [Yy][Ee][Ss])
    echo "Continuing..."
    return 0
    ;; # If 'y', 'Y', or 'yes' (case insensitive), continue
  [Nn] | [Nn][Oo])
    echo "Exiting..."
    exit 1
    ;; # Any other input, exit
  *)
    echo "Invalid option"
    ask_to_continue
    ;;
  esac
}

execute_command() {
  echo "Executing: $1"
  eval "$1" && echo "Command executed successfully!" || {
    echo "Error executing command: $1"
    ask_to_continue
  }
}

# Function to install a list of packages
install_packages() {
  local package_list=("$@")
  local command="sudo pacman -S --noconfirm ${package_list[*]}"
  execute_command "$command"
}

# Function to handle system updates
update_system() {
  local command="sudo pacman -Syu --noconfirm"
  execute_command "$command"
}

# Function to clean up unnecessary packages
cleanup_system() {
  local command="sudo pacman -Rns \$(sudo pacman -Qdtq) --noconfirm"
  execute_command "$command"
}

# Define package lists
fonts=(
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  ttf-fira-mono
  otf-font-awesome
  ttf-font-awesome
)

hyprland_tools=(
  hyprcursor
  hypridle
  hyprpaper
  hyprlock
  waybar
)

utilities=(
  ripgrep
  man-db
  man-pages
  fd
  fzf
  wget
  neovim
)

pipewire_tools=(
  pipewire
  pipewire-pulse
  wireplumber
  xdg-desktop-portal-hyprland
  wl-clipboard
  brigtnessctl
  pavucontrol
  pulseaudio
  acpi
  libnotify
)

networking_tools=(
  openssh
  uwsm
  htop
)

dev_tools=(
  clang
  gcc
  make
  cmake
  rust
  go
  lua
  luarocks
  python3
  python-pip
  base-devel
  libc++
  gcc
  llvm
)

compression_tools=(
  zip
  unzip
  gzip
  tar
)

messaging_tools=(
  telegram-desktop
  rofi
)

hyprpolkit=(
  hyprpolkitagent
)

# Install packages
update_system

install_packages "${fonts[@]}"
install_packages "${hyprland_tools[@]}"
install_packages "${utilities[@]}"
install_packages "${pipewire_tools[@]}"
install_packages "${networking_tools[@]}"
install_packages "${dev_tools[@]}"
install_packages "${compression_tools[@]}"
install_packages "${messaging_tools[@]}"
install_packages "${hyprpolkit[@]}"

# Clean up after installation
cleanup_system

echo "All packages installed and system cleaned up successfully!"
