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
find_exit(Maze,_) :- 
    .
find_exit(Maze,Actions) :-  
    .

nth((X,_,_), 1, X).
nth((_,X,_), 2, X).
nth((_,_,X), 3, X).

setNth((_,Y,Z), 1, X, (X,Y,Z)).
setNth((X,_,Z), 2, Y, (X,Y,Z)).
setNth((X,Y,_), 3, Z, (X,Y,Z)).

% Locates Starting Position, 
% if there is no start or more 
% than 1 start then maze is invalid.
findStartSpace(Maze, Start, StartCount) :- 
    .
% Locates Ending Position if no actions are given, 
% if there is no end then maze is invalid.
findEndSpace(Maze, End) :- 
    .
availableSpaces() :- .

% for testing the identity of 
% current space position 
% (wall vs floor vs start vs end)
testSpace(Maze, Actions) :- 
    . 
% Moves to next location.
navSpace(Maze, Actions) :-
    .
 