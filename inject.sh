#!/usr/local/bin/bash

export SHORT_SHA="1234"

for f in base/*; do 
    export _SERVICE_NAME="`basename $f .yaml`"
    echo "🏦 Service name: ${_SERVICE_NAME}"
    export _SUBST="image: gcr.io/${PROJECT_ID}/cymbal-bank/release/${_SERVICE_NAME}:${SHORT_SHA}"
    echo "🐳 Injecting image tag: $_SUBST > $f"  
    gsed -i "s|image: $_SERVICE_NAME|$_SUBST|g" $f 
done 
