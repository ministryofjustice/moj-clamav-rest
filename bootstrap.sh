#!/bin/bash

set -m

host=${HOST:-localhost}
port=${PORT:-3310}

echo "using clamd server: $host:$port"

# start in background
java -jar /var/clamav-rest/clamav-rest-1.0.0.jar --clamd.host=$host --clamd.port=$port
