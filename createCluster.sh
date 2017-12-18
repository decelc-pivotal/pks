#!/bin/bash

function all() {
    apiHost
    serviceHost
    clusterName
    authMode
    creds
    instances
}

function apiHost() {
    echo Enter PKS_API_ENDPOINT.
    read varname
    export PKS_API_ENDPOINT=$varname        
    echo PKS_API_ENDPOINT=$PKS_API_ENDPOINT
}

function serviceHost() {
    echo Enter KUBERNETES_SERVICE_HOST.
    read varname
    export KUBERNETES_SERVICE_HOST=$varname         
    echo KUBERNETES_SERVICE_HOST=$KUBERNETES_SERVICE_HOST
}

function clusterName() {
    echo Enter CLUSTER_NAME.
    read varname
    export CLUSTER_NAME=$varname            
    echo CLUSTER_NAME=$CLUSTER_NAME
}

function authMode() {
    echo Enter AUTHORIZATION_MODE '(default=rbac)'.
    read varname
    if [ -z "$varname" ]
    then
        varname="rbac"
    fi
    export AUTHORIZATION_MODE=$varname      
    echo AUTHORIZATION_MODE=$AUTHORIZATION_MODE
}

function creds() {
    echo Enter PKS_API_CREDS.
    read varname
    export PKS_API_CREDS=$varname           
    echo PKI_API_CREDS=$PKS_API_CREDS
}

function instances() {
    echo Enter number of instances '(default=3)'.
    read varname
    if [ -z "$varname" ]
    then
        varname="3"
    fi
    export KUBERNETES_WORKER_INSTANCES=$varname
    echo KUBERNETES_WORKER_INSTANCES=$KUBERNETES_WORKER_INSTANCES
}

function printEnv() {
    echo CLUSTER_NAME=$CLUSTER_NAME
    echo PKS_API_ENDPOINT=$PKS_API_ENDPOINT
    echo KUBERNETES_SERVICE_HOST=$KUBERNETES_SERVICE_HOST
    echo AUTHORIZATION_MODE=$AUTHORIZATION_MODE
    echo KUBERNETES_WORKER_INSTANCES=$KUBERNETES_WORKER_INSTANCES
    echo PKS_API_CREDS=$PKS_API_CREDS
}

COLUMNS=12
prompt="Pick an option:"
echo "#########################################################################"
echo "# Set env variable(s) for create cluster, login to your PKS API first.  #"
echo "# pks login -a PKS_API -u USERNAME -p PASSWORD                          #"
echo "# https://docs-pks.cfapps.io/pks/using.html                             #"
echo "#########################################################################"
PS3="$prompt "
options=("all" "api host" "service host" "cluster name" "auth mode" "creds" "instances" "print" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "all")
            all
            break
            ;;
        "api host")
            apiHost
            break
            ;;
        "service host")
            serviceHost
            break
            ;;
        "cluster name")
            clusterName
            break
            ;;
        "auth mode")
            authMode
            break
            ;;
        "creds")
            creds
            break
            ;;
        "instances")
            instances
            break
            ;;
        "print")
            printEnv
            break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
