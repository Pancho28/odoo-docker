FROM odoo:19.0

USER root

# Instalamos gosu para la gestión segura de privilegios
RUN apt-get update && \
    apt-get install -y --no-install-recommends gosu && \
    rm -rf /var/lib/apt/lists/*

# Creamos las rutas necesarias y placeholders para evitar warnings
RUN mkdir -p /mnt/extra-addons /debug /var/lib/odoo && \
    touch /mnt/extra-addons/.placeholder /debug/.placeholder

# Copiamos el contenido de tu repo (usando comodines para evitar errores si están vacíos)
COPY ./extra-addon[s] /mnt/extra-addons
COPY ./debu[g] /debug
COPY entrypoint.sh /entrypoint.sh

# Damos permisos de ejecución al script de entrada
RUN chmod +x /entrypoint.sh

# El contenedor siempre pasará por el script antes de iniciar Odoo
ENTRYPOINT ["/entrypoint.sh"]

# Comando por defecto que se pasará como argumento al entrypoint
CMD ["odoo"]
