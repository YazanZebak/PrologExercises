/*use make. to reload*/
cls :- write('\e[2J').

delta(0,a,1).   
delta(0,b,0).
delta(1,a,1).
delta(1,b,2).
delta(2,a,2).
delta(2,b,2).
final(2).

% start(0).
% parse(L) :- start(S), trans(S,L).

trans(X,[A|B]) :- 
      delta(X,A,Y),
      write(X),
      write('  '),
      write([A|B]),
      nl,
      trans(Y,B).  
trans(X,[]) :- 
      final(X),
      write(X),
      write('  '),
      write([]), nl.

% ?- parse([b,b,a,a,b,a,b]).
% ?- parse([b,b,a]).

% ?- trans(0, [b,b,a,a,b,a,b]).
% ?- trans(0, [b,b,a]).

/*A says: "It's not me"
B says: "It's D"
C says: "It's B"
D says: "It's not me"
Who is the criminal? knowing that only one of them is honest.
*/
criminal(K):-
    member(K,[a,b,c,d]),
    (K\=a -> A=1;A=0),
    (K=d  -> B=1;B=0),
    (K=b  -> C=1;C=0),
    (K\=d -> D=1;D=0),
    A+B+C+D=:=1.

% Ask students to change the rule so that d become the criminal instead of a.

% N disk
move(1,X,Y,_) :-  
    write('Move top disk from '), 
    write(X), 
    write(' to '), 
    write(Y), 
    nl.

move(N,X,Y,Z) :- 
    N>1,
    M is N-1, 
    move(M,X,Z,Y), 
    move(1,X,Y,_), 
    move(M,Z,Y,X).  
	
% ?- move(3,left,right,center). 
% Ask students to re-write the rules.


fibbo(0, 1).
fibbo(1, 1).
fibbo(N, Result) :- N1 is N - 1, N2 is N - 2, fibbo(N1, Result1), fibbo(N2, Result2), Result is Result1 + Result2.

% Eliminate consecutive duplicates of list elements.
compress([],[]).
compress([X],[X]).
compress([X,X|Xs],Zs) :- compress([X|Xs],Zs).
compress([X,Y|Ys],[X|Zs]) :- X \= Y, compress([Y|Ys],Zs).
% ?- compress([1,2,3,3,4], X).

% Remove the K'th element from a list.
% The first element in the list is number 1.
% remove_at(X,L,K,R) :- X is the K'th element of the list L; R is the
%    list that remains when the K'th element is removed from L.
%    (element,list,integer,list) (?,?,+,?)
remove_at(X,[X|Xs],1,Xs).
remove_at(X,[Y|Xs],K,[Y|Ys]) :- K > 1, 
   K1 is K - 1, remove_at(X,Xs,K1,Ys).
% ?- remove_at(X,[1,2,3,4,5],3,Xs).