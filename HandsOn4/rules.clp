(defrule consumidor-no-compra
  (consumidor (identificador-consumidor ?ic) (nombre ?n))
  (not (pedido (identificador-consumidor ?ic)))
  =>
  (printout t "R-01: El consumidor " ?n " no ha realizado ninguna compra." crlf)
)

(defrule rebaja-consumidor-no-compra
  (consumidor (identificador-consumidor ?ic) (nombre ?n))
  (not (pedido (identificador-consumidor ?ic)))
  =>
  (assert (invocar-rebaja ?ic 5))
  (printout t "R-02: El consumidor " ?n " tiene un 5% de rebaja para su primera compra." crlf)
)

(defrule invocar-consumidor-rebaja
  ?lcd <- (invocar-rebaja ?ic ?d)
  (consumidor (identificador-consumidor ?ic) (nombre ?n) (telefono ?t))
  =>
  (printout t "R-03: Llamando al consumidor " ?n " al telefono " ?t " para ofrecerle una rebaja del " ?d "%." crlf)
  (retract ?lcd)
)

(defrule mostrar-productos-apple
  (producto (marca Apple) (modelo ?m))
  =>
  (printout t "R-04: Producto de Apple: " ?m "." crlf)
)

(defrule mostrar-productos-computadora
  (producto (categoria Computadora) (marca ?ma) (modelo ?mo) (precio ?p))
  =>
  (printout t "R-05: Computadora de " ?ma ", modelo " ?mo ", cuesta $" ?p "." crlf)
)

(defrule mostrar-productos-menos-18
  (producto (marca ?ma) (modelo ?mo) (precio ?p & : (< ?p 18000)))
  =>
  (printout t "R-06: Producto Barato (< $18,000) de " ?ma ", modelo " ?mo " cuesta $" ?p "." crlf)
)

(defrule mostrar-productos-mas-18
  (producto (marca ?ma) (modelo ?mo) (precio ?p & : (> ?p 18000)))
  =>
  (printout t "R-07: Producto Caro (> $18,000) de " ?ma ", modelo " ?mo " cuesta $" ?p "." crlf)
)

(defrule mostrar-productos-precio
  (producto (identificador-producto ?ip) (marca ?ma) (modelo ?mo) (precio ?p))
  =>
  (printout t "R-08: " ?ip " | " ?ma " | " ?mo " | " ?p crlf)
)

(defrule rebaja-consumidor-dos-compras
  (consumidor (identificador-consumidor ?ic) (nombre ?n))
  (pedido (identificador-consumidor ?ic) (identificador-pedido ?io1))
  (pedido (identificador-consumidor ?ic) (identificador-pedido ?io2 & : (neq ?io1 ?io2)))
  =>
  (assert (invocar-rebaja ?ic 10))
  (printout t "R-09: El consumidor " ?n " tiene un 10% de rebaja para su tercera compra." crlf)
)

(defrule meses-sin-intereses-bbva
  (pedido (identificador-pedido ?io) (identificador-consumidor ?ic) (tarjeta BBVA ?g))
  (consumidor (identificador-consumidor ?ic) (nombre ?n))
  =>
  (printout t "R-10: El pedido " ?io " del consumidor " ?n " tiene 12 MSI por BBVA." crlf)
)

(defrule rebaja-dos-productos-misma-marca
  (pedido (identificador-pedido ?io) (identificador-consumidor ?ic))
  (consumidor (identificador-consumidor ?ic) (nombre ?n))
  (producto-pedido (identificador-pedido ?io) (identificador-producto ?ip1))
  (producto-pedido (identificador-pedido ?io) (identificador-producto ?ip2))
  (producto (identificador-producto ?ip1) (marca ?ma))
  (producto (identificador-producto ?ip2) (marca ?ma & : (neq ?ip1 ?ip2)))
  =>
  (assert (invocar-rebaja ?ic 15))
  (printout t "R-11: El pedido " ?io " del consumidor " ?n " tiene un 15% de rebaja por tener dos productos de la marca " ?ma "." crlf)
)

