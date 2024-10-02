#!/bin/bash

# Clear the terminal
clear

# List available network interfaces (excluding loopback) and their IP addresses
interfaces=$(ip -o -4 addr show | grep -v "127.0.0.1" | awk '{print $2, $4}' | cut -d/ -f1)

# Check if there are any available interfaces
if [ -z "$interfaces" ]; then
    echo "No active network interface available (excluding loopback)."
    exit 1
fi

echo "Available network interfaces:"
echo "$interfaces" | nl -v 1

# Prompt the user to select an interface
read -p "Select an interface (number): " interface_choice

# Get the selected interface and its corresponding IP address
selected_interface=$(echo "$interfaces" | sed -n "${interface_choice}p" | awk '{print $1}')
ip_addr=$(echo "$interfaces" | sed -n "${interface_choice}p" | awk '{print $2}')

# Check if a valid interface and IP address have been selected
if [ -z "$selected_interface" ] || [ -z "$ip_addr" ]; then
    echo "Invalid selection."
    exit 1
fi

# Extract the first three octets of the IP address to form the subnet
subnet=$(echo $ip_addr | cut -d'.' -f1-3)

echo "Selected interface: $selected_interface"
echo "Interface IP address: $ip_addr"
echo "Scanning subnet $subnet.0/24..."

# Function to ping a given IP address
ping_ip() {
    local ip=$1
    # Ping the IP with a single request and a 1-second timeout, suppressing errors
    if ping -c 1 -W 1 "$ip" &> /dev/null; then
        echo "Active machine: $ip"
    fi
}

# Loop to ping all IP addresses in the subnet in parallel
for i in $(seq 1 254); do
    ip="$subnet.$i"
    ping_ip "$ip" &  # Launch each ping in the background
done

# Wait for all background pings to finish
wait

echo "Scan complete."
