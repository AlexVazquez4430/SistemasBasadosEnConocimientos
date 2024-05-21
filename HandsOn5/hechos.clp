(deffacts mono-hambriento
  (mono-estado (estado hambriento))
)

(deffacts esta-encendido-objetos
  (esta-encendido (objeto mono) (locacion Piso))
  (esta-encendido (objeto Silla) (locacion Piso))
  (esta-encendido (objeto Escritorio) (locacion Piso))
  (esta-encendido (objeto Platano) (locacion Techo))
)