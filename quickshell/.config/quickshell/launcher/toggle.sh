#!/bin/bash
# Write to FIFO and close (writing with single redirection closes after write)
echo "toggle" > /tmp/quickshell-launcher-fifo
