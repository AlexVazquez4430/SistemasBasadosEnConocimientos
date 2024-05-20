(deftemplate consumidor
  (slot identificador-consumidor)
  (slot nombre)
  (slot ciudad)
  (slot telefono)
)

(deftemplate producto
  (slot identificador-producto)
  (slot marca)
  (slot modelo)
  (slot categoria)
  (slot precio)
)

(deftemplate pedido
  (slot identificador-pedido)
  (slot identificador-consumidor)
  (multislot tarjeta)
)

(deftemplate producto-pedido
  (slot identificador-pedido)
  (slot identificador-producto)
  (slot cantidentificadorad (default 1))
)