(defrule regla1
  (esta-encendido (objeto Silla) (locacion Floor))
  (esta-encendido (objeto Mono) (locacion Floor))
  =>
  (assert (Mono-mover (objeto Silla) (locacion Floor)))
  (printout t "R-01: Mono movers to the Silla on the floor" crlf)
)

(defrule regla2
  ?d <- (Mono-mover (objeto Silla) (locacion Floor))
  ?f <- (esta-encendido (objeto Silla) (locacion Floor))
  (esta-encendido (objeto Mono) (locacion Floor))
  =>
  (assert (Mono-agarrar (objeto Silla)))
  (printout t "R-02: Mono agarrars the Silla" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule regla3
  (Mono-agarrar (objeto Silla))
  (esta-encendido (objeto Mono) (locacion Floor))
  =>
  (assert (Mono-mover (objeto Desk) (locacion Floor)))
  (printout t "R-03: Mono movers to the desk on the floor" crlf)
)

(defrule regla4
  ?d <- (Mono-mover (objeto Desk) (locacion Floor))
  ?f <- (esta-encendido (objeto Mono) (locacion Floor))
  (esta-encendido (objeto Desk) (locacion Floor))
  (esta-encendido (objeto Mono) (locacion Floor))
  =>
  (assert (esta-encendido (objeto Mono) (locacion Desk)))
  (printout t "R-04: Mono is on the desk" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule regla5
  (esta-encendido (objeto Mono) (locacion Desk))
  ?d <- (Mono-agarrar (objeto Silla))
  =>
  (assert (Mono-poner (objeto Silla) (locacion Desk)))
  (printout t "R-05: Mono poners the Silla on the desk" crlf)
  (retract ?d)
)

(defrule regla6
  ?d <- (Mono-poner (objeto Silla) (locacion Desk))
  (esta-encendido (objeto Mono) (locacion Desk))
  =>
  (assert (esta-encendido (objeto Silla) (locacion Desk)))
  (printout t "R-06: Silla is on the desk" crlf)
  (retract ?d)
)

(defrule regla7
  (esta-encendido (objeto Mono) (locacion Desk))
  (esta-encendido (objeto Silla) (locacion Desk))
  (esta-encendido (objeto Desk) (locacion Floor))
  =>
  (assert (Mono-mover (objeto Silla) (locacion Desk)))
  (printout t "R-07: Mono movers to the Silla on the desk" crlf)
)

(defrule regla8
  ?d <- (Mono-mover (objeto Silla) (locacion Desk))
  ?f <- (esta-encendido (objeto Mono) (locacion Desk))
  (esta-encendido (objeto Silla) (locacion Desk))
  (esta-encendido (objeto Desk) (locacion Floor))
  =>
  (assert (esta-encendido (objeto Mono) (locacion Silla)))
  (printout t "R-08: Mono is on the Silla" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule regla9
  ?d <- (esta-encendido (objeto Banana) (locacion Ceiling))
  (esta-encendido (objeto Mono) (locacion Silla))
  (esta-encendido (objeto Silla) (locacion Desk))
  (esta-encendido (objeto Desk) (locacion Floor))
  =>
  (assert (Mono-agarrar (objeto Banana)))
  (printout t "R-09: Mono agarrars the banana" crlf)
  (retract ?d)
)

(defrule regla10
  ?d <- (Mono-agarrar (objeto Banana))
  (esta-encendido (objeto Mono) (locacion Silla))
  (esta-encendido (objeto Silla) (locacion Desk))
  (esta-encendido (objeto Desk) (locacion Floor))
  =>
  (assert (Mono-come (objeto Banana)))
  (printout t "R-10: Mono comes the banana" crlf)
  (retract ?d)
)

(defrule regla11
  ?d <- (Mono-estado (estado Hungry))
  (Mono-come (objeto Banana))
  (esta-encendido (objeto Mono) (locacion Silla))
  (esta-encendido (objeto Silla) (locacion Desk))
  (esta-encendido (objeto Desk) (locacion Floor))
  =>
  (assert (Mono-estado (estado Happy)))
  (printout t "R-11: Mono is happy" crlf)
  (retract ?d)
)