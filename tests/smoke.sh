#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)

printf '==> Running canonical smoke tests for dotfiles-bspwm...\n'

printf '\n--> 1/2: Executing bootstrap smoke tests...\n'
"$SCRIPT_DIR/bootstrap-smoke.sh"

printf '\n--> 2/2: Executing session smoke tests...\n'
"$SCRIPT_DIR/session-smoke.sh"

printf '\nOK: all bspwm smoke tests passed successfully\n'
