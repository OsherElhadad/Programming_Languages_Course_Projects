iter_prime(X,X).
iter_prime(X,Y) :- X > Y, X mod Y =\= 0, Y1 is Y + 1, iter_prime(X, Y1).
is_prime(X) :- iter_prime(X,2).
goldbach(4,[2,2]) :- !.
goldbach(Y,X) :- Y mod 2 =:= 0, Y > 4, iter_goldbach(Y,X,3).
iter_goldbach(Y,[T,S],T) :- S is Y - T, is_prime(S), is_prime(T), !.
iter_goldbach(Y,X,T) :- T1 is T + 2, T1 < Y, iter_goldbach(Y,X,T1).