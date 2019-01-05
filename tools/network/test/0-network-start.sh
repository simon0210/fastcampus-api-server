#!/bin/bash

docker-compose -f docker-compose.yml down --volumes --remove-orphans

docker-compose -f docker-compose.yml up -d
