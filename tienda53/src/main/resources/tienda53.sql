use tienda53grupo1;
####### Creacion y uso de la base de datos ########
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

SELECT * FROM usuarios;

#es para que no se repita el usuario se crea una restriccion para no duplicar
create unique index ususario_unico
on usuarios(usuario);

select * from usuarios;

#Seleccionando todos los datos de la tabla
select * from clientes;
CREATE TABLE proveedores (
    nit_proveedor BIGINT PRIMARY KEY,
    nombre_proveedor VARCHAR(255) NOT NULL,
    direccion_proveedor VARCHAR(255) NOT NULL,
    telefono_proveedor VARCHAR(255) NOT NULL,
    ciudad_proveedor VARCHAR(255) NOT NULL
    ); 

#cambia campo de columan de email a ciudad del proveedor
alter table proveedores change column email_proveedor ciudad_proveedor VARCHAR(255) NOT NULL;
select * from proveedores;

CREATE TABLE productos(
    codigo_producto BIGINT PRIMARY KEY,
    iva_compra DOUBLE NOT NULL,
    nit_proveedor BIGINT NOT NULL,
    nombre_producto VARCHAR(255) NOT NULL,
    precio_compra DOUBLE NOT NULL,
    precio_venta DOUBLE NOT NULL,
    FOREIGN KEY (nit_proveedor) REFERENCES proveedores(nit_proveedor)
    );
select * from productos;

delete from productos;
show databases;