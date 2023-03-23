#!/usr/bin/env bash
set -Eeuo pipefail
source venv/bin/activate
exec python ./webui.py "$@"
