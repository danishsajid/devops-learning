#!/bin/bash
echo "Network Information:"
echo "===================="
echo "IP Addresses:"
ip addr show | grep "inet" | awk '{print $2}' | head -5
echo ""
echo "Active Network Connection:"
ss -tuln | head -10
echo ""
echo "Network Interface Status:"
ip link show | grep -E "^[0-9]+" | head -5

