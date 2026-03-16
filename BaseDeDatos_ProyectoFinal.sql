CREATE SCHEMA IF NOT EXISTS ProyectoIntegrador_VENTAS;

CREATE TABLE IF NOT EXISTS Categorias (
	idCategoria INT PRIMARY KEY,
    categoria VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Productos (
	idProducto INT PRIMARY KEY,
    producto VARCHAR(100),
    idCategoria INT,
	costo DECIMAL(12, 2),
    precio DECIMAL(12, 2),
    stock INT,
    FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria)
);

CREATE TABLE IF NOT EXISTS MetodosDePago (
	idPago INT PRIMARY KEY,
    metodo VARCHAR (50),
    descripcion TEXT
);

CREATE TABLE IF NOT EXISTS clientes (
	idCliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR (50),
    email VARCHAR (100),
    fechaRegistro DATE,
    provincia VARCHAR (50),
    ciudad VARCHAR (50)
);

CREATE TABLE IF NOT EXISTS ventas (
	idVenta INT PRIMARY KEY,
    idCliente INT,
    fechaTransaccion TIMESTAMP,
    idProducto INT,
    cantidad INT,
    metodoPago INT,
    estado VARCHAR(50),
    fechaEntrega DATE, 
    total DECIMAL(15, 2),
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
    FOREIGN KEY (idProducto) REFERENCES productos(idProducto),
    FOREIGN KEY (metodoPago) REFERENCES metodosdePago(idPago)
);



