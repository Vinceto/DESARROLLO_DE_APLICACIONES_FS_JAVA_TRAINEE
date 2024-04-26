# M3/D10

Diagrama en Draw.io

describe el modelo entidad relacion donde participan las entidades:
1.- Cliente (dni, nombre, apellido, direccion)
2.- Producto (sku, nombre, precio)
3.- Documento Compra (sku, dni, numero)

Cliente representa a los compradores.
Producto representa lo que vendemos
Documento de compra representa la venta de un producto a un cliente en particular, lo que genera un documento como boleta o factura


en terminos de relaciones:
- un cliente puede comprar de 0 a muchas veces en el local
- un producto puede aparecer de 0 a muchas veces en el documento
- un documento de debe estar asociado a almenos 1 producto
- un documento de compra debe estar asociado a 1 cliente