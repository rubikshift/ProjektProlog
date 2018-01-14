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

/*Minimalny lisc (i wierzcholek do ktorego przylega)*/
minLeaf(G, [A-B|[]], B, A) :- leaf(A, G).
minLeaf(G, [A-B|[]], A, B) :- leaf(B, G). 
minLeaf(G, [A-B|T], E, L) :- leaf(A, G), minLeaf(G, T, Z, X), A < X, L is A, E is B.
minLeaf(G, [A-B|T], E, L) :- leaf(A, G), minLeaf(G, T, Z, X), A > X, L is X, E is Z.
minLeaf(G, [A-B|T], E, L) :- leaf(B, G), minLeaf(G, T, Z, X), B < X, L is B, E is A.
minLeaf(G, [A-B|T], E, L) :- leaf(B, G), minLeaf(G, T, Z, X), B > X, L is X, E is Z.
minLeaf(G, [A-B|T], E, L) :- not(leaf(A, G)), not(leaf(B, G)), minLeaf(G, T, E, L).

/*wkoncu chyba nie uzylem*/
noteq(A,B,C,D) :- A==C,B \==D.
 noteq(A,B,C,D) :- A==D,B \==C.
 noteq(A,B,C,D) :- A\==C,B \==D,B\==C,A \==D.
 noteq(A,B,C,D) :- B==C,A \==D.
 noteq(A,B,C,D) :- B==D,A\==C.

/USUWANIE KRAWEDZI *G-graf wejsciowy, G1-wyjsc,A-B do usuneicia*/

delete([],E,L,G1) :- G1 = [].
delete([A-B|[]],E,L,G1) :- G1 =[].

delete([A-B|T],E,L,G1) :- A == E , B == L, G1 = T.
delete([A-B|T],E,L,G1) :- B == E , A == L, G1 = T.
delete([A-B|T],E,L,G1) :- delete(T,E,L,G2), G1 = [A-B|G2].

/*Kody Prufera*/
prufer_code(G, []) :- len(G, L), L < 2.