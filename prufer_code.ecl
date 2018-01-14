/*Dlugosc listy*/
len([], 0).
len([_|T], L) :- len(T, P), L is P + 1.

/*Czy wierzcholek pojawia sie dalej*/
appears(V, [], 0).
appears(V, [V-_|T], X) :- appears(V, T, Y), X is 1 + Y.
appears(V, [_-V|T], X) :- appears(V, T, Y), X is 1 + Y.
appears(V, [A-B|T], X) :- V\==A, V\==B, appears(V, T, Y), X is 0 + Y.

/*Czy lisc*/
leaf(V, G) :- appears(V, G, 1).

/*miniMalna krawedz (z najmniejszym lisciem)*/
minLeaf(G, [A-B|[]], B, L) :- leaf(A, G), L is A.
minLeaf(G, [A-B|[]], A, L) :- leaf(B, G), L is B. 
minLeaf(G, [A-B|T], E, L) :- leaf(A, G), minLeaf(G, T, Z, X), A < X, L is A, E is B.
minLeaf(G, [A-B|T], E, L) :- leaf(A, G), minLeaf(G, T, Z, X), A > X, L is X, E is Z.
minLeaf(G, [A-B|T], E, L) :- leaf(B, G), minLeaf(G, T, Z, X), B < X, L is B, E is A.
minLeaf(G, [A-B|T], E, L) :- leaf(B, G), minLeaf(G, T, Z, X), B > X, L is X, E is Z.  

/*Kody Prufera*/
prufer_code(G, []) :- len(A, L), L < 2.