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

function phpcs()
{
    docker build -t ${PREFIX}/phpcs:${VERSION} -f docker/Analysis/phpcs/Dockerfile .
}

function phploc()
{
    docker build -t ${PREFIX}/phploc:${VERSION} -f docker/Analysis/phploc/Dockerfile .
}

function phpmd()
{
    docker build -t ${PREFIX}/phpmd:${VERSION} -f docker/Analysis/phpmd/Dockerfile .
}

function phpmetrics()
{
    docker build -t ${PREFIX}/phpmetrics:${VERSION} -f docker/Analysis/phpmd/Dockerfile .
}

function phar()
{
    docker build -t ${PREFIX}/phar:${VERSION} -f docker/Compile/phar/Dockerfile .
}

function phpunit()
{
    docker build -t ${PREFIX}/phpunit:${VERSION} -f docker/Unittest/phpunit/Dockerfile .
}

echo "Start building..."

case $1 in
"all")
    composer
    phpcpd
    phpcs
    phploc
    phpmd
    phar
    phpunit
    ;;
*)
    $1
    ;;
esac

echo "Build success."
