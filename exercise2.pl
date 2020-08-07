/*
Constraints:
1. A student is not allowed to be in two classes at the same time, nor twice in one class!
2. Sum of students in two classes = the total number of students (i.e All students are present).
3. Teachers could be more than two in the same class, but every class must has at least one teacher.
4. Class not allowed to be empty or has just teachers, i.e. class must have at least one student and one teacher.
5. Develop a general solution, i.e. your rules must solve the problem with different facts like:
		students([s1,s2,s3,s4, ahmad, ali, maya]).
		teachers([t1,t2, omar]).
6. Don't define any other facts.
7. You are invited to define any necessary rules which maight help you solve the problem!
8. Take a look at the following examples:
*/


cls :- write('\e[2J').

students([s1,s2,s3,s4]).
teachers([t1,t2, t3]).

unique([]).
unique([_,[]]).
unique([H|T]) :- not(member(H,T)), unique(T).

append([], List, List).
append([Head|Tail], List, [Head|Rest]) :- append(Tail, List, Rest).

size([], 0).
size([H|T], N) :- size(T, N1), N is N1+1.

is_empty(List) :- size(List, N), N = 0.

member_of_students(Student) :- students(S), member(Student, S).
member_of_teachers(Teacher) :- teachers(T), member(Teacher, T).

is_all_students([]).
is_all_students([H|T]) :- member_of_students(H), is_all_students(T).

is_all_teachers([]).
is_all_teachers([H|T]) :- member_of_teachers(H), is_all_teachers(T).

total_number_of_students([], 0).
total_number_of_students([H|T], N) :- total_number_of_students(T, N1), ( member_of_students(H) -> N is N1 + 1 ; N is N1 ).

is_valid_distribution(List1, List2) :- 
    not(is_empty(List1)), not(is_empty(List2)),  
    append(List1, List2, List), unique(List),
    not(is_all_students(List1)), not(is_all_teachers(List1)),
    not(is_all_students(List2)), not(is_all_teachers(List2)),
    total_number_of_students(List, N1), students(S), size(S, N2), N1 = N2.