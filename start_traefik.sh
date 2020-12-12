# Updating port to the one Cloud Foundry gave us.
sed -i -e "s/%PORT%/$PORT/g" traefik.yml

# Start Traefik
traefik