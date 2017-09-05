#!/bin/bash

source tools/config.sh

echo "Start building..."

cd base
docker build -t ${PREFIX}php:$VERSION --build-arg php_version=7.1.4 .
docker push ${PREFIX}php:$VERSION
cd ..

list=( \
    "analysis-php-phpcpd" \
    "analysis-php-phpcs" \
    "analysis-php-phploc" \
    "analysis-php-phpmd" \
    "analysis-php-phpmetrics" \
    "base-php-cli" \
    "compile-php-beast" \
    "compile-php-phar" \
    "dependence-php-composer" \
    "document-php-apigen" \
    "document-php-phpdox" \
    "unittest-php-phpunit" \
    )

paths=( \
    "cd dist/Analysis/phpcpd" \
    "cd ../phpcs" \
    "cd ../phploc" \
    "cd ../phpmd" \
    "cd ../phpmetrics" \
    "cd ../../Base/cli" \
    "cd ../../Compile/beast" \
    "cd ../phar" \
    "cd ../../Dependence/component-composer" \
    "cd ../../Document/apigen" \
    "cd ../phpdox" \
    "cd ../../Unittest/phpunit" \
)

for i in {0..11}; do
    ${paths[$i]}
    echo "Build $PREFIX${list[$i]}:$VERSION"
    docker build -t $PREFIX${list[$i]}:$VERSION .
    docker push $PREFIX${list[$i]}:$VERSION
done


echo "Build finished."
