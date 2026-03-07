#!/usr/bin/env bash
set -euo pipefail

# Builds Android release artifact for the restored Xamarin client project.
# Required env vars:
#   CLIENT_SOLUTION_PATH (default: client/GoalTactics.Mobile.sln)
#   GT_SIGNING_KEYSTORE
#   GT_SIGNING_STORE_PASSWORD
#   GT_SIGNING_KEY_ALIAS
#   GT_SIGNING_KEY_PASSWORD

CLIENT_SOLUTION_PATH="${CLIENT_SOLUTION_PATH:-client/GoalTactics.Mobile.sln}"
GT_BACKEND_URL="${GT_BACKEND_URL:-https://gt.nikolai-linschmann.de}"

: "${GT_SIGNING_KEYSTORE:?GT_SIGNING_KEYSTORE is required}"
: "${GT_SIGNING_STORE_PASSWORD:?GT_SIGNING_STORE_PASSWORD is required}"
: "${GT_SIGNING_KEY_ALIAS:?GT_SIGNING_KEY_ALIAS is required}"
: "${GT_SIGNING_KEY_PASSWORD:?GT_SIGNING_KEY_PASSWORD is required}"

if [[ ! -f "$CLIENT_SOLUTION_PATH" ]]; then
  echo "Client solution not found: $CLIENT_SOLUTION_PATH"
  echo "Restore the Xamarin client project into this workspace and rerun."
  exit 2
fi

echo "Building release client against host: $GT_BACKEND_URL"

msbuild "$CLIENT_SOLUTION_PATH" \
  /t:Restore,Build \
  /p:Configuration=Release \
  /p:Platform=AnyCPU \
  /p:AndroidKeyStore=true \
  /p:AndroidSigningKeyStore="$GT_SIGNING_KEYSTORE" \
  /p:AndroidSigningStorePass="$GT_SIGNING_STORE_PASSWORD" \
  /p:AndroidSigningKeyAlias="$GT_SIGNING_KEY_ALIAS" \
  /p:AndroidSigningKeyPass="$GT_SIGNING_KEY_PASSWORD"

echo "Release build complete. Locate APK/AAB under the Android project's bin/Release output."
