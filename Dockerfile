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
# Copiamos TU script desde el repo al contenedor
COPY railway-setup.sh /railway-setup.sh
RUN chmod +x /railway-setup.sh

# Le decimos a Docker que empiece por TU script
ENTRYPOINT ["/railway-setup.sh"]

CMD ["odoo"]
