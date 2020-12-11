#!/bin/bash

# Get absolute directory path of the diretory containing adrum-sync.sh script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Get the list of adrum-*.js files
ADRUM_LIST=`curl -ks http://cdn.appdynamics.com/adrum/ | grep td | grep href | cut -d '"' -f 2`

for ADRUM in $ADRUM_LIST; do
    # Download adrum-*.js file
    wget -q -P $DIR/../target/adrum/ $ADRUM

    # Extract version from JS file
    ADRUM_FILENAME=`echo $ADRUM | cut -d "/" -f 5`
    VERSION=`head -n1 $DIR/../target/adrum/$ADRUM_FILENAME | cut -d " " -f 3`

    #Download adrum-ext.*.js & adrum-xd.*.html files correspnding to adrum-*.js version
    wget -q -P $DIR/../target/ http://cdn.appdynamics.com/adrum-ext.$VERSION.js
    wget -q -P $DIR/../target/ http://cdn.appdynamics.com/adrum-xd.$VERSION.html
done

# Cleanup duplicate downloads
rm -f $DIR/../target/*.js.*
rm -f $DIR/../target/*.js.*
rm -f $DIR/../target/*.html.*