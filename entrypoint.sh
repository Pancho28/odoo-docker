#!/bin/bash
set -e

echo "🔧 [Railway] Ajustando permisos de carpetas..."
chown -R odoo:odoo /var/lib/odoo /mnt/extra-addons /debug

echo "🚀 [Railway] Permisos listos. Pasando el mando al script oficial de Odoo..."

exec /entrypoint.sh "$@" 
