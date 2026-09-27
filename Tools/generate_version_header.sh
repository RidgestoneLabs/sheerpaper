#!/bin/bash

pushd `dirname $0` > /dev/null
source "$(pwd -P)"/utils.sh
popd > /dev/null

SHORT_VERSION=$(get_short_version)
BUNDLE_VERSION=$(get_bundle_version)

printf "#ifndef VERSION_H
#define VERSION_H

static const char * const kMPApplicationShortVersion = \"$SHORT_VERSION\";
static const char * const kMPApplicationBundleVersion = \"$BUNDLE_VERSION\";

#endif
" > version.h.tmp

# Leave an up-to-date header untouched so its importers don't recompile.
if cmp -s version.h.tmp version.h; then
    rm version.h.tmp
else
    mv version.h.tmp version.h
fi
