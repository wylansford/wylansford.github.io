#!/bin/bash

# Simple script to run the static site locally

PORT=8000

echo "Starting local server on http://localhost:$PORT"
echo "Press Ctrl+C to stop the server"
echo ""

# Check if Python 3 is available
if command -v python3 &> /dev/null; then
    python3 -m http.server $PORT
# Check if Python 2 is available
elif command -v python &> /dev/null; then
    python -m SimpleHTTPServer $PORT
# Check if Node.js http-server is available
elif command -v http-server &> /dev/null; then
    http-server -p $PORT
# Check if PHP is available
elif command -v php &> /dev/null; then
    php -S localhost:$PORT
else
    echo "No suitable web server found!"
    echo ""
    echo "You can install one of these:"
    echo "  - Python 3: Already installed on most systems"
    echo "  - Node.js http-server: npm install -g http-server"
    echo "  - PHP: brew install php (on macOS)"
    exit 1
fi