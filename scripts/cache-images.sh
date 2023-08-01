# Set the docker compose file
COMPOSE_FILE=./src/docker-compose.yml

# Get image names
IMAGES=$(docker-compose -f $COMPOSE_FILE config | grep image: | awk '{print $2}')

# Loop through image names
for IMAGE in $IMAGES; do
  echo "Caching $IMAGE"

  # Save each image to a tar file
  docker pull $IMAGE
  docker save $IMAGE -o images/${IMAGE//[:\/]/_}.tar
done
