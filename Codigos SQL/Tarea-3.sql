-- 1.-  Mostrar todos los usuarios de tipo Estudiante
select u.username, u.email, t.nombre_tipo 
from usuarios u, tipo_usuarios t 
where u.id_tipo_usuario = 2
AND u.id_tipo_usuario = t.id_tipo;

-- 2.-  Mostrar Personas nacidas despues del año 1990
SELECT rut, nombre_completo, fecha_nac
FROM personas
WHERE fecha_nac > '1990-12-31';

-- 3.- Seleccionar nombres de personas que comiencen con la 
SELECT p.nombre_completo, u.email
FROM personas p, usuarios u
WHERE p.id_usuario = u.id_usuario
AND p.nombre_completo LIKE 'A%';

-- 4.- Mostrar usuarios cuyos dominios de correo sean
SELECT username, email
FROM usuarios
WHERE email LIKE '%mail.com%';

-- 5.- Mostrar todas las personas que no viven en Valparaiso y su usuario + ciudad.
SELECT p.nombre_completo, u.username, c.nombre_ciudad
FROM personas p, usuarios u, ciudad c
WHERE p.id_usuario = u.id_usuario
AND p.id_ciudad = c.id_ciudad
AND c.nombre_ciudad <> 'Valparaíso';

-- 6.- Mostrar usuarios que contengan más de 7 carácteres de longitud.
SELECT username
FROM usuarios
WHERE CHAR_LENGTH(username) > 7;