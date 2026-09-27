#!/bin/bash
# Signs a built Sheerpaper.app for distribution with the hardened runtime and
# a secure timestamp, as notarization requires. Nested code is signed first,
# since signing a bundle seals the signatures of everything inside it.
#
# Usage: Tools/sign_app.sh <path to Sheerpaper.app> <signing identity>

set -euo pipefail

APP="$1"
IDENTITY="$2"
SPARKLE="$APP/Contents/Frameworks/Sparkle.framework"
AUTOUPDATE="$SPARKLE/Versions/A/Resources/Autoupdate.app"

sign() {
    codesign --force --timestamp --options runtime --sign "$IDENTITY" "$@"
}

sign "$AUTOUPDATE/Contents/MacOS/fileop"
sign "$AUTOUPDATE"
sign "$SPARKLE"
sign "$APP/Contents/SharedSupport/bin/sheerpaper"
sign "$APP"

codesign --verify --deep --strict --verbose=2 "$APP"
