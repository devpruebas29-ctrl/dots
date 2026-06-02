#!/bin/bash
set -e

echo "=== Bootstrap: Instalando paquetes ==="
sudo pacman -S --needed --noconfirm base-devel git stow qt6-base qt6-declarative qt6-tools qt6-svg cmake pipewire bluez upower libdbusmenu-qt6 kitty

echo "=== Instalando yay (AUR helper) ==="
if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay && makepkg -si --noconfirm
fi

echo "=== Instalando Quickshell ==="
yay -S --noconfirm quickshell-git

echo "=== Aplicando symlinks con Stow ==="
cd ~/dotfiles
stow -v hypr quickshell kitty bash

echo "=== Hecho! ==="
echo "Reinicia Hyprland (SUPER M) o ejecuta: hyprctl reload"
