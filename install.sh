#!/bin/bash
# FTP Manager one-command installer (works via curl | bash)

# GitHub repo raw URLs
BASE_URL="https://raw.githubusercontent.com/oliwebd/ftp-manager/main"
SCRIPT_URL="$BASE_URL/ftp-servers"
CONFIG_URL="$BASE_URL/ftp-servers.conf"

# Target installation directory
TARGET_DIR="/usr/local/bin"

echo "Installing FTP Manager..."

# Download ftp-servers
# NOTE: Ensure the script at this URL includes the 'ftpO' case
sudo curl -fsSL "$SCRIPT_URL" -o "$TARGET_DIR/ftp-servers"
sudo chmod +x "$TARGET_DIR/ftp-servers"

# Download ftp-servers.conf if not exists
if [ ! -f "$TARGET_DIR/ftp-servers.conf" ]; then
  sudo curl -fsSL "$CONFIG_URL" -o "$TARGET_DIR/ftp-servers.conf"
fi

# Create symlinks for short commands
sudo ln -sf "$TARGET_DIR/ftp-servers" "$TARGET_DIR/ftpS"
sudo ln -sf "$TARGET_DIR/ftp-servers" "$TARGET_DIR/ftpX"
sudo ln -sf "$TARGET_DIR/ftp-servers" "$TARGET_DIR/ftpR"
sudo ln -sf "$TARGET_DIR/ftp-servers" "$TARGET_DIR/ftpA"
# -------------------------------------------------------------------
# NEW: Symlink for ftpO (Clear All Config and Stop)
# -------------------------------------------------------------------
sudo ln -sf "$TARGET_DIR/ftp-servers" "$TARGET_DIR/ftpO"

echo "FTP Manager installed successfully!"
echo "Use ftpS/ftpX/ftpR/ftpA/ftpO commands to manage your servers."
