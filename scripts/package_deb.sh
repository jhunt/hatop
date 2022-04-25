#!/bin/bash

echo $BASE_DIR

if [[ -f /etc/upstream-release/lsb-release ]]; then
    source /etc/upstream-release/lsb-release
elif [[ -f /etc/lsb-release ]]; then
    source /etc/lsb-release
else
    echo "ERROR: could not determine debian release."
    exit 1
fi

DISTRIB_ID=$(echo $DISTRIB_ID | tr '[:upper:]' '[:lower:]')

# Default to 1 if no release is set.
if [[ -z $RELEASE ]]; then
    RELEASE="1"
fi

PACKAGE_FULLNAME="${PACKAGE_NAME}_${PACKAGE_VERSION}-${RELEASE}-${DISTRIB_ID}-${DISTRIB_RELEASE}_all"

rm -fr ${PACKAGE_TMPDIR}

# Create debian files.
mkdir -p ${PACKAGE_TMPDIR}/DEBIAN
echo "Package: ${PACKAGE_NAME}
Version: ${PACKAGE_VERSION}-${RELEASE}
Section: admin
Priority: extra
Architecture: all
Depends: python (>= 2.4)
Homepage: https://github.com/jhunt/hatop
Maintainer: James Hunt <james@jameshunt.us>
Description: ${PACKAGE_DESCRIPTION}" &> ${PACKAGE_TMPDIR}/DEBIAN/control

if [ -f "${BASE_DIR}/deb_custom_control" ]; then
    cat "${BASE_DIR}/deb_custom_control" >> ${PACKAGE_TMPDIR}/DEBIAN/control
fi

cat ${PACKAGE_TMPDIR}/DEBIAN/control

# Copy program
mkdir -p ${PACKAGE_TMPDIR}/${PACKAGE_BINDIR}
cp ${BASE_DIR}/../bin/${PACKAGE_PROGRAM} ${PACKAGE_TMPDIR}/${PACKAGE_BINDIR}/${PACKAGE_NAME}

# Copy man file
mkdir -p ${PACKAGE_TMPDIR}/${PACKAGE_MANDIR}/man1
cp ${BASE_DIR}/../man/hatop.1 ${PACKAGE_TMPDIR}/${PACKAGE_MANDIR}/man1
gzip ${PACKAGE_TMPDIR}/${PACKAGE_MANDIR}/man1/hatop.1

# Copy some documentation files
mkdir -p ${PACKAGE_TMPDIR}/${PACKAGE_SHAREDIR}
cp ${BASE_DIR}/../CHANGES.rst \
    ${BASE_DIR}/../KEYBINDS \
    ${BASE_DIR}/../README.rst \
    ${PACKAGE_TMPDIR}/${PACKAGE_SHAREDIR}

fakeroot dpkg-deb --build ${PACKAGE_TMPDIR} ${PACKAGE_OUTPUTDIR}/${PACKAGE_FULLNAME}.deb
