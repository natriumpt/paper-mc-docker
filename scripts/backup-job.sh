#!/bin/bash
export INSTALL_DIR="${HOME}/paper-mc-docker"
export RESTIC_REPOSITORY="${INSTALL_DIR}/backup"
export RESTIC_PASSWORD="changeme"

# Initialize Restic repo if it does not exist
[ ! -d "${RESTIC_REPOSITORY}" ] && restic init

# Log date and time
date --utc +%Y%m%d_%H%M%SZ >> ${INSTALL_DIR}/backup.log

# Backup with the default settings
restic backup ${INSTALL_DIR}/data >> ${INSTALL_DIR}/backup.log

# Clean up snapshots
restic forget --keep-last 24 --keep-hourly 72 --keep-daily 7 --keep-weekly 5 --keep-monthly 12 >> ${INSTALL_DIR}/backup.log

