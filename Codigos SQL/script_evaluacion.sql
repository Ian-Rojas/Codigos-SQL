-- =========================================
-- CREACIÓN DE BASE DE DATOS
-- =========================================
CREATE DATABASE IF NOT EXISTS gestion_academica;
USE gestion_academica;


-- =========================================
-- TABLA TIPO_USUARIOS
-- =========================================
CREATE TABLE tipo_usuarios (
    id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted BOOLEAN DEFAULT 0
);


-- =========================================
-- TABLA MODALIDADES (para cursos)
-- =========================================
CREATE TABLE modalidades (
    id_modalidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modalidad VARCHAR(50) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted BOOLEAN DEFAULT 0
);


-- =========================================
-- TABLA PERSONAS
-- =========================================
CREATE TABLE personas (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(12) UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    correo VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted BOOLEAN DEFAULT 0
);


-- =========================================
-- TABLA USUARIOS
-- =========================================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(100) NOT NULL,
    id_persona INT NOT NULL,
    id_tipo_usuario INT NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted BOOLEAN DEFAULT 0,
    FOREIGN KEY (id_persona) REFERENCES personas(id_persona),
    FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuarios(id_tipo_usuario)
);


-- =========================================
-- TABLA CURSOS
-- =========================================
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100),
    id_modalidad INT NOT NULL,
    fecha_inicio DATE,
    duracion_horas INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted BOOLEAN DEFAULT 0,
    FOREIGN KEY (id_modalidad) REFERENCES modalidades(id_modalidad)
);


-- =========================================
-- TABLA MATRICULAS
-- =========================================
CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_matricula DATE,
    estado VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted BOOLEAN DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


