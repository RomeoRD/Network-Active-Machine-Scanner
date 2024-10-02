# Network Active Machine Scanner

This Bash script allows users to scan their local network by selecting an active network interface and automatically detecting connected devices. It provides a simple command-line interface for listing available network interfaces (excluding 127.0.0.1) and allows users to select one for scanning.
I used ChatGPT for learning purpose.

## Features

- **Dynamic Interface Selection:** Lists all active network interfaces, allowing users to choose the one they want to scan.
- **Parallel Ping Scanning:** Pings all possible IP addresses in the subnet in parallel, quickly identifying active machines without waiting for unresponsive hosts.


## Usage

```bash
bash <(wget -qO- https://raw.githubusercontent.com/RomeoRD/Network-Active-Machine-Scanner/refs/heads/main/netscan.sh)
