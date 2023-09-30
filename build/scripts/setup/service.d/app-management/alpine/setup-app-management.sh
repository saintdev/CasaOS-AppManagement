#!/bin/sh

set -e

readonly APP_NAME="casaos-app-management"
readonly APP_NAME_SHORT="app-management"

# copy config files
readonly CONF_PATH=/etc/casaos
readonly CONF_FILE=${CONF_PATH}/${APP_NAME_SHORT}.conf
readonly CONF_FILE_SAMPLE=${CONF_PATH}/${APP_NAME_SHORT}.conf.sample

if [ ! -f "${CONF_FILE}" ]; then \
    echo "Initializing config file..."
    cp -v "${CONF_FILE_SAMPLE}" "${CONF_FILE}"; \
fi

# enable service (without starting)
echo "Enabling service..."
rc-update add "${APP_NAME}" default
