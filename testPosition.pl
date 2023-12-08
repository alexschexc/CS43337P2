% Base case: The element is found at the head of the first row.
position(Element, [[Head|RestRow]|_], 1, Y) :-
    nth1(Y, [Head|RestRow], Element),
    !.

% Recursive case: The element is not in the head of the first row.
position(Element, [_|RestMatrix], X, Y) :-
    position(Element, RestMatrix, X1, Y),
    X is X1 + 1.

% Wrapper predicate for the user
find_positions(Element, Matrix, X, Y) :-
    position(Element, Matrix, Y, X).

find_exit(Element, Matrix, (X,Y)) :-
    find_positions(Element, Matrix, X, Y).