1{action(down, T); action(up, T); action(right, T); action(left, T)}1 :- time(T), not finished(T).
#show state_at/2.
 #show action/2.

cell((0..17, 0..8)).
#minimize{1, X, T: action(X,T)}.
adjacent(right, (X+1,Y),(X,Y))   :- cell((X,Y)), cell((X+1,Y)).
adjacent(left,(X,Y),  (X+1,Y)) :- cell((X,Y)), cell((X+1,Y)).
adjacent(down, (X,Y+1),(X,Y))   :- cell((X,Y)), cell((X,Y+1)).
adjacent(up,   (X,Y),  (X,Y+1)) :- cell((X,Y)), cell((X,Y+1)).
%START
state_at(V1, T+1) :- time(T), adjacent(right, V0, V1), state_at(V0, T), action(left, T), not wall(V1).state_at(V0, T+1) :- time(T), adjacent(right, V0, V1), state_at(V1, T), action(right, T), not wall(V0).state_at(V1, T+1) :- time(T), adjacent(down, V0, V1), state_at(V0, T), action(up, T), not wall(V1).state_at(V0, T+1) :- time(T), adjacent(down, V0, V1), state_at(V1, T), action(down, T), not wall(V0).state_at(V0, T+1) :- time(T), adjacent(right, V0, V1), state_at(V0, T), action(left, T), wall(V1).state_at(V1, T+1) :- time(T), adjacent(right, V0, V1), state_at(V1, T), action(right, T), wall(V0).state_at(V0, T+1) :- time(T), adjacent(up, V0, V1), state_at(V0, T), action(down, T), wall(V1).state_at(V1, T+1) :- time(T), adjacent(up, V0, V1), state_at(V1, T), action(up, T), wall(V0).
%END
finished(T):- goal(T2), time(T), T >= T2.
 goal(T):- state_at((16, 1), T), not finished(T-1).
goalMet:- goal(T).
:- not goalMet.

wall((1, 8)).

wall((0, 7)).

wall((1, 6)).

wall((2, 8)).

wall((2, 6)).

wall((3, 8)).

wall((3, 6)).

wall((4, 8)).

wall((5, 8)).

wall((5, 6)).

wall((6, 8)).

wall((7, 6)).

wall((5, 5)).

wall((6, 4)).

wall((7, 4)).

wall((8, 6)).

wall((8, 4)).

wall((9, 6)).

wall((9, 4)).

wall((11, 5)).

wall((10, 6)).

wall((11, 4)).

wall((11, 3)).

wall((10, 2)).

wall((9, 2)).

wall((7, 3)).

wall((7, 2)).

wall((8, 0)).

wall((9, 0)).

wall((10, 0)).

wall((11, 2)).

wall((11, 0)).

wall((12, 2)).

wall((12, 0)).

wall((13, 0)).

wall((14, 2)).

wall((14, 0)).

wall((15, 2)).

wall((15, 0)).

wall((4, 4)).

wall((3, 4)).

wall((2, 4)).

wall((0, 5)).

wall((0, 4)).

wall((2, 3)).

wall((0, 3)).
%AAA
state_at((4, 5), 30).
%BBB
%CCC
time(30..250).
%DDD
%ANSWER SETS

%state_at((4,5),30)
%state_at((4,6),31)
%action(down,30)
%action(down,31)
%state_at((4,7),32)
%action(right,32)
%state_at((5,7),33)
%action(right,33)
%state_at((6,7),34)
%action(right,34)
%state_at((7,7),35)
%action(right,35)
%state_at((8,7),36)
%action(right,36)
%state_at((9,7),37)
%action(right,37)
%state_at((10,7),38)
%action(right,38)
%state_at((11,7),39)
%action(right,39)
%state_at((12,7),40)
%action(right,40)
%state_at((13,7),41)
%action(right,41)
%state_at((14,7),42)
%action(right,42)
%state_at((15,7),43)
%action(right,43)
%state_at((16,7),44)
%action(up,44)
%state_at((16,6),45)
%action(up,45)
%state_at((16,5),46)
%action(up,46)
%state_at((16,4),47)
%action(up,47)
%state_at((16,3),48)
%action(up,48)
%state_at((16,2),49)
%action(up,49)
%state_at((16,1),50)
