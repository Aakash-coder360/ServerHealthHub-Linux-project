#!/bin/bash

echo "Starting ServerHealthHub Rocky Linux Node Setup..."

# 1. Update system and install required packages
echo "Installing EPEL repository and Node Exporter..."
sudo dnf update -y
sudo dnf install -y epel-release
sudo dnf install -y node-exporter

# 2. Copy the custom service file
echo "Setting up custom Node Exporter service..."
# Note: This assumes the setup_rocky.sh is running from inside the rocky_setup folder
sudo cp node_exporter.service /etc/systemd/system/
sudo systemctl daemon-reload

# 3. Start and enable the service
echo "Starting Node Exporter..."
sudo systemctl enable --now node_exporter

# 4. Check status
echo "Setup Complete! Node Exporter is running on port 9100."
sudo systemctl status node_exporter --no-pager