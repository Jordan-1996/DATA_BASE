SELECT name  from cliente JOIN factura ON cliente.cliente_id = factura.id_factura where factura.subtotal >100;
