FROM odoo:19.0

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends gosu && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /mnt/extra-addons /debug /var/lib/odoo && \
    touch /mnt/extra-addons/.placeholder /debug/.placeholder

COPY ./extra-addon[s] /mnt/extra-addons
COPY ./debu[g] /debug
# Copiamos con el nuevo nombre para evitar el loop
COPY railway-setup[s].sh /railway-setup.sh

RUN chmod +x /railway-setup.sh

# El ENTRYPOINT ahora es nuestro script con nombre único
ENTRYPOINT ["/railway-setup.sh"]

CMD ["odoo"]
