import os
import getpass

def check_env():
    user = getpass.getuser()
    print(f"--- Diagnóstico de Entorno ---")
    print(f"Usuario actual: {user}")
    
    paths = ['/var/lib/odoo', '/mnt/extra-addons', '/debug']
    
    for p in paths:
        if os.path.exists(p):
            is_writable = os.access(p, os.W_OK)
            print(f"Ruta: {p} | ¿Escribible?: {'✅ Sí' if is_writable else '❌ No'}")
        else:
            print(f"Ruta: {p} | ❌ No existe")

if __name__ == "__main__":
    check_env()
