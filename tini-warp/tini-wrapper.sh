#!/usr/bin/env bash
set -Eeo pipefail

# translate SIGTERM to SIGQUIT for graceful shutdown
graceful_shutdown() {
    echo "SIGTERM received, sending SIGQUIT to Kong..."
    # get PID of Kong's master process
    local kong_pid=$(pgrep -f "/usr/local/openresty/nginx/sbin/nginx")
    # send SIGQUIT to master and all workers
    kill -SIGQUIT "$kong_pid"
}

trap 'graceful_shutdown' SIGTERM

exec /entrypoint.sh kong docker-start
