#!/bin/bash
set -e

#=====================================================
#Script Name: network-info.sh
#Description: Outputs Network Information excluding
#             loopback.
#Author: Danish Sajid
#Date: July 9th, 2025
#Usage: ./network-info.sh
#=====================================================


echo "Network Information:"
echo "===================="
echo "IPv4 Addresses (excluding loopback):"
ip -4 addr show | grep -v '127.0.0.1' | grep "inet" | awk '{print $2}'
echo ""
echo "IPv6 Addresses (excluding loopback):"
ip -6 addr show | grep -v '::1' | grep 'inet6' | awk '{print $2}'
echo ""
echo "Active Listening Ports (TCP/UDP):"
ss -tulnH | head -10
echo ""
echo "Network Interface Status:"
ip -br link show
echo ""
