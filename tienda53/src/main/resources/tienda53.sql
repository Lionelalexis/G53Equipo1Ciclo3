######## Creacion y uso de la base de datos ########
CREATE DATABASE tienda53grupo1;

USE tienda53grupo1;

######## modulo de login y usuarios ########
CREATE TABLE usuarios (
    cedula_usuario BIGINT PRIMARY KEY,
    email_usuario VARCHAR(255) NOT NULL,
    nombre_usuario VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    usuario VARCHAR(255) NOT NULL
); 

CREATE TABLE clientes (
    cedula_cliente BIGINT PRIMARY KEY,
    nombre_cliente VARCHAR(255) NOT NULL,
    direccion_cliente VARCHAR(255) NOT NULL,
    telefono_cliente VARCHAR(255) NOT NULL,
    email_cliente VARCHAR(255) NOT NULL
); 

INSERT INTO usuarios VALUES(001,'alex@gmail.com','Alexander Leon','superuser','superuser');

DROP TABLE usuarios;

DELETE FROM usuarios 
WHERE
    cedula_usuario = 001;

UPDATE usuarios 
SET 
    email_usuario = '',
    nombre_usuario = '',
    password = '',
    usuario = ''
WHERE
    cedula_usuario = 001;

SELECT 
    *
FROM
    usuarios;