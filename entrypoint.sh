#!/bin/sh

# Start the Docker daemon.
dockerd > dockerd.log 2>&1 &

# Ensure the Docker daemon is stopped when the script exits.
DOCKER_PID=$!
trap "kill $DOCKER_PID" EXIT

exec $@
