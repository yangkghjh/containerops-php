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

echo "Testing $1"

"$1"

rm -rf ./workspace