#!/bin/sh

function Validate_Parameters() {
    if [ "$1" -ne 3 ]
    then
        return 1
    fi

    if [ "$2" != "R" ] && [ "$2" != "V" ]
    then
        return 1
    fi

    return 0
}

function Print_Usage() {
    echo "Usage: R/V #URL_PREFIX #SS_PASSWORD"
    echo "R - Relay / V - Vnet"
}

function Install_Tool() {
    echo "Installing Git & Curl"
    apt-get update
    apt-get install -y git curl
    echo "Git & Curl are Installed"

    git config --global user.email "jovistar@gmail.com"
    git config --global user.name "jovistar"
    git config --global push.default simple
}

function Download_DNTRS() {
    echo "Downloading DNTRS"
    git clone https://github.com/jovistar/DNTRS.git
    echo "DNTRS is Downloaded"
}

function Initialize_DNTRS() {
    echo "Initializing DNTRS"
    chmod +x Deploy.sh
    chmod +x V2Ray_Start.sh
    chmod +x V2Ray_Stop.sh
    echo "DNTRS is Initialized"
}

function Download_Conf() {
    curl -o "v2ray/config.json" "http://$1.jovistar.io/DNTRS/$2.json"
}

DEPLOY_MODE="$1"
DEPLOY_URL="$2"
SS_PASSWORD="$3"

Validate_Parameters "$#" "$DEPLOY_MODE"
if [ "$?" -eq 1 ]
then
    Print_Usage
    exit 1
fi

Install_Tool

Download_DNTRS

cd DNTRS/Current
Initialize_DNTRS

echo "Deploying V2Ray"
./Deploy.sh

mkdir v2ray
if [ "$DEPLOY_MODE" = "R"]
then
    Download_Conf "$DEPLOY_URL" "relay"
else
    Download_Conf "$DEPLOY_URL" "vnet"
fi
sed -i "s/PASSWORD/$SS_PASSWORD/g" v2ray/config.json

cd v2ray
../V2Ray_Start.sh
cd ../../..
echo "V2Ray is Deployed & Started"

exit 0