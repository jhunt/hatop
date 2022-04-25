#!/bin/bash

############################
#  Exported variables.     #
############################

export BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $# -lt 1 ]; then
    echo "$0 <pkg_type>"
    exit 1
fi

PKG_TYPE=$1

PKG_SCRIPT="${BASE_DIR}/package_${PKG_TYPE}.sh"

# Check and call script
if [ ! -f $PKG_SCRIPT ]; then
    echo "$PKG_SCRIPT not found"
    exit 1
fi

# Info
export PACKAGE_NAME="hatop"
export PACKAGE_DESCRIPTION="An Interactive ncurses Client for HAProxy"
export PACKAGE_VERSION="0.8.2-rc1"
export PACKAGE_PROGRAM="hatop"

# Directories.
export PACKAGE_PREFIX=/usr
export PACKAGE_BINDIR=${PACKAGE_PREFIX}/bin
export PACKAGE_SHAREDIR=${PACKAGE_PREFIX}/share/${PACKAGE_NAME}
export PACKAGE_MANDIR=${PACKAGE_PREFIX}/share/man
export PACKAGE_OUTPUTDIR="${BASE_DIR}/tmp"
export PACKAGE_TMPDIR="${PACKAGE_OUTPUTDIR}/pkg_${PKG_TYPE}"


. $PKG_SCRIPT
