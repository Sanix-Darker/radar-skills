#!/usr/bin/env bash
set -euo pipefail

if ! command -v radar >/dev/null 2>&1; then
  if ! command -v cargo >/dev/null 2>&1; then
    echo "radar binary not found and cargo is unavailable"
    exit 1
  fi
  cargo install --locked --force rdar
fi

if ! radar --version >/dev/null 2>&1; then
  echo "radar command exists but is not executable"
  exit 1
fi

radar map
