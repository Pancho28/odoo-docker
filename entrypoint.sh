#!/bin/bash
set -e

# 1. Corregimos permisos para Railway (lo que nos dio el error 500 antes)
echo "🔧 Ajustando permisos para Railway..."
chown -R odoo:odoo /var/lib/odoo /mnt/extra-addons /debug

# 2. LLAMAMOS AL SCRIPT OFICIAL DE ODOO
echo "🚀 Pasando el mando al inicializador oficial de Odoo..."
exec /entrypoint.sh "$@"
