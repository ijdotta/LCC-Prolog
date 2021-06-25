dias(ene, 31).
dias(mar, 31).
dias(abr, 30).
dias(may, 31).
dias(jun, 30).
dias(jul, 31).
dias(ago, 31).
dias(sep, 30).
dias(oct, 31).
dias(nov, 30).
dias(dic, 31).

dias(Anio, feb, 29) :- isBisiesto(Anio).
dias(Anio, feb, 28) :- not(isBisiesto(Anio)).

isBisiesto(Anio) :- divisible_por_4(Anio), not(divisible_por_100(Anio)).
isBisiesto(Anio) :- divisible_por_4(Anio), divisible_por_100(Anio), divisible_por_400(Anio).

divisible_por_4(Anio) :-
    0 is Anio mod 4.

divisible_por_100(Anio) :-
    0 is Anio mod 100.

divisible_por_400(Anio) :-
    0 is Anio mod 400.

/*Alternativa*/
isBisiesto(X) :- 0 is X mod 4, M is X mod 100, M \= 0.
isBisiesto(X) :- 0 is X mod 400.

