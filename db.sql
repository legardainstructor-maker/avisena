
CREATE TABLE `roles` (
	`id_rol` SMALLINT NOT NULL AUTO_INCREMENT UNIQUE,
	`nombre_rol` VARCHAR(30) NOT NULL,
	`descripcion` TEXT(500) NOT NULL,
	PRIMARY KEY(`id_rol`)
);

INSERT INTO roles (nombre_rol, descripcion) VALUES 
('superadmin', 'todos los poderes'),
('administrador', 'todo menos crear superadmin'),
('supervisor', 'asignar tareas'),
('operario', 'registrar producción');

DROP TABLE usuarios;
CREATE TABLE `usuarios` (
	`id_usuario` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(70) NOT NULL,
	`id_rol` SMALLINT NOT NULL,
	`email` VARCHAR(100) NOT NULL UNIQUE,
	`telefono` CHAR(15) NOT NULL,
	`documento` VARCHAR(20) NOT NULL,
	`pass_hash` VARCHAR(140) NOT NULL,
    `estado` BOOLEAN,
	PRIMARY KEY(`id_usuario`),
    FOREIGN KEY(id_rol) REFERENCES roles(id_rol)
);

INSERT INTO usuarios(nombre, id_rol, email, telefono, documento, pass_hash, estado)
VALUES ('prueba', 1, 'prueba@gmail.com', '312765654', '1088345678', '$2b$12$dqHqOjmV3VJKqnvcsFd4aOc/t4LpECbs8T5UJBk47sFUr9PwRsmkS', 1);

CREATE TABLE `modulos` (
	`id_modulo` SMALLINT NOT NULL AUTO_INCREMENT UNIQUE,
	`nombre_modulo` VARCHAR(30) NOT NULL,
	PRIMARY KEY(`id_modulo`)
);

DROP TABLE permisos;
CREATE TABLE `permisos` (
	`id_modulo` SMALLINT NOT NULL,
	`id_rol` SMALLINT NOT NULL,
	`insertar` BOOLEAN NOT NULL,
	`actualizar` BOOLEAN NOT NULL,
	`seleccionar` BOOLEAN NOT NULL,
	`borrar` BOOLEAN NOT NULL,
	PRIMARY KEY(`id_modulo`, `id_rol`),
    FOREIGN KEY(id_rol) REFERENCES roles(id_rol),
    FOREIGN KEY(id_modulo) REFERENCES modulos(id_modulo)
);