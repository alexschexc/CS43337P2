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

find_start(Element, Matrix, (X,Y)) :-
    find_positions(Element, Matrix, X, Y).

find_start_and_end(Element1, Element2, Matrix, (X1,Y1), (X2,Y2)) :-
    Z = (X1,Y1),
    M = (X2,Y2),
    find_start(Element1, Matrix, Z),
    find_exit(Element2, Matrix, M).