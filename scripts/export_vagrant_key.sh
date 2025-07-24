#!/bin/bash

# ==========================================
# Utility to export SSH key from .vagrant
# ==========================================

# ------------------------------------------
# Step 1: Ask for .vagrant key path
# ------------------------------------------
read -rp "> Introduce la ruta completa a tu clave privada en Vagrant (comando 'vagrant ssh-config'): " VAGRANT_KEY_PATH

# ------------------------------------------
# Step 2: Validate existence
# ------------------------------------------
if [[ ! -f "$VAGRANT_KEY_PATH" ]]; then
  echo "[ERROR] No se encontró la clave privada en: $VAGRANT_KEY_PATH"
  exit 1
fi

# ------------------------------------------
# Step 3: Ask for destination name
# ------------------------------------------
read -rp "> Introduce el nombre del archivo a guardar en ~/.ssh (ej: vagrant_key): " DEST_NAME
DEST_PATH="$HOME/.ssh/$DEST_NAME"

# ------------------------------------------
# Step 4: Copy key and set permissions
# ------------------------------------------
mkdir -p "$HOME/.ssh"
cp "$VAGRANT_KEY_PATH" "$DEST_PATH"
chmod 600 "$DEST_PATH"

# ------------------------------------------
# Step 5: Final message
# ------------------------------------------
echo "[OK] Clave copiada en: $DEST_PATH"
echo "[INFO] Recuerda usar esta ruta en Ansible:"
echo "       ansible_ssh_private_key_file: $DEST_PATH"
