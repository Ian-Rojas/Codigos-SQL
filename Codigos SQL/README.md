# Proyecto Base de Datos - Tarea SQL

## Descripción

Este proyecto contiene el script completo para crear una base de datos llamada **Tareanota**, que incluye las tablas:

- `tipo_usuarios`
- `usuarios`
- `ciudad`
- `personas`

Cada tabla incluye campos de auditoría como `created_at`, `updated_at`, `created_by`, `updated_by` y un campo para borrado lógico (`deleted`).

Además, se aplicaron restricciones `CHECK` para validar datos como formatos de RUT, tipos de usuario válidos, validación de emails, entre otros.

Se incluyen también scripts para poblar las tablas con datos de ejemplo y consultas SQL con cláusulas `WHERE` para extraer información específica.

## Estructura

- `script_creacion.sql`: Script con la creación de tablas, restricciones y datos iniciales.
- `consultas.sql`: Consultas SQL con cláusulas WHERE para diversos filtros y búsquedas.
- `erd.png`: Imagen del diagrama entidad-relación generado con MySQL Workbench.
- `capturas/`: Carpeta con capturas de pantalla de las consultas ejecutadas.

## Cómo usar

1. Ejecutar `script_creacion.sql` en MySQL para crear la base de datos y tablas, con restricciones y datos de ejemplo.
2. Ejecutar `consultas.sql` para ver ejemplos de consultas con filtros específicos usando `WHERE`.
3. Revisar `erd.png` para entender el diseño de la base de datos.
4. Ver capturas para validar resultados.

## Notas

- Se utiliza el formato estándar chileno para RUT sin puntos y con guion.
- Se implementaron restricciones para asegurar la calidad y coherencia de los datos.
- Los campos de auditoría permiten rastrear creación, modificación y borrado lógico.
- Se usa `CHAR_LENGTH` para validar longitud de cadenas.
- Las relaciones entre tablas están basadas en claves foráneas para mantener integridad referencial.
