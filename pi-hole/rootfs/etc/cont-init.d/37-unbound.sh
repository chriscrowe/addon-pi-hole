#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Pi-hole
# Adds custom configured hosts to the DNS resolver
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

if hass.config.has_value 'use_unbound_resolver'; then
    hass.log.debug 'Enabling unbound service'
    unbound_port=$(hass.config.get 'unbound_port')
    sed -i 's/port: 5353/port: '"$unbound_port"'/g' /etc/unbound/unbound.conf
fi