(defrule mostrar-ciudad-consumidores
  (consumidor (nombre ?n) (ciudad ?c))
  =>
  (printout t "R-12: El consumidor " ?n " vive en " ?c "." crlf)
)

(defrule mostrar-productos-menos-comprados
  (producto (identificador-producto ?ip) (marca ?ma) (modelo ?mo))
  (not (producto-pedido (identificador-producto ?ip)))
  =>
  (printout t "R-13: Producto menos comprado: " ?ma " " ?mo "." crlf)
)

(defrule mostrar-productos-pedido
  (pedido (identificador-pedido ?io) (identificador-consumidor ?ic))
  (producto-pedido (identificador-pedido ?io) (identificador-producto ?ip))
  (producto (identificador-producto ?ip) (marca ?ma) (modelo ?mo))
  =>
  (printout t "R-14: Producto de El pedido " ?io ": " ?ma " " ?mo "." crlf)
)

(defrule rebaja-dos-productos-misma-categoria
  (pedido (identificador-pedido ?io) (identificador-consumidor ?ic))
  (consumidor (identificador-consumidor ?ic) (nombre ?n))
  (producto-pedido (identificador-pedido ?io) (identificador-producto ?ip1))
  (producto-pedido (identificador-pedido ?io) (identificador-producto ?ip2))
  (producto (identificador-producto ?ip1) (categoria ?ca))
  (producto (identificador-producto ?ip2) (categoria ?ca & : (neq ?ip1 ?ip2)))
  =>
  (assert (invocar-rebaja ?ic 15))
  (printout t "R-15: El pedido " ?io " del consumidor " ?n " tiene un 15% de rebaja por tener dos productos de la categoria " ?ca "." crlf)
)

(defrule rebaja-consumidor-primera-pedido
  (pedido (identificador-consumidor ?ic) (identificador-pedido 1))
  (consumidor (identificador-consumidor ?ic) (nombre ?n))
  =>
  (assert (invocar-rebaja ?ic 50))
  (printout t "R-16: El consumidor " ?n " tiene un 50% de rebaja por haber hecho la primera pedido de la tienda." crlf)
)

(defrule rebaja-mica-protector
  (pedido (identificador-pedido ?io) (identificador-consumidor ?ic))
  (producto-pedido (identificador-pedido ?io) (identificador-producto ?ip))
  (producto (identificador-producto ?ip) (categoria Celular))
  (consumidor (identificador-consumidor ?ic) (nombre ?n))
  =>
  (assert (invocar-rebaja ?ic 20))
  (printout t "R-17: El consumidor " ?n " tiene un 20% de rebaja en una mica y un protector de pantalla por comprar un celular." crlf)
)

(defrule rebaja-consumidor-hermosillo
  (consumidor (identificador-consumidor ?ic) (nombre ?n) (ciudad "Hermosillo"))
  =>
  (assert (invocar-rebaja ?ic 10))
  (printout t "R-18: El consumidor " ?n " tiene un 10% de rebaja por vivir en Hermosillo." crlf)
)

(defrule seguro-consumidor-computadora
  (pedido (identificador-pedido ?io) (identificador-consumidor ?ic))
  (producto-pedido (identificador-pedido ?io) (identificador-producto ?ip))
  (producto (identificador-producto ?ip) (modelo ?m) (categoria Computadora))
  (consumidor (identificador-consumidor ?ic) (nombre ?n))
  =>
  (assert (invocar-seguro ?ic))
  (printout t "R-19: El consumidor " ?n " compro una Computadora " ?m ", se le ofrecera un seguro." crlf)
)

(defrule invocar-consumidor-seguro
  ?lcs <- (invocar-seguro ?ic)
  (consumidor (identificador-consumidor ?ic) (nombre ?n) (telefono ?t))
  =>
  (printout t "R-20: Llamando al consumidor " ?n " al telefono " ?t " para ofrecerle un seguro." crlf)
  (retract ?lcs)
)