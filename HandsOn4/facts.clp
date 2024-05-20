(deffacts consumidores
  (consumidor (identificador-consumidor 1) (nombre "Gustavo")   (ciudad "Tamaulipas")    (telefono 4534765984))
  (consumidor (identificador-consumidor 2) (nombre "Mirna") (ciudad "Guerrero")    (telefono 9865113376))
  (consumidor (identificador-consumidor 3) (nombre "Sofia")    (ciudad "Culiacan") (telefono 1276554565))
  (consumidor (identificador-consumidor 4) (nombre "Vane")   (ciudad "Monterry")          (telefono 7800562344))
  (consumidor (identificador-consumidor 5) (nombre "Lidia")   (ciudad "Queretaro")    (telefono 3321074970))
  (consumidor (identificador-consumidor 6) (nombre "Cesar")  (ciudad "GDL")       (telefono 3322957912))
  (consumidor (identificador-consumidor 7) (nombre "Daniel") (ciudad "Zacatecas")    (telefono 5679124567))
)

(deffacts productos
  (producto (identificador-producto 1) (marca Apple)   (modelo "IPhone 15")      (categoria Celular)     (precio 25000))
  (producto (identificador-producto 2) (marca Apple)   (modelo "Mac Book Air")   (categoria Computadora) (precio 30000))
  (producto (identificador-producto 3) (marca Samsung) (modelo "Galaxy S24")     (categoria Celular)     (precio 15000))
  (producto (identificador-producto 4) (marca Samsung) (modelo "Pantalla OLED")  (categoria TV)          (precio 55000))
  (producto (identificador-producto 5) (marca DELL)      (modelo "Inspiron")        (categoria Computadora) (precio 25000))
  (producto (identificador-producto 6) (marca Apple) (modelo "iPad Air 5")  (categoria Tablet)      (precio 26000))
  (producto (identificador-producto 7) (marca Xiaomi)   (modelo "Mi band 8") (categoria Reloj)       (precio 3000))
)

(deffacts pedidoes
  (pedido (identificador-pedido 1) (identificador-consumidor 5) (tarjeta NU Visa))
  (pedido (identificador-pedido 2) (identificador-consumidor 5) (tarjeta Liverpool Visa))
  (pedido (identificador-pedido 3) (identificador-consumidor 2) (tarjeta Banorte Mastercard))
  (pedido (identificador-pedido 4) (identificador-consumidor 3) (tarjeta BBVA Mastercard))
  (pedido (identificador-pedido 5) (identificador-consumidor 1) (tarjeta BBVA Visa))
)

(deffacts productos-pedidoes
  (producto-pedido (identificador-pedido 1) (identificador-producto 1) (cantidentificadorad 1))
  (producto-pedido (identificador-pedido 1) (identificador-producto 7) (cantidentificadorad 1))

  (producto-pedido (identificador-pedido 2) (identificador-producto 2) (cantidentificadorad 1))

  (producto-pedido (identificador-pedido 3) (identificador-producto 3) (cantidentificadorad 1))
  (producto-pedido (identificador-pedido 3) (identificador-producto 6) (cantidentificadorad 1))

  (producto-pedido (identificador-pedido 4) (identificador-producto 7) (cantidentificadorad 1))

  (producto-pedido (identificador-pedido 5) (identificador-producto 2) (cantidentificadorad 1))
  (producto-pedido (identificador-pedido 5) (identificador-producto 5) (cantidentificadorad 1))
)

