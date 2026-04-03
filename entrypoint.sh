#!/bin/bash
set -e

# 1. Corregimos los permisos de los volúmenes montados por Railway
# Lo hacemos como root antes de lanzar Odoo
echo "Ajustando permisos de carpetas..."
chown -R odoo:odoo /var/lib/odoo /mnt/extra-addons /debug

# 2. Ejecutamos el comando original (odoo) usando gosu
# Esto cambia el proceso al usuario 'odoo' manteniendo el PID 1
echo "Iniciando Odoo 19 con el usuario odoo..."
exec gosu odoo "$@"
