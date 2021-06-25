:- ensure_loaded('Listas.pl').

/*Lista es conjunto válido: */
isValidSet([]).
isValidSet([X | Xs]) :-
    not(contains(X, Xs)),
    isValidSet(Xs).

/*Set definition*/
set(S) :- isValidSet(S).

/*Determinar si un elemento pertenece a un dado conjunto*/
member(X, S) :-
    set(S),
    contains(X, S).

/*PREGUNTAR: ESTÁ BIEN ASÍ? PONEMOS SET(S) ADENTRO DEL CUERPO PARA CHEQUEAR? */
add(X, S, [X | S]) :-
    set(S),
    not(member(X, S)).

% union(+S1, +S2, -S3)
union(S1, S2, S3) :-
    findall(X, (member(X, S2), not(member(X, S1))), L),
    concat(S1, L, S3).

% intersect(+S1, +S2, -S3)
intersect(S1, S2, S3) :-
    set(S1),
    set(S2),
    findall(X, (member(X, S2), member(X, S1)), S3).

% diferencia(+S1, +S2, -S3)
diferencia(S1, S2, S3) :-
    set(S1),
    set(S2),
    findall(X, (member(X, S1), not(member(X, S2))), S3).

% makeSet(+L, -S)

makeSet([] , []).

makeSet([X | Xs], [X | Ss]) :-
    not(contains(X, Xs)),
    makeSet(Xs, Ss).

makeSet([X | Xs], Ss) :-
    contains(X, Xs),
    makeSet(Xs, Ss).
