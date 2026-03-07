#!/usr/bin/env bash
set -euo pipefail

# Builds Android debug artifact for the restored Xamarin client project.
# Required env vars:
#   CLIENT_SOLUTION_PATH (default: client/GoalTactics.Mobile.sln)
#   GT_BACKEND_URL (default set to phase-3 host)

CLIENT_SOLUTION_PATH="${CLIENT_SOLUTION_PATH:-client/GoalTactics.Mobile.sln}"
GT_BACKEND_URL="${GT_BACKEND_URL:-https://gt.nikolai-linschmann.de}"

if [[ ! -f "$CLIENT_SOLUTION_PATH" ]]; then
  echo "Client solution not found: $CLIENT_SOLUTION_PATH"
  echo "Restore the Xamarin client project into this workspace and rerun."
  exit 2
fi

echo "Building debug client against host: $GT_BACKEND_URL"

# Caller should ensure any app config maps URLHelper/NewBackendUrl to GT_BACKEND_URL.
msbuild "$CLIENT_SOLUTION_PATH" \
  /t:Restore,Build \
  /p:Configuration=Debug \
  /p:Platform=AnyCPU

echo "Debug build complete. Locate APK under the Android project's bin/Debug output."
