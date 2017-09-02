#!/bin/bash

source tools/config.sh

echo "Start building..."

cd base
docker build -t ${PREFIX}php:$VERSION --build-arg php_version=7.1.4 .
docker push ${PREFIX}php:$VERSION
cd ..

list=( \
    "analysis_php_phpcpd" \
    "analysis_php_phpcs" \
    "analysis_php_phploc" \
    "analysis_php_phpmd" \
    "analysis_php_phpmetrics" \
    )

paths=( \
    "cd dist/Analysis/phpcpd" \
    "cd ../phpcs" \
    "cd ../phploc" \
    "cd ../phpmd" \
    "cd ../phpmetrics" \
)

for i in {0..4}; do
    ${paths[$i]}
    echo "Build $PREFIX${list[$i]}:$VERSION"
    docker build -t $PREFIX${list[$i]}:$VERSION .
    docker push $PREFIX${list[$i]}:$VERSION
done


echo "Build finished."
