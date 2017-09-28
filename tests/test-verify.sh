#!/bin/bash

# Verify the installed version of logrotate.
docker exec --tty ${container_id} env TERM=xterm /usr/sbin/logrotate --version