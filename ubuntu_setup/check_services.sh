#!/bin/bash
OUTPUT_DIR="/var/lib/node_exporter/textfile_collector"
OUT_FILE="$OUTPUT_DIR/services.prom"
TMP_FILE="${OUT_FILE}.tmp"

SERVICES=("ssh" "cron" "prometheus" "grafana-server")

echo "# HELP service_up Whether the service is active (1=up, 0=down)" > "$TMP_FILE"
echo "# TYPE service_up gauge" >> "$TMP_FILE"

for svc in "${SERVICES[@]}"; do
  status=$(systemctl is-active "$svc" 2>/dev/null)
  if [ "$status" = "active" ]; then
    echo "service_up{name=\"$svc\"} 1" >> "$TMP_FILE"
  else
    echo "service_up{name=\"$svc\"} 0" >> "$TMP_FILE"
  fi
done
mv "$TMP_FILE" "$OUT_FILE"
