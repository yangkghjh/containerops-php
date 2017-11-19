#!/bin/bash

function phpcpd()
{
    composer global require sebastian/phpcpd
}

function phpcs()
{
    composer global require squizlabs/php_codesniffer
}

function phploc()
{
    composer global require phploc/phploc
}

function phpmd()
{
    composer global require phpmd/phpmd
}

function phpmetrics()
{
    composer global require phpmetrics/phpmetrics
}

function apigen()
{
    composer global require apigen/apigen 
}

function phpdox()
{
    composer global require theseer/phpdox 
}

function phpunit()
{
    composer global require phpunit/phpunit 
}

$1