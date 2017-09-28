#!/bin/bash

# Verify the entry is added to crontab.
docker exec --tty ${container_id} env TERM=xterm crontab -u adam -l