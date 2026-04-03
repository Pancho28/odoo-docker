# Usamos la imagen oficial de Odoo 19.0
FROM odoo:19.0

# Cambiamos a root para gestionar carpetas y permisos
USER root

# Creamos directorios para módulos personalizados y debugging
RUN mkdir -p /mnt/extra-addons /debug

# Copiamos tus módulos y scripts de test (si existen en tu repo)
COPY ./extra-addons /mnt/extra-addons
COPY ./debug /debug

# Aseguramos que el usuario 'odoo' sea el dueño de todo
RUN chown -R odoo:odoo /mnt/extra-addons /debug /var/lib/odoo

# Volvemos al usuario odoo por seguridad (Principio de menor privilegio)
USER odoo

# Exponemos el puerto por defecto de Odoo
EXPOSE 8069 8072

# Comando de inicio (Railway pasará las variables de entorno automáticamente)
CMD ["odoo"]
