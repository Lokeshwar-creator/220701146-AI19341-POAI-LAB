% Facts: Parent-Child relationships
parent(john, alice).
parent(john, bob).
parent(mary, alice).
parent(mary, bob).
parent(bob, charlie).
parent(bob, diana).
parent(susan, charlie).
parent(susan, diana).

% Facts: Gender
male(john).
male(bob).
male(charlie).
female(mary).
female(alice).
female(diana).
female(susan).



% Rules: Derived family relationships

% Rule for mother
mother(M, C) :- parent(M, C), female(M).

% Rule for father
father(F, C) :- parent(F, C), male(F).

% Rule for siblings
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

% Rule for grandparents
grandparent(G, C) :- parent(P, C), parent(G, P).

% Rule for aunt/uncle (siblings of parents)
aunt_uncle(AU, N) :- sibling(AU, P), parent(P, N).

% Rule for niece/nephew (children of siblings)
niece_nephew(N, A) :- sibling(A, P), parent(P, N).


Queries
?- mother(Mary, alice).
?- father(F, charlie).
?- sibling(alice, bob).
?- grandparent(G, diana).
?- aunt_uncle(AU, diana).
?- niece_nephew(N, bob).

Query: ?- mother(Mary, alice).

Answer: Mary is the mother of Alice.
Query: ?- father(F, charlie).

Answer: F = bob. (Bob is the father of Charlie.)
Query: ?- sibling(alice, bob).

Answer: True. (Alice and Bob are siblings.)
Query: ?- grandparent(G, diana).

Answer: G = john. (John is the grandparent of Diana.)
Query: ?- aunt_uncle(AU, diana).

Answer: AU = alice. (Alice is an aunt of Diana.)
Query: ?- niece_nephew(N, bob).

Answer: N = diana. (Diana is a niece of Bob.)

