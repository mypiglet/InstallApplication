#!/usr/bin/env bash
#Login jenkin
#java -jar jenkins-cli.jar -s http://localhost:8080/ login --username admin --password 111111
java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin $1