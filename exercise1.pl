cls :- write('\e[2J').

% reverse list
reverse_list([],Z,Z).
reverse_list([H|T],Z,Res) :- reverse_list(T,Z,[H|Res]).

% size of list
size([], 0).
size([_|T], N) :- size(T, N1), N is N1+1.

% check if taller
taller(bob, mike).
taller(mike, jim).
taller(jim, george).

is_taller(X, Y) :- taller(X, Y).
is_taller(X, Y) :- taller(X, Z), is_taller(Z, Y).

% checkf if Town_i reach Town_j
road(town1, town2).
road(town2, town3).
road(town3, town4).
road(town4, town5).
road(town5, town6).

work_out(X, Y) :- road(X, Y).
work_out(X, Y) :- road(X, Z), work_out(Z, Y).

% If X = H then we found X in the list. Otherwise (;) we test whether X is in the tail.
member(X, [H|T]) :- X = H; member(X, T).