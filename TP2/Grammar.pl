% S -> aSc -> aaScc -> aaaSccc
% S -> T -> bTc -> bbTcc -> bbbTccc
% T -> bc

% L(G) = a^n b^m c^(n+m) con n >= 0 y m >= 1

% [a, a, a, b, b, c, c, c, c, c]


% Caso aa...cc
pertenece(String) :-
    append([Ini | Substring], [Fin], String),
    Ini = 'a',
    Fin = 'c',
    pertenece(Substring).

% Caso ab...cc
pertenece(String) :-
    append([Ini | Substring], [Fin], String),
    Ini = 'a',
    Fin = 'c',
    perteneceBC(Substring).

% Caso b...c
pertenece(String) :-
    perteneceBC(String).

% Caso bc
perteneceBC(String) :-
    append([Ini | [] ], [Fin], String),
    Ini = 'b',
    Fin = 'c'.

perteneceBC(String) :-
    append([Ini | Substring], [Fin], String),
    Ini = 'b',
    Fin = 'c',
    perteneceBC(Substring).



%%% Alternativa: sobre la longitud de la secuencia.
longitud([], 0).
longitud([_X | Xs], L) :-
    longitud(Xs, LXs),
    L is LXs + 1.

esCadena(String) :-
    append(AABB, CCCC, String),
    longitud(AABB, Lab),
    longitud(CCCC, Lcc),
    Lab = Lcc,
    controlAABB(AABB),
    controlCCCC(CCCC).

controlAABB(AABB) :-
    append(AA, BB, AABB),
    longitud(AA, La),
    longitud(BB, Lb),
    La = Lb,
    controlAA(AA),
    controlBB(BB).

controlAA(['a' | [] ]).
controlAA([A | As]) :-
    A = 'a',
    controlAA(As).

controlBB(['b' | [] ]).
controlBB([B | Bs]) :-
    B = 'b',
    controlBB(Bs).

controlCCCC(['c' | []]).

controlCCCC([C | Cs]) :-
    C = 'c',
    controlCCCC(Cs).
