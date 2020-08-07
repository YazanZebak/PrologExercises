/*use make. to reload*/
cls :- write('\e[2J').

% Very important: draw the recursive calls for each exercise with the variables assigned.
% Very important: draw the recursive calls for each exercise with the variables assigned.
% Very important: draw the recursive calls for each exercise with the variables assigned.
% Very important: draw the recursive calls for each exercise with the variables assigned.
% understood? *_-

% P1
% Note: last(?Elem, ?List) is predefined

my_last([X],X).
my_last([_|L],X) :- my_last(L,X). % my_last([1,2,3], Z).

% P2 (Class Evaluation)

last_but_one(X,[X,_]).
last_but_one(X,[_,Y|T]) :- last_but_one(X,[Y|T]). % last_but_one(X,[1,2,3,4,5]).

% P3
% Note: nth1(?Index, ?List, ?Elem) is predefined % nth1(2, [1,2,3], X).
% X is the K'th element of the list L
% ?- element_at(X,[a,b,v,c],4).

element_at(X,[X|_],1).
element_at(X,[_|L],K) :- K > 1, K1 is K - 1, element_at(X,L,K1). % Draw the call tree.

% Ques: What if user gives K > size of the list?

% P4

% Bad reverse,
my_reverse([],[]).
my_reverse([X],[X]).
my_reverse([X,Y],[Y,X]).
my_reverse([X,Y,Z],[Z,Y,X]).
my_reverse([W,X,Y,Z],[Z,Y,X,W]).
% Good one, Draw the expansion tree (call tree) without Z, then show the need to assign the result to another variable which is Z.
my_reverse([],Z,Z).
my_reverse([H|T],Z,Acc) :- my_reverse(T,Z,[H|Acc]). % call: ?- my_reverse([a,b,c],X,[]).

% P5
% Note: reverse(List1, List2) is predefined

is_palindrome(L) :- reverse(L,L).

% P6
% Note: flatten(List1, List2) is a predefined predicate
% Note: is_list(List) is predefined
% Note: append(List1, List2, Res) is predefined
% Note: \+ === not, legal(X) :- \+ illegal(X).
% ?-  flatten(1,X).
% ?-  flatten([1,2,[a,b,c]],X).

my_flatten([],[]).
my_flatten(X,[X]) :- \+ is_list(X).
my_flatten([X|Xs],Zs) :- my_flatten(X,Y), my_flatten(Xs,Ys), append(Y,Ys,Zs). % Class Evaluation: Draw call tree

% P7
dupli([],[]).
dupli([X|Xs],[X,X|Ys]) :- dupli(Xs,Ys).
% ?- dupli([a,b,c], Res).