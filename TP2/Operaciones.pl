s(0).

/* Generación de números */
s(s(X)) :- s(X).

/*  
    Alternativa: 
    s(X) :- X = s(Y).   
*/

/*  Suma   
    CB: sumar 0.
    CR: la suma entre X e Y es el sucesor entre la suma de pred(x) e Y.
*/

suma(X, Y, Rdo) :-
    X = 0,
    Rdo = Y.

suma(s(PX), Y, s(PXY)) :- suma(PX, Y, PXY).



/*Producto*/

/*Casos X o Y = 0*/
producto(X, _, Rdo) :-
    X = 0,
    Rdo = 0.

producto(_, Y, Rdo) :-
    Y = 0,
    Rdo = 0.

/*Casos Base: X o Y = 1*/
producto(X, Y, Rdo) :-
    X = s(0),
    Rdo = Y.

producto(X, Y, Rdo) :-
    Y = s(0),
    Rdo = X.

/*Casos recursivos*/
producto(s(PX), Y, Rdo) :-
    producto(PX, Y, RProd),
    suma(Y, RProd, Rdo).


/*POTENCIA*/

/*Caso base: Y = 0*/
/*pot(0, 0, _) :- 0 = 1.*/
pot(_, 0, Rdo) :- Rdo = s(0).
pot(0, _, Rdo) :- Rdo = 0.

pot(X, s(PY), Rdo) :- 
    pot(X, PY, RPot),
    producto(X, RPot, Rdo).