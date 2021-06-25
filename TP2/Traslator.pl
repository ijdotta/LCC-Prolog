% Oraciones son representadas mediante listas: pi es palabra i [p1, p2, p3, ..., pi, ..., pn]

translate(el, the).
translate(gato, cat).
translate(duerme, sleeps).
translate(Symbol, Symbol) :- atom(Symbol).

translate([P | []], [TP]) :-
    translate(P, TP).

translate([P | Ps], [TP | TPs]) :- 
    translate(P, TP),
    translate(Ps, TPs).
