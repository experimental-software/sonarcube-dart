#!/usr/bin/env bash

source version

docker build --tag=experimentalsoftware/sonarqube-dart:$VERSION .
