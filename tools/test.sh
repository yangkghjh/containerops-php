#!/bin/bash

function Composer()
{
    export CO_DATA="git-url=https://github.com/sebastianbergmann/phploc.git entry-file=build.php"
    ./bin/containerops-php Composer
}

function Phpcpd()
{
    export CO_DATA="git-url=https://github.com/TIGERB/easy-php.git"
    ./bin/containerops-php Phpcpd
}

function Phpcs()
{
    export CO_DATA="git-url=https://github.com/squizlabs/PHP_CodeSniffer.git report=full standard=phpcs.xml.dist"
    ./bin/containerops-php Phpcs
}

function Phploc()
{
    export CO_DATA="git-url=https://github.com/TIGERB/easy-php.git exclude=public"
    ./bin/containerops-php Phploc
}

function Phpmd()
{
    export CO_DATA="git-url=https://github.com/TIGERB/easy-php.git"
    ./bin/containerops-php Phpmd
}

function Phpmetrics()
{
    export CO_DATA="git-url=https://github.com/TIGERB/easy-php.git"
    ./bin/containerops-php Phpmetrics
}

function Phars()
{
    export CO_DATA="git-url=https://github.com/SegmentFault/phar-sample.git entry-file=build.php"
    ./bin/containerops-php Phars
}

function Phpunit()
{
    export CO_DATA="git-url=https://github.com/sebastianbergmann/phploc.git --configuration=phpunit.xml composer=true"
    ./bin/containerops-php Phpunit
}

echo "Testing $1"

"$1"

rm -rf ./workspace