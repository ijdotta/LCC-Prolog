sortList(Input, Output) :-
    selectionSort(Input, Output).

selectionSort([], []).
selectionSort(Input, [MiniumValue | OrderedSublist]) :-
    removeMinium(Input, MiniumValue, ReducedList),
    selectionSort(ReducedList, OrderedSublist).

% listas de listas de letras = palabras :: [ [g, a, t, o] , [c, a, s, a] , [a, v, i, o, n] ]

removeMinium([P | []], P, []).
removeMinium([P | Ps], P, Ps) :-
    removeMinium(Ps, MiniumValue, _ReducedList),
    less(P, MiniumValue).
removeMinium([P | Ps], MiniumValue, [P | ReducedList]) :-
    removeMinium(Ps, MiniumValue, ReducedList),
    not(less(P, MiniumValue)).

less([LP1 | _LsP1], [LP2 | _LsP2]) :-
    LP1 @< LP2.
less([LP1 | LsP1], [LP2 | LsP2]) :-
    LP1 =@= LP2,
    less(LsP1, LsP2).


