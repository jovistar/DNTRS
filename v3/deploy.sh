#!/bin/sh

function write_msg() {
    if [ $# != 1 ]
    then
        return 1
    fi

    echo "[DNTRS Message] : $1"
    return 0
}

function validate_os() {
    write_msg "To Validate OS... (Currently, Only Ubuntu 16.04 LTS is Supported)"
    return 0
}

function validate_args() {
    write_msg "To Validate Args..."

    if [ $1 != 2 ]
    then
        return 1
    fi
    return 0
}

function install_packages() {
    write_msg "To Install Packages..."

    apt-get update || return 1
    apt-get install -y git apt-transport-https ca-certificates curl software-properties-common || return 1
    return 0
}

function config_git() {
    write_msg "To Config Git..."

    git config --global user.email "jovistar@gmail.com"
    git config --global user.name "jovistar"
    git config --global push.default simple
    return 0
}

function install_docker() {
    write_msg "To Install Docker..."

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - || return 1
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" || return 1

    apt-get update || return 1
    apt-get install -y docker-ce || return 1
    return 0
}

function run_plugin() {

}

function create_swarm_
function join_swarm() {
    write_msg "To Join Swarm..." 

    docker swarm join --token $1 $2 || return 1
    return 0
}

validate_os || exit 1
validate_args $# || exit 1
install_packages || exit 1
config_git || exit 1
install_docker || exit 1
run_plugin || exit 1
join_swarm $1 $2 || exit 1

write_msg "Slave is Deployed."