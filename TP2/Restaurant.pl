% KB
entrada(sopa, 230).
entrada(picada, 550).
minutas(milanesa, 750).
minutas(papas, 400).
minutas(hamburguesa, 650).
postre(chocolate, 100).
postre(flan, 350).
postre(marquisse, 450).
postre(helado, 400).

hallarMenu(N, [Entrada, Minuta, Postre, Costo]) :-
    entrada(Entrada, PEntrada),
    minutas(Minuta, PMinuta),
    postre(Postre, PPostre),
    Costo is PEntrada + PMinuta + PPostre,
    Costo =< N.