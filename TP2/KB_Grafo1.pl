:- ensure_loaded('Grafos.pl').

edge(a, b, 15).
edge(b, c, 20).
edge(c, d, 10).
edge(e, f, 10).
edge(e, c, 10).
edge(f, c, 10).
edge(a, f, 11).



edge(x, y, 1).
edge(y, z, 1).
edge(z, x, 1).