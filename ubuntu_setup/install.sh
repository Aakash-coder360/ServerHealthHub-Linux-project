#!/bin/bash
echo "Starting ServerHealthHub Ubuntu Setup..."

# Update system
sudo apt-get update -y

# Install Prometheus and Node Exporter
sudo apt-get install -y prometheus prometheus-node-exporter

# Setup Node Exporter textfile collector
sudo mkdir -p /var/lib/node_exporter/textfile_collector
sudo sed -i 's/ARGS=""/ARGS="--collector.textfile.directory=\/var\/lib\/node_exporter\/textfile_collector"/' /etc/default/prometheus-node-exporter

# Copy bash script to bin
sudo cp check_services.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/check_services.sh

# Install Grafana
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update -y
sudo apt-get install -y grafana

# Start and enable services
sudo systemctl restart prometheus-node-exporter
sudo systemctl restart prometheus
sudo systemctl enable --now grafana-server

echo "Setup Complete! Grafana is available at http://localhost:3000"