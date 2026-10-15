#!/bin/sh
set -eu

: "${STORMLORD_IMAGEM_TESTE:?defina STORMLORD_IMAGEM_TESTE com a imagem já construída}"
container=$(docker run --detach "$STORMLORD_IMAGEM_TESTE")
trap 'docker rm --force "$container" >/dev/null 2>&1 || true' EXIT HUP INT TERM

for _ in 1 2 3 4 5 6 7 8 9 10 11 12; do
  estado=$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{end}}' "$container")
  if [ "$estado" = healthy ]; then
    exit 0
  fi
  if [ "$estado" = unhealthy ] || [ "$(docker inspect --format '{{.State.Running}}' "$container")" != true ]; then
    docker logs "$container" >&2
    exit 1
  fi
  sleep 5
done

docker logs "$container" >&2
echo "a imagem não ficou saudável" >&2
exit 1
