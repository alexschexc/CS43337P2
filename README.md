# CS43337P2

Dear God why?!?!?!?!



findEndInMaze(End, [[RowHead|RestRow]|_],  X, 1) :- 
    write('I'),nl,
    nth1(X,[RowHead|RestRow],End),
    write(X),
    !.
findEndInMaze(End, [_|RestMatrix], X, Y):-
    write('II'),nl,
    findEndInMaze(End, [_|RestMatrix], X, Y2),
    write('III'),nl,
    Y is Y2 + 1.