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
    findStartSpace(Maze, Begin, StartPosition),
    write('start space is in position '), write(StartPosition),nl,
    write('locating end space'),nl,
    findEndSpace(Maze, Finish, EndPosition),
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
findStartSpace(Maze, Start, (X,Y)) :- 
    write('1'),nl,
    findStartInMaze(Maze,Start,1, 1, (X,Y)).

findStartInMaze([], _, _, _, _):- fail.
findStartInMaze([Row|Rest], Start, X, Y, (X,Y)) :-
    write('a'),nl,
    member(Start,Row),
    !.
findStartInMaze([_|Rest], Start, X, Y, (X1,Y1)) :-
    write('b'),nl,
    Y2 is Y + 1,
    write('c'),nl,
    findStartInMaze(Rest, Start, X, Y2, (X1,Y1)).

% Locates Ending Position if no actions are given, 
% if there is no end then maze is invalid.
findEndSpace(Maze, End, (X,Y)) :- 
    write('A'),nl,
    findEndInMaze(Maze, End, 1, 1, (X,Y)).

findEndInMaze([], _, _, _, _) :- fail.
findEndInMaze([Row|Rest], End, X, Y, (X,Y)) :- 
    write('I'),nl,
    findEndInRow(Row, End, X, Y),
    !.
findEndInMaze([_|Rest], End, X, Y, (X1,Y1)):-
    write('II'),nl,
    Y2 is Y + 1,
    findEndInMaze(Rest, End, X, Y2, (X1,Y1)).

findEndInRow([Space|_], End, X, Y) :-
    write('a'),nl,
    nth1(X,Space, End).
findEndInRow([_|Rest], End, X, Y) :-
    write('b'),nl,
    X2 is X + 1,
    write('c'),nl,
    findEndInRow(Rest, End, X2, Y).
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
 