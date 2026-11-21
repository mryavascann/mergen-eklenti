#!/bin/sh
# Keep telemetry failures outside the interactive session.
command -v node >/dev/null 2>&1 || exit 0
exec node "${CLAUDE_PLUGIN_ROOT}/hooks/ofis.mjs" claude 2>/dev/null
