#!/usr/bin/env bash
set -e

for dir in blog ocean grafana caddy postgres; do
  echo "Directory: $dir"
  (cd "$dir" && docker compose down)
done
