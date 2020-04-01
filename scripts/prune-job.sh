#!/bin/bash
export INSTALL_DIR="${HOME}/paper-mc-docker"
export RESTIC_REPOSITORY="${INSTALL_DIR}/backup"
export RESTIC_PASSWORD="changeme"

# Log date and time
date --utc +%Y%m%d_%H%M%SZ >> ${INSTALL_DIR}/backup.log

# Ensure backups don't have unecessary data
restic prune >> ${INSTALL_DIR}/backup.log

