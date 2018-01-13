len([], 0).
len([_|T], L) :- len(T, P), L is P + 1.
prufer_code(A, []) :- len(A, L), L<2.