/*Dlugosc listy*/
len([], 0).
len([_|T], L) :- len(T, P), L is P + 1.

/*Rozbicie krawedzi na wierzcholki*/
v(A-B,A,B).

/*Kody Prufera*/
prufer_code(A, []) :- len(A, L), L<2.