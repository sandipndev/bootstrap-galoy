#!/bin/sh

# Start the Docker daemon.
dockerd > dockerd.log 2>&1 &

# Ensure the Docker daemon is stopped when the script exits.
DOCKER_PID=$!
trap "kill $DOCKER_PID" EXIT

sleep 2
while ! docker ps >/dev/null 2>&1
do
  echo "Waiting for Docker service..."
  sleep 1
done

if [ -z "$(docker images -q)" ]; then
  for IMAGE in /images/*.tar; do docker load -i $IMAGE; rm $IMAGE; done
fi

docker compose up e2e -d
docker compose logs -f
