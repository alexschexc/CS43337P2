Grant Fernwalt
Alex Schexnayder
# Approach
Our approach for this project was to first solve the problem of reliably locating elements within a list of lists using a combination of the provided 'nth1/3' predicate, unification, backtracking, and a judicious use of wrapper predicates. After this we were able to approach the problem of moving within the maze.
# Organization
We initially organized the project by setting up a GitHub repository for the purposes of keeping an
accessible file with our source code available for each of us to work on the code on our separate
machines. This project our roles were very much that of partners as neither of us had prior experience with logical programming or SWI Prolog.
# Problems Encountered

The first problem arose with the question of how to actually locate elements within a list of lists. Primarily the concern was in understanding how to convert the concept of list of lists into a row-and-column structure that could be queried. 

The second problem arose with the question of how to traverse the list of lists as a maze.

The third problem arose with the question of how to indicate that the exit of the maze had been arrived at and the maze had been successfully navigated.

The final problem was testing the maze to make sure that it was not awkwardly shaped and that only 1 's' tile exists in the maze.

# Problems Fixed
The first problem was solved with a combination of finding the length of lists and the length of the outer list, as well as using the 'nth1/3' predicate to help locate where the start and end tiles occur in the maze.

The second problem was solved by writing predicates that handled addition and subtraction against the x and y location value of the start tile saved as a variable pair to reflect where the "current" position in the maze is. Additionally checks had to be written to make sure that moves were being made onto valid floor spaces and were not being validated in spaces that fall outside the list structure.

The third problem actually required a reworking and expansion of the code that was implemented to solve the first problem. The code used to solve the first problem would not accurately read that an end Tile had been arrived at and as a result the 'find_exit/2' predicate would contine seeking a tile that it had already found until prolog would finally just give up searching. Once the find_positions predicates were expanded to properly handle actual location reporting the 'find_exit/2' predicate would acknowledge that it had located the exit tile and print to the terminal the completed actions list. This solution also handles receiving an action list as well.

The fourth and final problem took some effort. A first attempt at the solution was an attempt at counting through the list using existing predicates. This exacerbated the existing issue. Instead, the actual implemented solution was to flatten the maze into a single list, and attempt to run the 'select/3' predicate twice. The predicate should always run the first time, however if the predicate successfully executes a second time, then there are too many s Tiles which invalidates the maze input. The test for rectuangularity of the maze was to simply take the Xmax value and compare it to the length of all the sub-lists in the maze input. This determines whether the submitted maze has the required rectangularity as required by the project specifications.

# What Did You Learn?
Prolog is fun. Prolog is also painful. These are not mutually exclusive things and unfortunately its almost entirely due to how disorganized the SWI Prolog documentation is. Prolog also gave me a new appreciation for some of the quality of life features that appear in many of the modern imperative languages, however I also wish that things like unification and backtracking were a part of how imperative languages operated. Unification especially makes it simple to use predicates in a multitude of ways.