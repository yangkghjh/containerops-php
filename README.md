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
docker build -t hub.opshub.sh/containerops/php:latest --build-arg php_version=7.1.4 .
```

### Environment

```shell
cd tools/test-env/
docker-composer up -d
docker exec -ti test-env bash
```

### Test

```shell
docker run --env CO_DATA="git-url=https://github.com/sebastianbergmann/phploc.git entry-file=build.php" hub.opshub.sh/containerops/analysis-php-phpcpd:latest
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" hub.opshub.sh/containerops/analysis-php-phpcs:latest
docker run --env CO_DATA="git-url=https://github.com/squizlabs/PHP_CodeSniffer.git report=full standard=phpcs.xml.dist" hub.opshub.sh/containerops/analysis-php-phploc:latest
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git exclude=public" hub.opshub.sh/containerops/analysis-php-phpmd:latest
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" hub.opshub.sh/containerops/analysis-php-phpmetrics:latest
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" hub.opshub.sh/containerops/base-php-cli:latest
docker run --env CO_DATA="git-url=https://github.com/SegmentFault/phar-sample.git entry-file=build.php" hub.opshub.sh/containerops/compile-php-beast:latest
docker run --env CO_DATA="git-url=https://github.com/sebastianbergmann/phploc.git --configuration=phpunit.xml composer=true" hub.opshub.sh/containerops/compile-php-phar:latest
docker run --env CO_DATA="git-url=https://github.com/wp-cli/wp-cli.git file=./bin/wp composer=true" hub.opshub.sh/containerops/dependence-php-composer:latest
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git" hub.opshub.sh/containerops/document-php-apigen:latest
docker run --env CO_DATA="git-url=https://github.com/TIGERB/easy-php.git path=app destination=docs" hub.opshub.sh/containerops/document-php-phpdox:latest
docker run --env CO_DATA="git-url=https://github.com/theseer/phpdox.git" hub.opshub.sh/containerops/unittest-php-phpunit:latest
```

### Build Images

```shell
docker build -t hub.opshub.sh/containerops/analysis-php-phpcpd:latest .
docker build -t hub.opshub.sh/containerops/analysis-php-phpcs:latest .
docker build -t hub.opshub.sh/containerops/analysis-php-phploc:latest .
docker build -t hub.opshub.sh/containerops/analysis-php-phpmd:latest .
docker build -t hub.opshub.sh/containerops/analysis-php-phpmetrics:latest .
docker build -t hub.opshub.sh/containerops/base-php-cli:latest .
docker build -t hub.opshub.sh/containerops/compile-php-beast:latest .
docker build -t hub.opshub.sh/containerops/compile-php-phar:latest .
docker build -t hub.opshub.sh/containerops/dependence-php-composer:latest .
docker build -t hub.opshub.sh/containerops/document-php-apigen:latest .
docker build -t hub.opshub.sh/containerops/document-php-phpdox:latest .
docker build -t hub.opshub.sh/containerops/unittest-php-phpunit:latest .
```
