CREATE DATABASE Tareanota;
USE Tareanota;

-- Tabla: tipo_usuarios
CREATE TABLE tipo_usuarios (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo VARCHAR(50) NOT NULL CHECK (nombre_tipo IN ('Administrador', 'Estudiante', 'Invitado')),
    descripcion_tipo VARCHAR(200) NOT NULL CHECK (CHAR_LENGTH(descripcion_tipo) >= 10),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT DEFAULT NULL,
    updated_by INT DEFAULT NULL,
    deleted TINYINT(1) DEFAULT 0
);

-- Tabla: usuarios
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE CHECK (CHAR_LENGTH(username) >= 4 AND username REGEXP '^[A-Za-z0-9_]+$'),
    password VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE CHECK (email LIKE '%@%.%'),
    edad TINYINT CHECK (edad BETWEEN 13 AND 100),
    fecha_registro DATE,
    activo BOOLEAN DEFAULT TRUE,
    id_tipo_usuario INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,
    updated_by INT,
    deleted TINYINT(1) DEFAULT 0,
    FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuarios(id_tipo)
);

-- Tabla: ciudad
CREATE TABLE ciudad (
    id_ciudad INT PRIMARY KEY AUTO_INCREMENT,
    nombre_ciudad VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(nombre_ciudad) >= 3 AND nombre_ciudad REGEXP '^[A-Za-z ]+$'),
    region VARCHAR(100) DEFAULT 'Sin región' CHECK (CHAR_LENGTH(region) >= 4),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT DEFAULT NULL,
    updated_by INT DEFAULT NULL,
    deleted TINYINT(1) DEFAULT 0
);

-- Tabla: personas
CREATE TABLE personas (
    rut VARCHAR(13) NOT NULL UNIQUE CHECK (rut REGEXP '^[0-9]{7,8}-[0-9kK]{1}$'),
    nombre_completo VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(nombre_completo) >= 5 AND nombre_completo REGEXP '^[A-Za-z ]+$'
    ),
    fecha_nac DATE,
    id_usuario INT,
    id_ciudad INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT DEFAULT NULL,
    updated_by INT DEFAULT NULL,
    deleted TINYINT(1) DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);