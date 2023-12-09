:- use_module(library(lists)).
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
    find_ymax(Maze,Ymax),
    find_xmax(Maze,Xmax),
    write('ymax is - '), write(Ymax),nl,
    write('xmax is - '), write(Xmax),nl,
    find_start_and_end(Begin, Finish, Maze, StartPosition, EndPosition),
    write('start space is in position '), write(StartPosition),nl,
    write('end space is in position '), write(EndPosition),nl,
    CurrPos = StartPosition,
    %write('testing maze'),
    %test_maze(Maze,Xmax,Ymax),
    navSpace(Maze, CurrPos, EndPosition,[], Actions).
    %write(Maze),
    %write(' is a maze.'),nl.

% finds number of rows
find_ymax(Maze,Ym) :-
    length(Maze,A),
    A = Ym.

% finds number of columns
find_xmax([Row1|_],Xm) :-
    length(Row1,A),
    A = Xm.

s_number() :-.

test_maze(Maze,X,Y) :-
    s_number(),
    .

% Locates Starting Position, 
% if there is no start or more 
% than 1 start then maze is invalid.    
%% Base case: The element is found at the head of the first row.
position(Element, [[Head|RestRow]|_], 1, Y) :-
    nth1(Y, [Head|RestRow], Element),
    !.

% Recursive case: The element is not in the head of the first row.
position(Element, [_|RestMatrix], X, Y) :-
    X1 is X - 1,
    position(Element, RestMatrix, X1, Y).

% Wrapper predicate for the user
find_positions(Element, Matrix, Xfinal, Yfinal,Xfinal,Yfinal) :-
    position(Element, Matrix, Yfinal, Xfinal).

find_positions(Element, Matrix, X, Y, Xfinal, Yfinal) :-
    moveRights((X,Y),(X3,Y3)),
    find_xmax(Matrix,Xm),
    X3 =< Xm,
    find_positions(Element, Matrix, X3, Y3, Xfinal, Yfinal).

find_positions(Element, Matrix, _, Y, Xfinal, Yfinal) :-
    moveDowns((1,Y),(X3,Y3)),
    find_ymax(Matrix,Ym),
    Y3 =< Ym,
    find_positions(Element, Matrix, X3, Y3, Xfinal, Yfinal).

find_exit(Element, Matrix, (X,Y)) :-
    find_positions(Element, Matrix, 1, 1, X, Y).

find_start(Element, Matrix, (X,Y)) :-
    find_positions(Element, Matrix, 1, 1,X,Y).


find_start_and_end(Element1, Element2, Matrix, (X1,Y1), (X2,Y2)) :-
    Z = (X1,Y1),
    M = (X2,Y2),
    find_start(Element1, Matrix, Z),
    find_exit(Element2, Matrix, M).
% movement predicates
% ---------------------------%
incPosition(Y,Y1) :-
    Y1 is Y + 1.

decPosition(Y,Y1) :-
    Y1 is Y - 1.

moveLefts((X,Y),(X1,Y)) :-
    decPosition(X,X1).
%moveLeft(X) :-
%    decPosition(X).

moveRights((X,Y),(X1,Y)) :-
    incPosition(X,X1).
%moveRight(X) :-
%    incPosition(X).

moveUps((X,Y),(X,Y1)) :-
    decPosition(Y,Y1).
%moveUp(Y) :-
%    incPosition(Y).

moveDowns((X,Y),(X,Y1)) :-
    incPosition(Y,Y1).
%moveDown(Y) :-
%    decPosition(Y).
% -----------------------------%


% Traverses Maze.
%   What this has to do:
%   - get an arbitrary coordinate from a move command 
%    (this will take predicates for each direction). 
%   - relate those coordinates to either a floor or an exit 
%    (noteably *not* a wall), and set "current" coordinates 
%    to those coordinates, and add corresponding direction to `Actions`
%    list (i.e. "up", "down", etc.).
%   - base predicate will be if the current coordinates match 
%    the end coordinates.
navSpace(_, (EndX,EndY), (EndX,EndY),_, []).

navSpace(Maze,(CurrX,CurrY), (EndX,EndY), History, [right|T]) :- 
    %write((CurrX,CurrY)),
    write('moving right'),nl,
    moveRights((CurrX,CurrY),(NewX,NewY)),
    %helper predicate that will validate our movement choice
    valid_move((NewX,NewY),History,Maze),
    %prepend our new coordinates to history
    NewHistory = [(NewX,NewY)| History],
    %recursive call
    write(NewX),write(','),write(NewY),nl,
    navSpace(Maze, (NewX,NewY), (EndX,EndY),NewHistory, T).

navSpace(Maze,(CurrX,CurrY), (EndX,EndY),History,[left|T]) :- 
    write('moving left'),nl,
    moveLefts((CurrX,CurrY),(NewX,NewY)),
    %helper predicate that will relate a possible move direction
    valid_move((NewX,NewY),History,Maze),
    %prepend our new coordinates to history    
    NewHistory = [(NewX,NewY)| History],
    write(NewX),write(','),write(NewY),nl,
    navSpace(Maze, (NewX,NewY), (EndX,EndY),NewHistory, T).

navSpace(Maze,(CurrX,CurrY), (EndX,EndY),History,[down|T]) :- 
    write('moving down'),nl,
    moveDowns((CurrX,CurrY),(NewX,NewY)),
    %helper predicate that will relate a possible move direction
    write(NewX),write(','),write(NewY),nl,
    valid_move((NewX,NewY),History,Maze),
    %prepend our new coordinates to history    
    NewHistory = [(NewX,NewY)| History],
    navSpace(Maze, (NewX,NewY), (EndX,EndY),NewHistory, T).

navSpace(Maze,(CurrX,CurrY), (EndX,EndY),History,[up|T]) :- 
    write('moving up'),nl,
    moveUps((CurrX,CurrY),(NewX,NewY)),
    %helper predicate that will relate a possible move direction
    valid_move((NewX,NewY),History,Maze),
    %prepend our new coordinates to history    
    NewHistory = [(NewX,NewY)| History],
    %recursive call
    write(NewX),write(','),write(NewY),nl,
    navSpace(Maze, (NewX,NewY), (EndX,EndY),NewHistory, T).


valid_move((NewX,NewY),History, Maze) :-
    % get size of maze
    find_ymax(Maze,Ym),
    find_xmax(Maze,Xm),
    %bounds check
    NewX =< Xm, NewY =< Ym,
    % we have to flip the X and Y in this call because 
    % we treat Y as the collumn and X as the row in position().
    write('hello'),
    position(Tile, Maze, NewY, NewX),
    nl,write(Tile),nl,
    %Match with anything but a wall tile
    Tile \=w,
    Tile \=s, 
    %it is not the case that our new coordinates are in History
    \+ member((NewX,NewY),History). 
