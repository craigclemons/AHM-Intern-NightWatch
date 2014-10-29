#!/bin/bash
# -------------
#
# -------------


# Config
NWDIR=`pwd`
NWTMP=/tmp/


echo "setup nightwatch - into ${NWDIR}"
cd $NWDIR
npm install nightwatch
curl 'http://selenium-release.storage.googleapis.com/2.43/selenium-server-standalone-2.43.1.jar' > $NWDIR . '/selenium-server-standalone-2.43.1.jar'
chmod +x $NWDIR . '/selenium-server-standalone-2.43.1.jar'

echo "setup grunt - into ${NWDIR}"
cd $NWDIR
npm install -g grunt-cli

echo "setup grunt-nightwatch - into ${NWDIR}"
cd $NWDIR
npm install grunt-nightwatch


