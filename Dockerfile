FROM odoo:19.0

USER root

# Instalamos gosu
RUN apt-get update && \
    apt-get install -y --no-install-recommends gosu && \
    rm -rf /var/lib/apt/lists/*

# Creamos las rutas
RUN mkdir -p /mnt/extra-addons /debug /var/lib/odoo

# COPIAMOS EL ARCHIVO (Asegúrate de que el nombre a la izquierda 
# sea EXACTAMENTE igual al que ves en GitHub)
COPY railway-setup.sh /railway-setup.sh

# Verificamos si el archivo existe antes de darle permisos (para debuguear el log)
RUN ls -la /railway-setup.sh && chmod +x /railway-setup.sh

COPY ./extra-addon[s] /mnt/extra-addons
COPY ./debu[g] /debug

ENTRYPOINT ["/railway-setup.sh"]
CMD ["odoo"]
