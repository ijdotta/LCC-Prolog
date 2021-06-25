pop(usa, 203).
pop(india, 503).

area(usa, 3).
area(india, 1).

density(X,Y) :-
    pop(X,P),
    area(X,A),
    Y is P/A.