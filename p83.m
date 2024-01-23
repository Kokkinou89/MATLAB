% program p92

X = [6 3 3 0; 3 6 7 5; 3 2 1 2];

E = pdist(X);

dE = squareform(E)

Y = [1, 0; 1, 1; 1, 0];

P = pdist(Y,"jaccard");

dP = squareform(P)

dC = E + 0.5*P