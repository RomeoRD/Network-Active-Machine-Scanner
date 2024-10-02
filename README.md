# Network Active Machine Scanner

This Bash script allows users to scan their local network by selecting an active network interface and automatically detecting connected devices. It provides a simple command-line interface for listing available network interfaces (excluding loopback) and allows users to select one for scanning.

## Features

- **Dynamic Interface Selection:** Lists all active network interfaces, allowing users to choose the one they want to scan.
- **IP Address Scanning:** Utilizes the selected interface's IP address to determine the subnet for scanning.
- **Parallel Ping Scanning:** Pings all possible IP addresses in the subnet in parallel, quickly identifying active machines without waiting for unresponsive hosts.
- **Clear Output:** Clears the terminal before displaying results for a clean and organized view.

## Usage

1. Clone the repository or download the script.
2. Make the script executable:
   ```bash
   chmod +x network_scan.sh
