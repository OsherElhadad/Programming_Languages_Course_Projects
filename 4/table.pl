and(A,B) :- A,B.
or(A,B) :- A;B.
not(A) :- A,!,fail;true.
xor(A,B) :- or(and(A, not(B)),and(not(A), B)).
nand(A,B) :- not(and(A,B)).
nor(A,B) :- not(or(A,B)).
equal(A, B) :- (A, B) ; (not(A), not(B)).
evaluate(E, true) :- E, !.
evaluate(_, fail).
bool(true).
bool(fail).
table(A,B,E) :- bool(A), bool(B), write(A), write(' \t '), write(B), write(' \t '), evaluate(E, Result), write(Result),nl, fail ; true.