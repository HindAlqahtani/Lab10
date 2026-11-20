
% Name Game

% Start with three letters
start :-
    write('Hi. This is the Name Game.'), nl,
    write('Add, delete or move letters to create your name.'), nl,
    menu([a,b,c]).

% Menu
menu(List) :-
    nl,
    write('1- Display letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    action(Choice, List).

% Display
action(1, List) :-
    write(List), nl,
    menu(List).

% Add a letter at any position
action(2, List) :-
    write('Enter letter: '), read(X),
    write('Enter position (1, 2, 3...): '), read(Pos),
    length(Before, N),
    Pos is N + 1,
    append(Before, After, List),
    append(Before, [X|After], NewList),
    !,
    menu(NewList).

% Add at top
action(3, List) :-
    write('Enter letter: '), read(X),
    menu([X|List]).

% Add at bottom
action(4, List) :-
    write('Enter letter: '), read(X),
    append(List, [X], NewList),
    menu(NewList).

% Delete one occurrence
action(5, List) :-
    write('Enter letter: '), read(X),
    (select(X, List, NewList) ->
        menu(NewList)
    ;
        write('Letter not found'), nl,
        menu(List)
    ).

% Delete all letters
action(6, _) :-
    menu([]).

% Exit
action(7, _) :-
    write('Goodbye!'), nl.
