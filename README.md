# Laboratorio de seguridad IaC

GitHub Actions analiza Terraform y Dockerfile con Checkov. También valida la sintaxis de Ansible y ejecuta ansible-lint con el perfil production. La rama main exige el check **Escaneo IaC** antes de fusionar cambios.

- [Informe con resultados y evidencia](docs/informe.pdf)
- [PR bloqueado y cerrado](https://github.com/gitcombo/iac-security-lab/pull/1)
- [PR de remediación](https://github.com/gitcombo/iac-security-lab/pull/2)

## Ejecutar los controles

Con Python 3.10, instala Checkov 3.2.495 en un entorno virtual y ansible-core 2.17.14 y ansible-lint 24.12.2 en otro. Con cada herramienta disponible en PATH, ejecuta desde la raíz del repositorio:

```bash
checkov -d . --framework terraform dockerfile --external-checks-dir politicas --compact
ansible-playbook -i ansible/inventory.ini ansible/site.yml --syntax-check
ansible-lint --profile production ansible/
```

Los archivos son ejemplos para análisis estático. El laboratorio no despliega recursos.

## Aplicación de demostración

El contenedor ejecuta un gestor de tickets simulado en modo de reporte. Lee registros ficticios, cuenta los tickets por estado y muestra cuántos pendientes son de prioridad alta. Termina con código 0 si el archivo es válido y 2 si hay un error de entrada.

```bash
sh app/tickets.sh
docker build -f docker/Dockerfile -t iac-security-lab .
docker run --rm iac-security-lab
```

Para probar otro archivo local, ejecuta `sh app/tickets.sh archivo.tsv`. Cada fila debe contener un ID `INC-<número>`, un estado (`abierto`, `en_progreso` o `resuelto`) y una prioridad (`alta`, `media` o `baja`), separados por tabulaciones y sin encabezado.
