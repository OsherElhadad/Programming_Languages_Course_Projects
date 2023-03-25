element_at(H,[H|T],0).
element_at(X,[H|T],K) :- element_at(X,T,K1), K is K1 + 1.