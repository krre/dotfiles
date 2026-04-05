#!/usr/bin/env bash
set -e

for dir in caddy postgres grafana blog ocean; do
  echo "Directory: $dir"
  (cd "$dir" && docker compose up -d)
done
