#!/bin/sh
set -e

security delete-keychain ios-build.keychain
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/$BUILD_ENVIRONMENT.mobileprovision

echo "===== Last 20 lines of archive_log - Use it for debugging in case of error during archive"
tail -n 20 ./archive_log.txt
