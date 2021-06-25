prolog(Arg, 'Entero') :- integer(Arg).
prolog(Arg, 'Átomo') :- atom(Arg).
prolog(Arg, 'Variable') :- var(Arg).

prolog([], 'Lista').
prolog([ _ | _ ], 'Lista').

