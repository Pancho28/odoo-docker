FROM odoo:19.0

USER root

# 1. Instalamos gosu para el manejo de permisos en el arranque
RUN apt-get update && \
    apt-get install -y --no-install-recommends gosu && \
    rm -rf /var/lib/apt/lists/*

# 2. Preparamos el volumen de datos
RUN mkdir -p /var/lib/odoo

# 3. Exponemos los puertos: 
# 8069: Tráfico HTTP estándar (ERP)
# 8072: Tráfico Longpolling (Chat/Notificaciones)
EXPOSE 8069 8072

# 4. El comando "Inline" que corrige permisos y lanza el configurador oficial
# Usamos 'exec' para que Odoo sea el proceso principal (PID 1)
CMD ["sh", "-c", "chown -R odoo:odoo /var/lib/odoo && exec /entrypoint.sh odoo"]
