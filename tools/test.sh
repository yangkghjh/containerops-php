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

function Cli()
{
    export CO_DATA="git-url=https://github.com/wp-cli/wp-cli.git file=./bin/wp composer=true"
    ./bin/containerops-php Cli
}

function Beast()
{
    export CO_DATA="git-url=https://github.com/TIGERB/easy-php.git"
    ./bin/containerops-php Beast
}

function Apigen()
{
    export CO_DATA="git-url=https://github.com/TIGERB/easy-php.git path=app destination=docs"
    ./bin/containerops-php Apigen
}

function Phpdox()
{
    export CO_DATA="git-url=https://github.com/theseer/phpdox.git"
    ./bin/containerops-php Phpdox
}

echo "Testing $1"

"$1"

rm -rf ./workspace