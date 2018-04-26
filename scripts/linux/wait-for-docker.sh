while [ ! -S /var/run/docker.sock ]; do
  sleep 1
done
