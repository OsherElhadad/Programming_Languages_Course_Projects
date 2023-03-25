remove_at(H,[H|T],0,T).
remove_at(X,[H|T],K,[H|T1]) :- remove_at(X,T,K1,T1), K is K1 + 1.
