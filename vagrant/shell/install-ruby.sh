#!/usr/bin/env bash
#
# Switch to ruby using Ruby Version Manager and install if missing

# add rvm shell integration
source /usr/local/rvm/scripts/rvm

# Switch to ruby 1.9.3 and install if needed
echo "Switching to Ruby version $1..."
rvm --quiet-curl --default use --install $1 2>/dev/null 1>/dev/null