-- =========================================
-- TABLA DOCENTE_CURSO
-- =========================================
CREATE TABLE docente_curso (
    id_docente_curso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_curso INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted BOOLEAN DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


-- =========================================
-- INSERCIÓN DE DATOS
-- =========================================


-- TIPOS DE USUARIOS
INSERT INTO tipo_usuarios (nombre_tipo) VALUES
('Administrador'),
('Docente'),
('Estudiante');


-- MODALIDADES
INSERT INTO modalidades (nombre_modalidad) VALUES
('Online'),
('Presencial');


-- PERSONAS (con algunos campos nulos)
INSERT INTO personas (rut, nombre_completo, fecha_nacimiento, correo) VALUES
('11.111.111-1', 'Andrés Soto', '1985-03-21', 'andres.soto@email.com'),
(NULL, 'Lucía Fuentes', '1990-07-10', 'lucia.fuentes@email.com'), -- Rut nulo
('13.333.333-3', 'María López', '1992-01-15', NULL), -- Correo nulo
('14.444.444-4', 'Pedro González', '1995-11-20', 'pedro.gonzalez@email.com'),
('15.555.555-5', 'Claudia Díaz', '1998-04-09', 'claudia.diaz@email.com'),
(NULL, 'Javier Silva', '1980-06-22', 'javier.silva@email.com'), -- Rut nulo
('17.777.777-7', 'Patricia Reyes', '1988-09-30', 'patricia.reyes@email.com'),
('18.888.888-8', 'Daniel Hernández', '1993-12-14', 'daniel.hernandez@email.com'),
('19.999.999-9', 'Carolina Vega', '1997-05-05', NULL), -- Correo nulo
('10.000.000-0', 'Esteban Morales', '1994-08-18', 'esteban.morales@email.com');


-- USUARIOS (con algunos usernames nulos)
INSERT INTO usuarios (username, password, id_persona, id_tipo_usuario, estado) VALUES
('asoto', 'clave123', 1, 1, 'activo'),
(NULL, 'clave123', 2, 1, 'activo'), -- Username nulo
('mlopez', 'clave123', 3, 2, 'activo'),
('pgonzalez', 'clave123', 4, 2, 'activo'),
('cdiaz', 'clave123', 5, 2, 'activo'),
(NULL, 'clave123', 6, 3, 'activo'), -- Username nulo
('preyes', 'clave123', 7, 3, 'activo'),
('dhernandez', 'clave123', 8, 3, 'inactivo'),
('cvega', 'clave123', 9, 3, 'activo'),
('emorales', 'clave123', 10, 3, 'activo');


-- CURSOS (con algunos campos nulos)
INSERT INTO cursos (nombre_curso, id_modalidad, fecha_inicio, duracion_horas) VALUES
('Fundamentos de SQL', 1, '2025-09-01', 30),
('Desarrollo Web', 1, NULL, 40), -- Fecha nula
('Redes y Comunicaciones', 2, '2025-09-10', NULL), -- Duración nula
('Seguridad Informática', 2, '2025-09-15', 35),
('Administración de BD', 1, '2025-09-20', 50),
('Python Básico', 1, '2025-09-25', 30),
(NULL, 2, '2025-10-01', 20), -- Nombre nulo
('Ciberseguridad', 2, '2025-10-05', 45),
('Big Data y Análisis', 1, NULL, 60), -- Fecha nula
('Machine Learning', 1, '2025-10-15', 55);


-- MATRICULAS (con campos nulos)
INSERT INTO matriculas (id_usuario, id_curso, fecha_matricula, estado) VALUES
(6, 1, '2025-08-20', 'vigente'),
(7, 1, '2025-08-21', 'vigente'),
(8, 2, '2025-08-22', NULL), -- Estado nulo
(9, 3, NULL, 'vigente'), -- Fecha nula
(10, 4, '2025-08-24', 'vigente'),
(6, 5, '2025-08-25', 'vigente'),
(7, 6, '2025-08-26', 'finalizado'),
(8, 7, '2025-08-27', 'vigente'),
(9, 8, NULL, 'vigente'), -- Fecha nula
(10, 9, '2025-08-29', 'vigente');


-- DOCENTE_CURSO (correcto)
INSERT INTO docente_curso (id_usuario, id_curso) VALUES
(3, 1), (3, 2),
(4, 3), (4, 4),
(5, 5), (5, 6),
(3, 7), (4, 8),
(5, 9), (3, 10);

-- Parte 1 Limpieza de datos --

-- En estos codigos que salen a continuación estamos haciendo una consulta select en las tablas, pero las estamos filtrando
-- donde el atributo seleccionado si es nulo se muestre --

select id_persona, rut, nombre_completo, fecha_nacimiento, correo from personas where rut is null or correo is null;
select id_usuario, username, id_persona, id_tipo_usuario, estado from usuarios where username is null;
select id_curso, nombre_curso, id_modalidad, fecha_inicio, duracion_horas from cursos where nombre_curso is null or fecha_inicio is null or duracion_horas is null;
select id_matricula, id_usuario, id_curso, fecha_matricula, estado from matriculas where fecha_matricula is null or estado is null;

-- Aqui estamos actualizando el correo de la primera persona que tenga el valor null
update personas set correo = 'correo@ejemplo.com' where correo is null;

-- Aqui estamos actualizando la fecha de inicio del curso que tenga un valor null asignándole una fecha valida
update cursos set fecha_inicio = '2025-08-01' where fecha_inicio is null;

-- Parte 2 Borrado físico de registros inválidos --

-- Este codigo realmente no importa mucho ya que si lo llegamos a correr no va a funcionar porque necesitamos borrar ciertos datos
-- ademas es una mala practica --

delete from personas where rut is null;
delete from usuarios where username is null;
delete from cursos where nombre_curso is null;
delete from matriculas where estado is null;

-- Aqui estamos seleccionando a los cursos y usuarios que estan activos usando un inner join con la tabla matriculas

select c.nombre_curso, u.username from cursos c
inner join matriculas m on c.id_curso = m.id_curso
inner join usuarios u on m.id_usuario = u.id_usuario
where c.deleted = 0 and u.deleted = 0 and m.deleted = 0;


-- Parte 2 Borrado Lógico y Filtrado de Activos --

-- Borrado Lógico --

-- Aqui estamos utilizando el update para hacer un borrado lógico, estamos pasando que el deleted en vez que sea 0 pase a uno
-- asi ocultando el usuario con el id = 8 y lo mismo con el curso

update usuarios set deleted = 1, updated_at = current_timestamp where id_usuario = 8;
update cursos set deleted = 1, updated_at = current_timestamp where id_curso = 7;

-- Filtrado de Activos --

-- Aqui estamos haciendo una consulta pero esta vez con los datos que sean desactivados --

select id_curso, nombre_curso, id_modalidad, fecha_inicio, duracion_horas from cursos where deleted = 1;
select u.id_usuario, p.nombre_completo, t.nombre_tipo AS tipo_usuario, u.estado from usuarios u 
join personas p on u.id_persona = p.id_persona 
join tipo_usuarios t on u.id_tipo_usuario = t.id_tipo_usuario 
where u.deleted = 1;

-- Parte 3 Consultas con INNER JOIN --

-- JOIN de 2 tablas --
	
-- Aqui estamos mostrando el nombre de usuario, el nombre completo y el tipo de usuario

select u.username, p.nombre_completo, tu.nombre_tipo AS tipo_usuario from usuarios u 
inner join personas p on u.id_persona = p.id_persona 
inner join tipo_usuarios tu on u.id_tipo_usuario = tu.id_tipo_usuario 
where u.deleted = 0 and p.deleted = 0 and tu.deleted = 0;

-- JOIN de 3 tablas --

-- Aqui estamos mostrando el nombre del estudiante, el curso y el estado de su matricula

select p.nombre_completo as estudiante, c.nombre_curso, m.estado
from matriculas m
join usuarios u on m.id_usuario = u.id_usuario and u.deleted = 0
join personas p on u.id_persona = p.id_persona and p.deleted = 0
join cursos c on m.id_curso = c.id_curso and c.deleted = 0
join tipo_usuarios t on u.id_tipo_usuario = t.id_tipo_usuario and t.nombre_tipo = 'Estudiante'
where m.deleted = 0;

-- JOIN de 4 tablas (Supuestamente eran 4 pero al eliminar el nombre completo del docente se volvio a 3 tablas) --

-- Aqui estamos mostrando al docente del curso y el estudiante matriculado con su estado

select c.nombre_curso, est_p.nombre_completo as estudiante, m.estado
from cursos c
inner join matriculas m on c.id_curso = m.id_curso
inner join usuarios est on m.id_usuario = est.id_usuario
inner join personas est_p on est.id_persona = est_p.id_persona 
where c.deleted = 0 and m.deleted = 0 and est.deleted = 0 and est_p.deleted = 0;

-- Parte 4 Consultas con Filtros Avanzados --

-- Lista todos los cursos activos que tengan duracion_horas > 30. --

-- Aqui estamos mostrando a los cursos activos con mas de treinta horas de duracion en el curso --

select id_curso, nombre_curso, duracion_horas 
from cursos where deleted = 0 and duracion_horas > 30;


-- Aqui esta mostrando a las personas que son estudiantes con correo nulo y con un length de quince caracteres

select p.id_persona, p.nombre_completo, p.correo, LENGTH(p.correo) AS longitud_correo
from personas p join usuarios u on p.id_persona = u.id_persona join tipo_usuarios t on u.id_tipo_usuario = t.id_tipo_usuario
where p.deleted = 0 and u.deleted = 0 and t.nombre_tipo = 'Estudiante' and p.correo is not null and LENGTH(p.correo) > 15;

-- Aqui estamos mostrando las matriculas vigentes que se han hecho despues del 22 de agosto del 2025 --

select m.id_matricula, p.nombre_completo as estudiante, c.nombre_curso, m.fecha_matricula, m.estado
from matriculas m
join usuarios u on m.id_usuario = u.id_usuario
join personas p on u.id_persona = p.id_persona
join cursos c on m.id_curso = c.id_curso
where m.fecha_matricula > '2025-08-22' 
and m.estado = 'vigente' and m.deleted = 0 and u.deleted = 0 and p.deleted = 0 and c.deleted = 0;

-- Aqui estamos mostrando los cursos activos que comienzan entre el 1 y el 30 de septiembre del 2025 --

select id_curso, nombre_curso, fecha_inicio, duracion_horas from cursos 
where deleted = 0 and fecha_inicio is not null 
and fecha_inicio between '2025-09-01' and '2025-09-30';