%% 
% Student contributors: Grant Fernwaltt, Alex Schexnayder
%
% Spaces:
% f = floor space
% w = wall space
% s = start space, there should only be one
% e = exit space, there can be more than one
% 
% Movements:
% left = move coordinate to previous column
% right = move coordinate to next column
% up = move coordinate to previous row
% down = move coordinate to next row
%% 

% navigates maze, if no exit can be arrived at maze 
% is assumed invalid as there is either no exit, or the maze 
% is a prison(no viable exits from start position).
find_exit(Maze,Actions) :-  
    Begin = s,
    Finish = e,
    %find_ymax(Maze,Ymax),
    %find_xmax(Maze,Xmax),
    %write('ymax is - '), write(Ymax),nl,
    %write('xmax is - '), write(Xmax),nl,
    write('locating start space'),nl,
    findStartSpace(Begin, Maze, StartPosition),
    write('start space is in position '), write(StartPosition),nl,
    write('locating end space'),nl,
    findEndSpace(Finish, Maze, EndPosition),
    write('end space is in position '), write(EndPosition),nl,
    write('testing maze').
    %write(Maze,' is a maze.').

% finds number of rows
%find_ymax(Maze,Ym) :-
%    length(Maze,A),
%    A = Ym.

% finds number of columns
%find_xmax([Row1|Rows],Xm) :-
%    length(Row1,A),
%    A = Xm.
% Locates Starting Position, 
% if there is no start or more 
% than 1 start then maze is invalid.

findStartInMaze(Start, [[RowHead|RestRow]|_],  X, 1) :-
    nth1(X,[RowHead|RestRow],Start),
    !.
findStartInMaze(Start, [_|RestMatrix],  X, Y) :-
    findStartInMaze(Start, [_|RestMatrix],  X, Y1),
    Y is Y1 + 1.
    
% wrapper predicate
findStart(Start, Maze, X, Y ) :- 
    findStartInMaze(Start, Maze, X, Y).
% wrapper for the wrapper, unifies X and Y variables to (X,Y) ordered pair.
findStartSpace(Start, Maze, (X,Y)) :- 
    findStart(Start, Maze, X, Y).

% Locates Ending Position if no actions are given, 
% if there is no end then maze is invalid.

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
% wrapper predicate
findEnd(End, Maze, X, Y) :- 
    write('A'),nl,
    findEndInMaze(End, Maze, X, Y).
% wrapper for the wrapper, unifies X and Y variables to (X,Y) ordered pair.
findEndSpace(End, Maze, (X,Y)) :-
    findEnd(End, Maze, X, Y).

% determines which adjacent spaces can be moved into
%availableSpaces() :- .

% for testing the identity of 
% current space position 
% (wall vs floor vs start vs end)
%testSpace(Maze, Actions) :- 
%    . 
% Moves to next location.
%navSpace(Maze, Actions) :-
%    .
 