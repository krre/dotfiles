#!/usr/bin/env bash
set -e

for dir in caddy postgres blog ocean; do
  (cd "$dir" && docker compose up -d)
done
