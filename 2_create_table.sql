DROP TABLE IF EXISTS listado_producto;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS producto; 
DROP TABLE IF EXISTS categoria;


CREATE TABLE cliente(
    cliente_id SERIAL PRIMARY KEY,
    name VARCHAR(80),
    rut VARCHAR(10),
    direccion VARCHAR(10)
);



CREATE TABLE factura(
  id_factura SERIAL PRIMARY KEY,
  n_factura INT,
  fecha     DATE DEFAULT NOW(),
  subtotal  INT,
  IVA       INT,
 FOREIGN KEY (id_factura) REFERENCES cliente(cliente_id)
);


CREATE TABLE categoria(
  id_categoria SERIAL PRIMARY KEY,
  name VARCHAR(80),
  descripcion  TEXT
);
 
CREATE TABLE producto(
  id_producto SERIAL PRIMARY KEY,
  name VARCHAR(80),
  descripcion  TEXT,
  valor_uni    INT,
 FOREIGN KEY (id_producto)  REFERENCES categoria(id_categoria)
);

CREATE TABLE listado_producto(
  factura_id INT,
  producto_id INT,
  id SERIAL PRIMARY KEY,
  cantidad     INT,
  valor_total  INT,
  valor_uni    INT,
 FOREIGN KEY (factura_id) REFERENCES factura(id_factura),
 FOREIGN KEY (producto_id) REFERENCES producto(id_producto)
);