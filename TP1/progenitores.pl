progenitor(abel, cesar). 
progenitor(abel, dario). 
progenitor(flavia, cesar).
progenitor(flavia, dario). 
progenitor(dario, hector). 
progenitor(luisa, hector).
progenitor(dario, ines). 
progenitor(luisa, ines). 
progenitor(omar, maria).
progenitor(sara, maria). 
progenitor(omar, victor). 
progenitor(sara, victor).

parejaCasada(abel, flavia).
parejaCasada(dario, luisa).
parejaCasada(omar, sara). 
parejaCasada(hector, maria).

esMujer(flavia).
esMujer(luisa).
esMujer(sara).

/*a) padresDe(X,Y,Z), que determina si X e Y son los padres de Z.*/
padresDe(X,Y,Z) :-
    progenitor(X, Z),
    progenitor(Y, Z),
    X \= Y.

/*b) tuvoHijos(X), que determina si X tuvo alg´un hijo.*/
tuvoHijos(X) :-
    progenitor(X, Y),
    Y \= X.

/*c) esMadre(X), que determina si X ha sido madre. Verificar que el predicado definido no suministre respuestas incorrectas. De ser necesario, incorporar a la base de
conocimiento provista nuevos predicados auxiliares modelando informaci´on extra,
indicando las razones que fundamentan dicha incorporaci´on.*/

esMadre(X) :-
    esMujer(X),
    tuvoHijos(X).

/*d) hermanos(X,Y), que determina si X e Y son hermanos. Explicitar la noci´on de hermano adoptada.*/
hermanos(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    X \= Y.

/*e) tio(X,Y), que determina si X es uno de los t´ıos de Y.*/
tio(X, Y) :-
    progenitor(P, Y),
    hermanos(X, P).

/*f ) abuelo(X,Y), que determina si X es uno de los abuelos de Y.*/
abuelo(X, Y) :-
    progenitor(X, P),
    progenitor(P, Y).

/*g) tioAbuelo(X,Y), que determina si X es uno de los t´ıos abuelos de Y. Considerando la
base de conocimiento suministrada, >qu´e particularidad presenta esta relaci´on?*/
tioAbuelo(X, Y) :-
    abuelo(A, Y),
    hermanos(X, A).

/*h) ancestro(X,Y), que determina si X es un ancestro de Y. Cabe se~nalar que esta relaci´on
coincide con la clausura transitiva de la relaci´on progenitor/2*/
ancestro(X, Y) :-
    progenitor(X,Y);
    abuelo(X,Y);
    progenitor(X, P),
    progenitor(P, Q),
    progenitor(Q, Y).

    /*sucesivamente...*/

casados(X, Y) :-
    parejaCasada(X, Y);
    parejaCasada(Y, X).

suegra(X, Y) :-
    esMujer(X),
    progenitor(X, S),
    casados(S, Y).

suegro(X, Y) :-
    not(esMujer(X)),
    progenitor(X, S),
    casados(S, Y).

padresPoliticosDe(X, Y, Z) :-
    suegra(X, Z),
    suegro(Y, Z);
    suegra(Y, Z),
    suegro(X, Z).

nuera(X, Y) :-
    esMujer(x),
    casados(X, S),
    progenitor(Y, S).

yerno(X, Y) :-
    not(esMujer(x)),
    casados(X, S),
    progenitor(Y, S).

cunado(X, Y) :-
    not(esMujer(X)),
    casados(X, S),
    hermanos(S, Y);

    not(esMujer(X)),
    casados(Y, S),
    hermanos(X, S).

cunada(X, Y) :-
    esMujer(X),
    casados(X, S),
    hermanos(S, Y);
    esMujer(X),
    casados(Y, S),
    hermanos(X, S).

hermanosPoliticos(X, Y) :-
    cunado(X, Y);
    cunada(X, Y).

concunados(X, Y) :-
    cunado(X, P),
    cunado(P, Y),
    X \= Y;
    cunada(X, P),
    cunado(P, Y),
    X \= Y;
    cunado(X, P),
    cunada(P, Y),
    X \= Y;
    cunada(X, P),
    cunada(P, Y),
    X \= Y.