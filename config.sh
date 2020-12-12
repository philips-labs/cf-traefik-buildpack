#!/usr/bin/env bash
# config.sh <build_path>

# Default values
TRAEFIK_VERSION=2.3.5
TRAEFIK_ARCH=amd64

# Overwritten values
if [[ -f "$1/traefik.config" ]]; then
  source "$1/traefik.config"
fi