use tareanota;
-- WHERE A JOIN
-- 1.-  Mostrar todos los usuarios de tipo Estudiante
-- Seleccionar nombre de usuario, correo y tipo_usuario

    select u.username, u.email, t.nombre_tipo 
	from usuarios u
    join tipo_usuarios t on u.id_tipo_usuario = t.id_tipo 
	where u.id_tipo_usuario = 2;

-- 2.-  Mostrar Personas nacidas después del año 1990
-- Seleccionar Nombre, fecha de nacimiento y username.

    select p.nombre_completo, p.fecha_nac, u.username
	from personas p
    join usuarios u on p.id_usuario = u.id_usuario
	where p.fecha_nac >= "1990-01-01";

-- 3.- Seleccionar nombres de personas que comienzan con la 
-- letra A - Seleccionar nombre y correo de la persona.

	select p.nombre_completo, u.email
	from personas p
	join usuarios u on p.id_usuario = u.id_usuario
	where p.nombre_completo like 'A%';


-- 4.- Mostrar usuarios cuyos dominios de correo sean
-- mail.commit LIKE '%mail.com%'

	select p.nombre_completo, u.username, u.email
	from usuarios u
	join personas p on u.id_usuario = p.id_usuario
	where u.email like '%@mail.com';


-- 5.- Mostrar todas las personas que no viven en 
 -- Valparaíso y su usuario + ciudad.
 -- select * from ciudad; -- ID 2 VALPARAÍSO

	select p.nombre_completo, u.username, c.nombre_ciudad
	from personas p
	join usuarios u on p.id_usuario = u.id_usuario
	join ciudad c on p.id_ciudad = c.id_ciudad
	where c.id_ciudad <> 2;


-- 6.- Mostrar usuarios que contengan más de 7 
-- carácteres de longitud.

	select p.nombre_completo, p.fecha_nac, u.username
	from personas p
	join usuarios u on p.id_usuario = u.id_usuario
	where char_length(u.username) >= 7;

-- 7.- Mostrar username de personas nacidas entre
-- 1990 y 1995

	select u.username
	from personas p
	join usuarios u on p.id_usuario = u.id_usuario
	where p.fecha_nac between '1990-01-01' and '1995-12-31';
