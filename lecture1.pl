/*To reload the file into prolog: Use make. */

/*Simple Facts*/

john_is_cold.                          /* john is cold */
raining.                               /* it is raining */
john_Forgot_His_Raincoat.              /*  john forgot his raincoat */
fred_lost_his_car_keys.                /* fred lost is car keys */
peter_footballer.                      /* peter plays football */

/*Facts with args*/

eats(fred,oranges).                           /* "Fred eats oranges" */
eats(fred,t_bone_steaks).                     /* "Fred eats T-bone steaks" */
eats(tony,apples).                            /* "Tony eats apples" */
eats(john,apples).                            /* "John eats apples" */
eats(john,grapefruit).                        /* "John eats grapefruit" */

/*Variables*/

eats(fred,oranges).
eats(fred,t_bone_steak).
eats(fred,apples).

% ?- eats(fred,FoodItem). % Use ; to investigate more solutions

/*Search & Rules*/

mortal(X) :- human(X).
human(socrates).

/*
?- mortal(socrates).
?- mortal(P).
*/

/* Reading Rules as OR */

fun(X) :-                      /* an item is fun if */ 
        red(X),                /* the item is red */
        car(X).                /* and it is a car */
fun(X) :-                      /*  or an item is fun if */
        blue(X),               /* the item is blue */
        bike(X).               /* and it is a bike */

fun(ice_cream).                /* and ice cream is also fun. */
car(vw_beatle).
car(ford_escort).
bike(harley_davidson).
red(vw_beatle).
red(ford_escort).
blue(harley_davidson).

% ?- fun(harley_davidson).                  /* to which Prolog will reply */
% ?- fun(What).

/*Backtracking in Rules (Prolog goes back to its last choice point and sees if there is an alternative solution.)*/

hold_party(X):- birthday(X), happy(X).

birthday(tom).
birthday(fred).
birthday(helen).
happy(mary).
happy(jane).
happy(helen).

% ?- hold_party(Who).

% Recursion

on_route(rome).
on_route(Place):- move(Place,Method,NewPlace), on_route(NewPlace).
move(home,taxi,halifax).
move(halifax,train,gatwick).
move(gatwick,plane,rome).

% ?- on_route(home).

% Example 2

parent(john,paul).             /* paul is john's parent */  
parent(paul,tom).              /* tom is paul's parent */
parent(tom,mary).              /* mary is tom's parent */       
    
/* someone is your ancestor if there are your parent */
ancestor(X,Y):- parent(X,Y).
/* or somebody is your ancestor if they are the parent of someone who is your ancestor*/ 
ancestor(X,Y):- parent(X,Z), ancestor(Z,Y).
% ?- ancestor(john,tom).

% Lists

/* Here are some example simple lists

[a,b,c,d,e,f,g]

[apple,pear,bananas,breadfruit]

[a,b,c] unifies with [Head|Tail] resulting in Head=a and Tail=[b,c]

[a] unifies with [H|T] resulting in H=a and T=[]

[a,b,c] unifies with [a|T] resulting in T=[b,c]

[a,b,c] doesn't unify with [b|T]

[] doesn't unify with [H|T]

[] unifies with []. Two empty lists always match

[a,d,z,c] and [H|T]
Yes H = a and T = [d,z,c]
[apple,pear,grape] and [A,pear|Rest]
Yes A = apple and Rest = [grape]
[a|Rest] and [a,b,c]
Yes Rest = [b,c]
[a,[]] and [A,B|Rest]
Yes A = a, B = [] and Rest = []
[One] and [two|[]]
Yes One = two
[one] and [Two]
Yes Two = one
[a,b,X] and [a,b,c,d]
No X can not represent the two atoms c,d

*/

% Recursion in lists

on(Item,[Item|Rest]).       /* is the target item the head of the list */
on(Item,[DisregardHead|Tail]):- on(Item,Tail).
		  
?- on(apples,  [pears, tomatoes, apples, grapes]).

% Example 2

append([],List,List).
append([Head|Tail],List2,[Head|Result]):- append(Tail,List2,Result).
% ?- append([b,c],[one,two,three],Result)