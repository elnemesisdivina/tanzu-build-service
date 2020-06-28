#! /usr/bin/env bash

 REGISTRY_PASSWORD=Harbor12345 kp secret create harbor2 \
 --registry https://harbor2.lab.home:30003 \
 --registry-user admin

kp custom-builder create my-custom-builder harbor2.lab.home:30003/tbs/my-custom-builder \
--order custom-builder.yml

 kp image create demo-golang harbor2.lab.home:30003/tbs/mysql \
 --git "https://github.com/techgnosis/pas-golang-mysql.git" \
 --git-revision demo