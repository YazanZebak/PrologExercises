cls :- write('\e[2J').

% Automata 
delta(p1, 0, p2).
delta(p1, 1, p4).
delta(p2, 0, p3).
delta(p2, 1, p2).
delta(p3, 0, p2).
delta(p3, 1, p4).
delta(p4, 0, p2).
delta(p4, 1, p4).

final(p4).
start(p1).

trans(X, []) :- final(X).
trans(X, [H|T]) :-  delta(X,H,Y), trans(Y,T).  

parse(List) :- start(S), trans(S, List).

% KNN 
point([H|T], X, Y) :- X is H, Y is T.

xPoints([[2,2],[1,1],[0,0]]).
oPoints([[6,6],[5,5],[4,4]]).

distance(Point1,Point2,D) :- point(Point1,X1,Y1),  point(Point2,X2,Y2),
                             D is sqrt((X2-X1)^2 + (Y2-Y1)^2).

getMinFromList([H], Point, Res) :- distance(H, Point, D), Res is D.
getMinFromList([H|T], Point, Res) :- getMinFromList(T, Point, Res1), distance(H, Point, D), Res is min(D, Res1).

getMinFromX(Point, Min) :- xPoints(L), getMinFromList(L, Point, Min).
getMinFromO(Point, Min) :- oPoints(L), getMinFromList(L, Point, Min).

knn(Point, Type) :- getMinFromX(Point, Minx), getMinFromO(Point, Mino),
                    member(Type, [u,o,x]),
                    (Type=u -> (Minx = Mino -> A=1 ; A=0) ; A = 0),
                    (Type=o -> (Minx > Mino -> B=1 ; B=0) ; B = 0),
                    (Type=x -> (Mino > Minx -> C=1 ; C=0) ; C = 0),
                    A+B+C=:=1.
