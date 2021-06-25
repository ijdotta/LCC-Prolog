word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

crossword(V1, V2, V3, H1, H2, H3) :-

    /*Obtención de palabras*/
    word(V1, V11, V12, V13, V14, V15, V16, V17),
    word(V2, V21, V22, V23, V24, V25, V26, V27),
    word(V3, V31, V32, V33, V34, V35, V36, V37),
    word(H1, H11, H12, H13, H14, H15, H16, H17),
    word(H2, H21, H22, H23, H24, H25, H26, H27),
    word(H3, H31, H32, H33, H34, H35, H36, H37),

    /*Evitar repetidas*/
    V1 \= V2,
    V1 \= V3,
    V1 \= H1,
    V1 \= H2,
    V1 \= H3,
    V2 \= V3,
    V2 \= H1,
    V2 \= H2,
    V2 \= H3,
    V3 \= H1,
    V3 \= H2,
    V3 \= H3,
    H1 \= H2,
    H1 \= H3,
    H2 \= H3,

    /*Match de uniones -actual word cross- */
    V12 = H12,
    V22 = H14,
    V32 = H16,
    V14 = H22,
    V24 = H24,
    V34 = H26,
    V16 = H32,
    V26 = H34,
    V36 = H36.
