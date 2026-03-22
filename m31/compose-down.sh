#!/usr/bin/env bash
set -e

for dir in blog ocean caddy postgres; do
  (cd "$dir" && docker compose down)
done
