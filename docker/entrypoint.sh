#!/usr/bin/env bash
set -Eeuo pipefail
source /webui/venv/bin/activate

export venv_dir="-"
exec ./webui.sh "$@"
