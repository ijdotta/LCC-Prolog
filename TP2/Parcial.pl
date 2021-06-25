:- ensure_loaded('Listas.pl').

% Una lista L es doble si es de la forma L1.L1
% i.e. si L es la conctenación de dos listas identicas.

% esListaDoble(+L)
esListaDoble(L) :-
    append(L1, L1, L).


% hallar LPre y LPos dados una lista L y un elemento E. 
% L es de la forma LPre.x.LPos
% ej: [1, 2, 3, x, 4, 5, 6].

% hallarPrePos(+L, +E, -LPre, -LPos)
hallarPrePos(L, E, LPre, LPos) :-
    append(LPre, [E | LPos], L).