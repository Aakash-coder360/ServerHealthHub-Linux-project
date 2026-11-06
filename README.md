# ServerHealthHub 🖥️📊

A fleet health-check system that generates daily reports and monitors the health of CPU, RAM, disk, network, and critical services across multiple Linux servers.

## 🛠️ Tech Stack Used
* **Operating Systems:** Rocky Linux & Ubuntu
* **Scripting:** Bash, awk, sed
* **Monitoring:** Prometheus, Node Exporter
* **Visualization:** Grafana
* **Infrastructure as Code:** Vagrant & VirtualBox

## 📂 Project Structure
* `/ubuntu_setup/` - Contains Prometheus config, Grafana Dashboard JSON, `check_services.sh`, and `install.sh` (automation script).
* `/rocky_setup/` - Contains custom Node Exporter systemd service and `setup_rocky.sh` (automation script).
* `Vagrantfile` - Automates the provisioning of Ubuntu and Rocky Linux VMs.

## 🚀 How it Works
1. The `check_services.sh` script runs on the Ubuntu server (via Cron/Systemd) to check if critical services (SSH, Cron, Prometheus, Grafana) are active.
2. It outputs the status as metrics to `/var/lib/node_exporter/textfile_collector/services.prom`.
3. Node Exporter reads this custom `.prom` file using the `textfile_collector`.
4. Prometheus scrapes metrics from both Ubuntu (`localhost:9100`) and Rocky Linux (`192.168.56.12:9100`).
5. Grafana queries Prometheus to visualize the fleet health on a centralized dashboard.

## 💻 How to Run (Full Setup)

**Prerequisites:** Ensure you have [Vagrant](https://developer.hashicorp.com/vagrant/downloads) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed.

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Aakash-coder360/ServerHealthHub-Linux-project.git
   cd ServerHealthHub-Linux-project
