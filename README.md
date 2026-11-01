# ServerHealthHub 🖥️📊

A fleet health-check system that generates daily reports about CPU, RAM, disk, network, and services.

## 🛠️ Tech Stack Used
* **OS:** Rocky Linux & Ubuntu
* **Scripting:** Bash, awk, sed
* **Monitoring:** Prometheus, Node Exporter
* **Visualization:** Grafana
* **Automation:** Systemd Timers / Cron

## 📂 Project Structure
* `/ubuntu_setup/` - Contains Prometheus config, Grafana Dashboard JSON, and Bash scripts.
* `/rocky_setup/` - Contains Node Exporter systemd service configuration.

## 🚀 How it works
1. `check_services.sh` checks if SSH, Cron, Prometheus, and Grafana are running.
2. It outputs the status to `services.prom`.
3. Node Exporter reads this file using the `textfile_collector`.
4. Prometheus scrapes Node Exporter on port `9101`.
5. Grafana visualizes the data in a custom dashboard.



