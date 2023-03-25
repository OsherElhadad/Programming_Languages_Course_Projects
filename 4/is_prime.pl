iter_prime(X,X).
iter_prime(X,Y) :- X > Y, X mod Y =\= 0, Y1 is Y + 1, iter_prime(X, Y1).
is_prime(X) :- iter_prime(X,2).