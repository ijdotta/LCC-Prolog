/*Crear lista*/
/*
new_list(X, Y, List) :-
    List = [X, Y].
*/
new_list(X, Y, [X, Y]).

/*Añadir al principio*/
/*
addFirst(X, List, NewList) :-
    NewList = [X | List].
*/
addFirst(X, L, [X | L]).

/*Añadir al final*/
/*
addLast(X, [], NewList) :-
    NewList = [X].
addLast(X, [Z | Zs], NewList) :-
    addLast(X, Zs, ReducedList),
    NewList = [Z | ReducedList].
*/

addLast(X, [], [X]).

addLast(X, [Z | Zs], [Z | ZsX]) :-
    addLast(X, Zs, ZsX).

/*Concatenar listas*/
concat([], L2, L2).

concat([X | Xs], L2, [X | ReducedList]) :-
    concat(Xs, L2, ReducedList).

/*Buscar elemento*/
contains(X, [X | _ ]).

contains(X, [ _ | Zs]) :-
    contains(X, Zs).

/*Invertir*/
reverse([], []).

reverse([X | Xs], NewList) :-
    reverse(Xs, ReducedList),
    addLast(X, ReducedList, NewList).

/*Borrar elemento (solo una aparición)*/

    /*Caso base: X es el primer elemento*/
delete(X, [X | Xs], Xs).

delete(X, [Z | Zs], [Z | ReducedList]) :-
    /*X \= Z, Esto implica eliminar siempre el primero. Si se quita, las distintas opciones eliminan distintas apariciones del elemento (solo 1 aparición es eliminada)*/ 
    delete(X, Zs, ReducedList).

/*Borrar elemento (toda aparición)*/
delete_all(_, [], []).

delete_all(X, [Z | Zs], [Z | ReducedList]) :-
    delete_all(X, Zs, ReducedList).

delete_all(X, [X | Zs], ReducedList) :-
    delete_all(X, Zs, ReducedList).


/*Reemplazar un elemento (solo primera aparición)*/
/*Reemplazar el elemento X de la lista [Z, Zs] por Y*/
replace(X, Y, [Z | Zs], NewList) :-
    X = Z,
    addFirst(Y, Zs, NewList).

replace(X, Y, [Z | Zs], NewList) :-
    X \= Z,
    replace(X, Y, Zs, ReducedList),
    addFirst(Z, ReducedList, NewList).

/*Reemplazar un elemento (toda aparición)*/
replace_all(_, _, [], NewList) :- NewList = [].

replace_all(X, Y, [Z | Zs], NewList) :-
    X = Z,
    replace_all(X, Y, Zs, ReducedList),
    addFirst(Y, ReducedList, NewList).

replace_all(X, Y, [Z | Zs], NewList) :-
    X \= Z,
    replace_all(X, Y, Zs, ReducedList),
    addFirst(Z, ReducedList, NewList).

/*Lista palíndroma*/
/*
remove_last([X | []], ReducedList, RemovedElement) :-
    RemovedElement = X,
    ReducedList = [].

remove_last([X | Xs], NewList, RemovedElement) :-
    remove_last(Xs, ReducedList, RemovedElement),
    addFirst(X, ReducedList, NewList).

isPalindromic([]).
isPalindromic([_]).
isPalindromic([X | Xs]) :-
    remove_last(Xs, ReducedList, RemovedElement),
    X = RemovedElement,
    isPalindromic(ReducedList).
*/

/*MAS SENCILLO: INVERTIR LA LISTA Y COMPARARLAS*/
isPalindromic(L) :- 
    reverse(L, L).

/*Hacer palíndroma*/
makePalindromic(L, NewList) :-
    reverse(L, ReversedList),
    concat(L, ReversedList, NewList).



/*Desplazar a derecha*/

% Predicado auxiliar: removeLast(+L, -ReducedList, -RemovedElement)
remove_last([X | []], [], X).
remove_last([X | Xs], [X | ReducedList], RemovedElement) :-
    remove_last(Xs, ReducedList, RemovedElement).

% rightShift(+L, -SL)
rightShift([], []).
rightShift(L, [E | ReducedList]) :-
    remove_last(L, ReducedList, E).

/*Desplazar a izquierda*/

% leftShift(+L, -SL)
leftShift([], []).
leftShift([X | Xs], SL) :-
    addLast(X, Xs, SL).