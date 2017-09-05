# Containerops-php

[![Build Status](https://travis-ci.org/yangkghjh/containerops-php.svg?branch=master)](https://travis-ci.org/yangkghjh/containerops-php)

PHP componets for [containerops](https://github.com/Huawei/containerops).


## List

| Type | Componets | Introduction |
| :--- | :--- | :--- |
| Analysis | phpcpd |  |
| Analysis | phpcs |  |
| Analysis | phploc |  |
| Analysis | phpmd |  |
| Analysis | phpmetrics |  |
| Base | cli |  |
| Compile | beast |  |
| Compile | phar |  |
| Dependence | component-composer |  |
| Document | apigen |  |
| Document | phpdox |  |
| Unittest | phpunit |  |

## Usage

```shell
git clone https://github.com/yangkghjh/containerops-php.git
cd containerops-php
./tools/build.sh
```

## Options

| Type | Componets | Options |
| :--- | :--- | :--- |
| Analysis | phpcpd | git-url <br> path <br> names <br> names-exclude <br> regexps-exclude <br> exclude <br> min-lines <br> min-tokens |
| Analysis | phpcs |  |
| Analysis | phploc |  |
| Analysis | phpmd |  |
| Analysis | phpmetrics |  |
| Base | cli |  |
| Compile | beast |  |
| Compile | phar |  |
| Dependence | component-composer |  |
| Document | apigen |  |
| Document | phpdox |  |
| Unittest | phpunit |  |

## Develop

### Build Php Base Image

```
cd base
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php:0.1 --build-arg php_version=7.1.4 .
```

### Environment

```shell
cd tools/test-env/
docker-composer up -d
docker exec -ti test-env bash
```

### Test

```shell
docker run --env CO_DATA="git-url=https://github.com/sebastianbergmann/phploc.git entry-file=build.php" hub.opshub.sh/binary/v1/containerops/component/binary/php/component-composer:0.1
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" hub.opshub.sh/binary/v1/containerops/component/binary/php/phpcpd:0.1
docker run --env CO_DATA="git-url=https://github.com/squizlabs/PHP_CodeSniffer.git report=full standard=phpcs.xml.dist" hub.opshub.sh/binary/v1/containerops/component/binary/php/phpcs:0.1
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git exclude=public" hub.opshub.sh/binary/v1/containerops/component/binary/php/phploc:0.1
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" hub.opshub.sh/binary/v1/containerops/component/binary/php/phpmd:0.1
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" hub.opshub.sh/binary/v1/containerops/component/binary/php/phpmetrics:0.1
docker run --env CO_DATA="git-url=https://github.com/SegmentFault/phar-sample.git entry-file=build.php" hub.opshub.sh/binary/v1/containerops/component/binary/php/phar:0.1
docker run --env CO_DATA="git-url=https://github.com/sebastianbergmann/phploc.git --configuration=phpunit.xml composer=true" hub.opshub.sh/binary/v1/containerops/component/binary/php/phpunit:0.1
docker run --env CO_DATA="git-url=https://github.com/wp-cli/wp-cli.git file=./bin/wp composer=true" hub.opshub.sh/binary/v1/containerops/component/binary/php/cli:0.1
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" hub.opshub.sh/binary/v1/containerops/component/binary/php/beast:0.1
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git path=app destination=docs" hub.opshub.sh/binary/v1/containerops/component/binary/php/apigen:0.1
docker run --env CO_DATA="git-url=https://github.com/theseer/phpdox.git" hub.opshub.sh/binary/v1/containerops/component/binary/php/phpdox:0.1
```

### Build Images

```shell
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/phpcpd:0.1 .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/phpcs:0.1 .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/phploc:0.1 .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/phpmd:0.1 .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/phpmetrics:0.1 .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/phar:0.1 .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/phpunit:0.1 .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/cli:0.1 .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/component-composer: .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/beast:0.1 .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/apigen:0.1 .
docker build -t hub.opshub.sh/binary/v1/containerops/component/binary/php/phpdox:0.1 .
```
