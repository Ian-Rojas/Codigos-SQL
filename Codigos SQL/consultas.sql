USE ciclovias_db;

INSERT INTO Rol (nombre_rol, descripcion) VALUES
('Administrador', 'Gestiona usuarios y reportes'),
('Usuario', 'Accede a la aplicación y reporta incidentes');

INSERT INTO Comuna (nombre_comuna, region) VALUES
('Puente Alto', 'Región Metropolitana'),
('La Florida', 'Región Metropolitana');

INSERT INTO Persona (rut, nombre, apellido, correo, telefono) VALUES
('20.111.333-4', 'Ian', 'Rojas', 'ianr@gmail.com', '987654321'),
('19.222.444-5', 'Camila', 'Soto', 'camilas@gmail.com', '912345678'),
('18.333.555-6', 'Felipe', 'Torres', 'felipet@gmail.com', '998877665');

INSERT INTO Usuario (id_persona, id_rol, id_comuna, contraseña) VALUES
(1, 1, 1, 'admin123'),
(2, 2, 1, 'camila123'),
(3, 2, 2, 'felipe123');

INSERT INTO RutaCiclovia (nombre_ruta, descripcion, id_comuna, estado) VALUES
('Ruta Las Perdices', 'Ciclovía principal que conecta el centro con el parque', 1, 'Activa'),
('Ruta San Carlos', 'Ruta de alto tráfico ciclista', 1, 'Activa'),
('Ruta Vicuña Mackenna', 'Ciclovía compartida con peatones', 2, 'Inactiva');

INSERT INTO UsuarioRuta (id_usuario, id_ruta) VALUES
(2, 1),
(2, 2),
(3, 3);

INSERT INTO Reporte (id_usuario, id_ruta, tipo_reporte, detalle) VALUES
(2, 1, 'Accidente', 'Caída por bache en la ciclovía'),
(3, 3, 'Problema', 'Falta iluminación nocturna');

SELECT * FROM Persona;

SELECT * FROM Usuario WHERE deleted = 0;

SELECT nombre_ruta, estado FROM RutaCiclovia WHERE estado = 'Activa';

SELECT tipo_reporte, COUNT(*) AS cantidad FROM Reporte GROUP BY tipo_reporte;

SELECT u.id_usuario, p.nombre, p.apellido, r.nombre_rol, c.nombre_comuna
FROM Usuario u
JOIN Persona p ON u.id_persona = p.id_persona
JOIN Rol r ON u.id_rol = r.id_rol
JOIN Comuna c ON u.id_comuna = c.id_comuna;

SELECT p.nombre, rc.nombre_ruta, ur.fecha_acceso
FROM UsuarioRuta ur
JOIN Usuario u ON ur.id_usuario = u.id_usuario
JOIN Persona p ON u.id_persona = p.id_persona
JOIN RutaCiclovia rc ON ur.id_ruta = rc.id_ruta;
