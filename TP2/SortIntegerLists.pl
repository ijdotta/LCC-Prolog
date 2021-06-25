% sort num list
sortIntegerList(Input, Output) :-
    selectionSort(Input, Output).

selectionSort([], []).
selectionSort(Input, [MiniumValue | OrderedSublist]) :-
    removeMinium(Input, MiniumValue, ReducedList),
    selectionSort(ReducedList, OrderedSublist).

removeMinium([X | []], X, []).
removeMinium([X | Xs], X, Xs) :-
    removeMinium(Xs, MiniumValue, _ReducedList),
    X < MiniumValue.
removeMinium([X | Xs], MiniumValue, [X | ReducedList]) :-
    removeMinium(Xs, MiniumValue, ReducedList),
    MiniumValue =< X.

