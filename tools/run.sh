#!/bin/bash

source tools/config.sh

function composer()
{
    docker run --env CO_DATA="git-url=https://github.com/sebastianbergmann/phploc.git entry-file=build.php" ${PREFIX}/component-composer:${VERSION}
}

function phpcpd()
{
    docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" ${PREFIX}/phpcpd:${VERSION}
}

function phpunit()
{
    docker run --env CO_DATA="git-url=https://github.com/sebastianbergmann/phploc.git --configuration=phpunit.xml composer=true" containerops/phpunit:latest
}


echo "Run $1"

"$1"

rm -rf ./workspace