#!/bin/bash
docker volume create ddclient-vol
docker run -d -v ddclient-vol:/config --restart unless-stopped --name ddclient ddclient
