#!/bin/bash

source tools/config.sh

function base()
{
    cd base
    docker build -t containerops/composer:latest --build-arg php_version=7.1.4 .
    cd ..
}

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

function cli()
{
    docker build -t ${PREFIX}/cli:${VERSION} -f docker/Base/cli/Dockerfile .
}

function beast()
{
    docker build -t ${PREFIX}/beast:${VERSION} -f docker/Compile/beast/Dockerfile .
}

function apigen()
{
    docker build -t ${PREFIX}/apigen:${VERSION} -f docker/Document/apigen/Dockerfile .
}

function phpdox()
{
    docker build -t ${PREFIX}/phpdox:${VERSION} -f docker/Document/phpdox/Dockerfile .
}

echo "Start building..."

case $1 in
"all")
    base
    composer
    phpcpd
    phpcs
    phploc
    phpmd
    phpmetrics
    phar
    phpunit
    cli
    beast
    apigen
    phpdox
    ;;
*)
    $1
    ;;
esac

echo "Build finished."
