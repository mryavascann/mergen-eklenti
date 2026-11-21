# Use the same event projection and timeout as the POSIX launcher.
try {
  if (Get-Command node -ErrorAction SilentlyContinue) {
    [Console]::In.ReadToEnd() | node (Join-Path $env:CLAUDE_PLUGIN_ROOT 'hooks/ofis.mjs') claude 2>$null
  }
} catch {}
exit 0
