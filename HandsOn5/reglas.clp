(defrule regla1
  (esta-encendido (objeto Silla) (locacion Piso))
  (esta-encendido (objeto mono) (locacion Piso))
  =>
  (assert (mono-mover (objeto Silla) (locacion Piso)))
  (printout t "R-01: mono movers to the Silla on the Piso" crlf)
)

(defrule regla2
  ?d <- (mono-mover (objeto Silla) (locacion Piso))
  ?f <- (esta-encendido (objeto Silla) (locacion Piso))
  (esta-encendido (objeto mono) (locacion Piso))
  =>
  (assert (mono-agarrar (objeto Silla)))
  (printout t "R-02: mono agarrars the Silla" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule regla3
  (mono-agarrar (objeto Silla))
  (esta-encendido (objeto mono) (locacion Piso))
  =>
  (assert (mono-mover (objeto Escritorio) (locacion Piso)))
  (printout t "R-03: mono movers to the Escritorio on the Piso" crlf)
)

(defrule regla4
  ?d <- (mono-mover (objeto Escritorio) (locacion Piso))
  ?f <- (esta-encendido (objeto mono) (locacion Piso))
  (esta-encendido (objeto Escritorio) (locacion Piso))
  (esta-encendido (objeto mono) (locacion Piso))
  =>
  (assert (esta-encendido (objeto mono) (locacion Escritorio)))
  (printout t "R-04: mono is on the Escritorio" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule regla5
  (esta-encendido (objeto mono) (locacion Escritorio))
  ?d <- (mono-agarrar (objeto Silla))
  =>
  (assert (mono-poner (objeto Silla) (locacion Escritorio)))
  (printout t "R-05: mono poners the Silla on the Escritorio" crlf)
  (retract ?d)
)

(defrule regla6
  ?d <- (mono-poner (objeto Silla) (locacion Escritorio))
  (esta-encendido (objeto mono) (locacion Escritorio))
  =>
  (assert (esta-encendido (objeto Silla) (locacion Escritorio)))
  (printout t "R-06: Silla is on the Escritorio" crlf)
  (retract ?d)
)

(defrule regla7
  (esta-encendido (objeto mono) (locacion Escritorio))
  (esta-encendido (objeto Silla) (locacion Escritorio))
  (esta-encendido (objeto Escritorio) (locacion Piso))
  =>
  (assert (mono-mover (objeto Silla) (locacion Escritorio)))
  (printout t "R-07: mono movers to the Silla on the Escritorio" crlf)
)

(defrule regla8
  ?d <- (mono-mover (objeto Silla) (locacion Escritorio))
  ?f <- (esta-encendido (objeto mono) (locacion Escritorio))
  (esta-encendido (objeto Silla) (locacion Escritorio))
  (esta-encendido (objeto Escritorio) (locacion Piso))
  =>
  (assert (esta-encendido (objeto mono) (locacion Silla)))
  (printout t "R-08: mono is on the Silla" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule regla9
  ?d <- (esta-encendido (objeto Platano) (locacion Techo))
  (esta-encendido (objeto mono) (locacion Silla))
  (esta-encendido (objeto Silla) (locacion Escritorio))
  (esta-encendido (objeto Escritorio) (locacion Piso))
  =>
  (assert (mono-agarrar (objeto Platano)))
  (printout t "R-09: mono agarrars the Platano" crlf)
  (retract ?d)
)

(defrule regla10
  ?d <- (mono-agarrar (objeto Platano))
  (esta-encendido (objeto mono) (locacion Silla))
  (esta-encendido (objeto Silla) (locacion Escritorio))
  (esta-encendido (objeto Escritorio) (locacion Piso))
  =>
  (assert (mono-come (objeto Platano)))
  (printout t "R-10: mono comes the Platano" crlf)
  (retract ?d)
)

(defrule regla11
  ?d <- (mono-estado (estado hambriento))
  (mono-come (objeto Platano))
  (esta-encendido (objeto mono) (locacion Silla))
  (esta-encendido (objeto Silla) (locacion Escritorio))
  (esta-encendido (objeto Escritorio) (locacion Piso))
  =>
  (assert (mono-estado (estado Happy)))
  (printout t "R-11: mono is happy" crlf)
  (retract ?d)
)