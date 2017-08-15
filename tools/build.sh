#!/bin/bash

source tools/config.sh

function composer()
{
    docker build -t ${PREFIX}/component-composer:${VERSION} -f docker/Dependence/component-composer/Dockerfile .
}

function phpcpd()
{
    docker build -t ${PREFIX}/phpcpd:${VERSION} -f docker/Analysis/phpcpd/Dockerfile .
}

echo "Start building..."

case $1 in
"composer")
    composer
    ;;
"phpcpd")
    phpcpd
    ;;
"all")
    composer
    phpcpd
    ;;
*)
    echo "No such component: $1.\n"
    exit
    ;;
esac

echo "Build success."
