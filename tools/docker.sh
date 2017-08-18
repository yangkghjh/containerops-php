#!/bin/bash

rm -rf dist
mkdir dist
cp -r docker/* dist

function normal($type, $name) {
    mkdir dist/$type/$name/src
    
}