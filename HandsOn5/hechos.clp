(deffacts Mono-hungry
  (Mono-estado (estado Hungry))
)

(deffacts esta-encendido-objetos
  (esta-encendido (objeto Mono) (locacion Floor))
  (esta-encendido (objeto Silla) (locacion Floor))
  (esta-encendido (objeto Desk) (locacion Floor))
  (esta-encendido (objeto Banana) (locacion Ceiling))
)