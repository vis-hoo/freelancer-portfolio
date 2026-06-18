DROP DATABASE IF EXISTS empresa_ventas;
CREATE DATABASE empresa_ventas;
USE empresa_ventas;

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    fecha_contratacion DATE,
    salario DECIMAL(10,2)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20),
    ciudad VARCHAR(50)
);

CREATE TABLE medio_pago (
    id_medio_pago INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    id_medio_pago INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),

    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),

    FOREIGN KEY (id_medio_pago) REFERENCES medio_pago(id_medio_pago)
);

CREATE TABLE detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    producto VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta)
);

-- Fake data
INSERT INTO empleados (nombre, cargo, fecha_contratacion, salario)
VALUES
	('Juan Perez', 'Vendedor', '2022-03-10', 850000),
	('Maria Gonzalez', 'Vendedor', '2021-07-15', 920000),
	('Pedro Soto', 'Supervisor', '2020-01-20', 1200000);

INSERT INTO clientes (nombre, email, telefono, ciudad)
VALUES
	('Carlos Rojas', 'crojas@email.com', '987654321', 'Santiago'),
	('Ana Torres', 'atorres@email.com', '912345678', 'Valparaiso'),
	('Luis Herrera', 'lherrera@email.com', '998877665', 'Concepcion'),
	('Paula Diaz', 'pdiaz@email.com', '955443322', 'Santiago');

INSERT INTO medio_pago (descripcion)
VALUES
	('Efectivo'),
	('Tarjeta Debito'),
	('Tarjeta Credito'),
	('Transferencia');

INSERT INTO ventas (fecha, id_cliente, id_empleado, id_medio_pago, total)
VALUES
	('2026-01-10', 1, 1, 2, 45000),
	('2026-01-15', 2, 2, 3, 80000),
	('2026-02-05', 3, 1, 1, 35000),
	('2026-02-18', 4, 2, 4, 120000),
	('2026-03-02', 1, 1, 3, 65000),
	('2026-03-20', 2, 2, 2, 95000);

INSERT INTO detalle_venta (id_venta, producto, cantidad, precio_unitario)
VALUES
	(1, 'Notebook', 1, 45000),
	(2, 'Monitor', 2, 40000),
	(3, 'Teclado', 1, 35000),
	(4, 'Impresora', 2, 60000),
	(5, 'Mouse Gamer', 5, 13000),
	(6, 'Disco SSD', 1, 95000);
