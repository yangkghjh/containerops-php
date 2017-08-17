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

function phpcs()
{
    docker run --env CO_DATA="git-url=https://github.com/squizlabs/PHP_CodeSniffer.git report=full standard=phpcs.xml.dist" ${PREFIX}/phpcs:${VERSION}
}

function phploc()
{
    docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git exclude=public" ${PREFIX}/phploc:${VERSION}
}

function phpmd()
{
    docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" ${PREFIX}/phpmd:${VERSION}
}

function phpmetrics()
{
    docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" ${PREFIX}/phpmetrics:${VERSION}
}

function phar()
{
    docker run --env CO_DATA="git-url=https://github.com/SegmentFault/phar-sample.git entry-file=build.php" ${PREFIX}/phar:${VERSION}
}

function phpunit()
{
    docker run --env CO_DATA="git-url=https://github.com/sebastianbergmann/phploc.git --configuration=phpunit.xml composer=true" ${PREFIX}/phpunit:${VERSION}
}

function cli()
{
    docker run --env CO_DATA="git-url=https://github.com/wp-cli/wp-cli.git file=./bin/wp composer=true" ${PREFIX}/cli:${VERSION}
}

function beast()
{
    docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" ${PREFIX}/beast:${VERSION}
}

function apigen()
{
    docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git path=app destination=docs" ${PREFIX}/apigen:${VERSION}
}

function phpdox()
{
    docker run --env CO_DATA="git-url=https://github.com/theseer/phpdox.git" ${PREFIX}/phpdox:${VERSION}
}

echo "Run $1"

"$1"

rm -rf ./workspace