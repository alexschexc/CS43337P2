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
    Wall = w,
    Floor = f,
    find-ymax(Maze,Ymax),
    find-xmax(Maze,Xmax),
    write('ymax is - '), write(Ymax),nl,
    write('xmax is - '), write(Xmax),nl,
    write('locating start space'),nl,
    findStartSpace(Maze, Begin, HowMuch, Place1),
    write('start space is in position '), write(Place1),nl,
    write('locating end space'),nl,
    findEndSpace(Maze, Finish, Place2),
    write('end space is in position '), write(Place2),nl,
    write('testing maze'),
    write(Maze,' is a maze.').

% finds number of rows
find-ymax(Maze,Ym) :-
    length(Maze,A),
    A = Ym.

% finds number of columns
find-xmax([Row1|Rows],Xm) :-
    length(Row1,A),
    A = Xm.
% Locates Starting Position, 
% if there is no start or more 
% than 1 start then maze is invalid.
findStartSpace([Heads|Tail], Start, StartCount, Indexs) :- 
    nth1(Indexs,Heads,Start).
% Locates Ending Position if no actions are given, 
% if there is no end then maze is invalid.


findEndSpace([Heade|Tail], End, Indexe) :- 
    write('looking for end'),
    nth1(Indexe,Heade,End),
    write('end not in this row'),
    findEndSpace(Tail, End, Indexe).

findEndSpace(Tail, End, Indexe) :- 
    nth1(Indexe,Tail,End).
% determines which adjacent spaces can be moved into
%availableSpaces() :- .

% for testing the identity of 
% current space position 
% (wall vs floor vs start vs end)
testSpace(Maze, Actions) :- 
    . 
% Moves to next location.
navSpace(Maze, Actions) :-
    .
 