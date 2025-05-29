CREATE database sistema_ventas_4c;
USE `sistema_ventas_4c` ;

-- -----------------------------------------------------
-- Table `sistema_ventas_4c`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas_4c`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_productos` VARCHAR(100) NULL DEFAULT NULL,
  `descripcion` VARCHAR(300) NULL DEFAULT NULL,
  `precio_productos` DECIMAL(10,2) NULL DEFAULT NULL,
  `stock_productos` INT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_ventas_4c`.`tipo_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas_4c`.`tipo_usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(50) NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_ventas_4c`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas_4c`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  `tipo_usuario_id` INT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `correo` (`correo` ASC) VISIBLE,
  INDEX `fk_usuario_tipo_usuario` (`tipo_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_tipo_usuario`
    FOREIGN KEY (`tipo_usuario_id`)
    REFERENCES `sistema_ventas_4c`.`tipo_usuarios` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_ventas_4c`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas_4c`.`ventas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NULL DEFAULT NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `fk_venta_usuario` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_venta_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `sistema_ventas_4c`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_ventas_4c`.`detalle_ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas_4c`.`detalle_ventas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `venta_id` INT NULL DEFAULT NULL,
  `producto_id` INT NULL DEFAULT NULL,
  `cantidad` INT NOT NULL,
  `precio_unitario` DECIMAL(10,2) NOT NULL,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `fk_detalle_venta` (`venta_id` ASC) VISIBLE,
  INDEX `fk_detalle_producto` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_producto`
    FOREIGN KEY (`producto_id`)
    REFERENCES `sistema_ventas_4c`.`productos` (`id`),
  CONSTRAINT `fk_detalle_venta`
    FOREIGN KEY (`venta_id`)
    REFERENCES `sistema_ventas_4c`.`ventas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO usuarios (
    nombre, password, correo, tipo_usuario_id, created_by, updated_by
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
    nombre_tipo, created_by, updated_by
)
VALUES (
    'Administrador',
    NULL,
    NULL
);

INSERT INTO tipo_usuarios (
    nombre_tipo, created_by, updated_by
)
VALUES (
    'Vendedor',
    NULL,
    NULL
);

INSERT INTO tipo_usuarios (
    nombre_tipo, created_by, updated_by
)
VALUES (
    'Cliente',
    NULL,
    NULL
);

INSERT INTO tipo_usuarios (
    nombre_tipo, created_by, updated_by
)
VALUES (
    'Soporte Tecnico',
    NULL,
    NULL
);

INSERT INTO usuarios (
    nombre, password, correo, tipo_usuario_id, created_by, updated_by
) VALUES (
    'carla.rios',
    '$2y$10$7oTi7cJbKN1kP0AcjBqXrOXeZ3SKxmcY5H8k5UmUO1bUNsEQ6hnvi',
    'carla.rios@empresa.cl',
    2,  -- tipo: Cliente
    1,  -- creado por "sistema"
    1   
);

INSERT INTO usuarios (
    nombre, password, correo, tipo_usuario_id, created_by, updated_by
) VALUES (
    'luis.gonzalez',
    '$2y$10$MnZwE1jz9u5L1hFVcX3eKuep6R7HGgW1zKHPuL32P3oyz7pQAZFaK',
    'luis.gonzalez@empresa.cl',
    3,  -- tipo: Soporte Técnico
    1,
    1
);

INSERT INTO usuarios (
    nombre, password, correo, tipo_usuario_id, created_by, updated_by
) VALUES (
    'marcela.torres',
    '$2y$10$GpVCzKtF/9vK6hAGTp6v/etOHezE0aWXI6fJoOYKOlm8MxUvOh8xa',
    'marcela.torres@empresa.cl',
    1,  -- tipo: Administrador
    1,
    1
);

INSERT INTO productos (
    nombre_productos, descripcion, precio_productos, stock_productos, created_at, updated_at, created_by, updated_by, deleted
) VALUES 
(
    'Mouse inalámbrico Logitech M185',
    'Mouse compacto, conexión inalámbrica 2.4GHz, compatible con Windows y macOS.',
    12990,
    35,
    NOW(),
    NOW(),
    1,
    1,
    FALSE
),
(
    'Teclado mecánico Redragon Kumara K552',
    'Teclado mecánico compacto con retroiluminación LED roja, switches Outemu Blue.',
    34990,
    20,
    NOW(),
    NOW(),
    1,
    1,
    FALSE
),
(
    'Monitor Samsung 24" FHD IPS',
    'Monitor de 24 pulgadas, resolución Full HD (1920x1080), panel IPS, puerto HDMI.',
    119990,
    12,
    NOW(),
    NOW(),
    1,
    1,
    FALSE
);

INSERT INTO ventas (
    usuario_id, fecha, created_by, updated_by
) VALUES (
    2,  -- Vendedor: carla.rios
    '2025-05-29 10:32:00',
    1,
    1
),
(
    3,  -- Vendedor: luis.gonzalez
    '2025-05-29 14:47:00',
    1,
    1
);

-- Venta 1: Laptop x1
INSERT INTO detalle_ventas (
    venta_id, producto_id, cantidad, precio_unitario, created_by, updated_by
) VALUES (
    1, 1, 1, 749990, 1, 1
),

-- Venta 1: Mouse x2
(
    1, 2, 2, 19990, 1, 1
),

-- Venta 2: Teclado x1
(
    2, 3, 1, 29990, 1, 1
),

-- Venta 2: Laptop x1
(
    2, 1, 1, 749990, 1, 1
);
