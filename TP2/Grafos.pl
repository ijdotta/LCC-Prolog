:- ensure_loaded('Listas.pl').
:- ensure_loaded('Conjuntos.pl').

/*
edges(E) :-
    set(E).
    %findall(Edge, member(Edge, E), Edge = edge(vertex(Source), vertex(Target), Distance)).

vertices(V) :-
    set(V).
    %findall(Vertex, member(Vertex, V), Vertex = vertex(Label)).

graph(V, E) :-
    vertices(V),
    edges(E).
*/

% cyclic path
path(X, X).
path(S, T) :-
    edge(S, X, _),
    path(X, T).


% non-cyclic path
nonVisited(_, []).
nonVisited(X, [V, Vs]) :-
    X \= V,
    nonVisited(X, Vs).

path(X, X, _).
path(S, T, _) :- edge(S, T, _).
path(S, T, V) :-
    edge(S, X, _),
    nonVisited(X, V),
    path(X, T, [X | V]).

% cyclic distance
distance(X, X, 0).
distance(S, T, D) :-
    edge(S, X, D1),
    distance(X, T, D2),
    D is D1 + D2.

% non-cyclic distance
distance(X, X, _).
distance(S, T, D) :- edge(S, T, D).
distance(S, T, V, D) :-
    edge(S, X, D1),
    nonVisited(X, V),
    distance(X, T, [X | V], D2),
    D is D1 + D2.