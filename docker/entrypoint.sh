#!/usr/bin/env bash
set -Eeuo pipefail
if [[ ! -f /webui/venv/bin/activate ]]; then
    python3 -m venv /webui/venv
    source /webui/venv/bin/activate
    pip install -U pip wheel
else
    source /webui/venv/bin/activate
fi
export venv_dir="-"
exec ./webui.sh "$@"
