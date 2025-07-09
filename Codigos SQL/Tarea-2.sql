INSERT INTO usuarios (
    username, password, email, id_tipo_usuario, created_by, updated_by
)
VALUES (
    'sistema',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'sistema@plataforma.cl',
    NULL,
    NULL,
    NULL
);


INSERT INTO tipo_usuarios (
    nombre_tipo, descripcion_tipo, created_by, updated_by
)
VALUES (
    'Administrador',
    "Usuario con control total",
    NULL,
    NULL
), (
    'Estudiante',
    "Usuario Estudiante",
    NULL,
    NULL
),
(
    'Invitado',
    "Usuario sin ningun privilegio",
    NULL,
    NULL
);



-- Poblar tabla tipo_usuarios
INSERT INTO tipo_usuarios (nombre_tipo, descripcion_tipo, created_by, updated_by) VALUES
('Administrador', 'Acceso completo al sistema', null, null),
('Cliente', 'Usuario con acceso restringido', null, null),
('Moderador', 'Puede revisar y aprobar contenido', null, null);

-- Poblar tabla usuarios
INSERT INTO usuarios (username, password, email, id_tipo_usuario, created_by, updated_by) VALUES
('admin01', 'pass1234', 'admin01@mail.com', 1,1,1),
('jvaldes', 'abc123', 'jvaldes@mail.com', 2,1,1),
('cmorales', '123456', 'cmorales@mail.com', 3,1,1),
('anavarro', 'pass4321', 'anavarro@mail.com', 2,1,1),
('rquezada', 'clave2023', 'rquezada@mail.com', 1,1,1),
('pgodoy', 'segura123', 'pgodoy@mail.com', 2,1,1),
('mdiaz', 'token456', 'mdiaz@mail.com', 3,1,1),
('scarvajal', 'azul789', 'scarvajal@mail.com', 2,1,1),
('ltapia', 'lt123', 'ltapia@mail.com', 3,1,1),
('afarias', 'afpass', 'afarias@mail.com', 2,1,1);

-- Poblar tabla ciudad
INSERT INTO ciudad (nombre_ciudad, region) VALUES
('Santiago', 'Region Metropolitana'),
('Valparaiso', 'Region de Valparaiso'),
('Concepcion', 'Region del Biobio'),
('La Serena', 'Region de Coquimbo'),
('Puerto Montt', 'Region de Los Lagos');

-- Poblar tabla personas (relacionadas con usuarios y ciudades)
INSERT INTO personas (rut, nombre_completo, fecha_nac, id_usuario, id_ciudad, created_by, updated_by) VALUES
('11111111-1', 'Juan Valdes', '1990-04-12', 2, 6, NULL, NULL),
('22222222-2', 'Camila Morales', '1985-09-25', 3, 7, NULL, NULL),
('33333333-3', 'Andrea Navarro', '1992-11-03', 4, 6, NULL, NULL),
('44444444-4', 'Rodrigo Quezada', '1980-06-17', 5, 8, NULL, NULL),
('55555555-5', 'Patricio Godoy', '1998-12-01', 6, 9, NULL, NULL),
('66666666-6', 'Maria Diaz', '1987-07-14', 7, 6, NULL, NULL),
('77777777-7', 'Sebastian Carvajal', '1993-03-22', 8, 7, NULL, NULL),
('88888888-8', 'Lorena Tapia', '2000-10-10', 9, 7, NULL, NULL),
('99999999-9', 'Ana Farias', '1995-01-28', 10, 8, NULL, NULL),
('10101010-0', 'Carlos Soto', '1991-08-08', 1, 9, NULL, NULL);