#!/usr/bin/env bash
set -Eeuo pipefail
python3 -m venv venv
exec ./webui.sh "$@"
