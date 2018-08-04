%ILASP

%state_at(V0, T+1) :- time(T), state_at(V0, T), action(non, T).
%state_at(V0, T+1) :- time(T), is_link(V0), not adjacent(up, V0, V1), state_at(V1, T).
%state_at(V1, T+1) :- time(T), adjacent(left, V0, V1), state_at(V0, T), action(right, T), not wall(V1).
%state_at(V0, T+1) :- time(T), adjacent(left, V0, V1), state_at(V1, T), action(left, T), not wall(V0).
%state_at(V1, T+1) :- time(T), adjacent(up, V0, V1), state_at(V0, T), action(down, T), not wall(V1).
%state_at(V0, T+1) :- time(T), adjacent(left, V0, V1), state_at(V0, T), action(right, T), wall(V1).
%state_at(V1, T+1) :- time(T), adjacent(left, V0, V1), state_at(V1, T), action(left, T), wall(V0).
%state_at(V0, T+1) :- time(T), adjacent(up, V0, V1), state_at(V0, T), action(down, T), wall(V1).
%state_at(V1, T+1) :- time(T), adjacent(up, V0, V1), state_at(V1, T), action(up, T), wall(V0).
%state_at(V1, T+1) :- time(T), not is_link(V1), adjacent(down, V0, V1), state_at(V0, T), action(up, T), not wall(V1).
%
cell((0..19, 0..8)).
#modeb(1, is_link(var(cell))).
% (X+1,Y) is right next to (X,Y)
adjacent(right, (X+1,Y),(X,Y))   :- cell((X,Y)), cell((X+1,Y)).

adjacent(left,(X,Y),  (X+1,Y)) :- cell((X,Y)), cell((X+1,Y)).

% (X,Y+1) is above next to (X,Y)
adjacent(down, (X,Y+1),(X,Y))   :- cell((X,Y)), cell((X,Y+1)).

adjacent(up,   (X,Y),  (X,Y+1)) :- cell((X,Y)), cell((X,Y+1)).

#modeh(state_after(var(cell))).

#modeb(1, adjacent(const(action), var(cell), var(cell))).
#modeb(1, state_before(var(cell)), (positive)).
#modeb(1, action(const(action)),(positive)).
#modeb(1, wall(var(cell))).

#max_penalty(100).

#constant(action, right).
#constant(action, left).
#constant(action, down).
#constant(action, up).
#constant(action, non).

#pos({state_after((1,6))}, {state_after((2,6)),state_after((1,7)),state_after((0,6)),state_after((1,5))}, {state_before((1,6)). action(non). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((1,5))}, {state_after((2,6)),state_after((1,7)),state_after((0,6)),state_after((1,6))}, {state_before((1,6)). action(up). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((1,5))}, {state_after((2,5)),state_after((1,6)),state_after((0,5)),state_after((1,4))}, {state_before((1,5)). action(right). wall((2, 5)). wall((0, 5)). }).
#pos({state_after((1,5))}, {state_after((2,5)),state_after((1,6)),state_after((0,5)),state_after((1,4))}, {state_before((1,5)). action(right). wall((2, 5)). wall((0, 5)). }).
#pos({state_after((1,5))}, {state_after((2,5)),state_after((1,6)),state_after((0,5)),state_after((1,4))}, {state_before((1,5)). action(right). wall((2, 5)). wall((0, 5)). }).
#pos({state_after((1,6))}, {state_after((2,5)),state_after((0,5)),state_after((1,4)),state_after((1,5))}, {state_before((1,5)). action(down). wall((2, 5)). wall((0, 5)). }).
#pos({state_after((2,6))}, {state_after((1,7)),state_after((0,6)),state_after((1,5)),state_after((1,6))}, {state_before((1,6)). action(right). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((1,6))}, {state_after((3,6)),state_after((2,7)),state_after((2,5)),state_after((2,6))}, {state_before((2,6)). action(left). wall((2, 7)). wall((2, 5)). }).
#pos({state_after((1,6))}, {state_after((2,6)),state_after((1,7)),state_after((0,6)),state_after((1,5))}, {state_before((1,6)). action(non). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((1,5))}, {state_after((2,6)),state_after((1,7)),state_after((0,6)),state_after((1,6))}, {state_before((1,6)). action(up). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((1,4))}, {state_after((2,5)),state_after((1,6)),state_after((0,5)),state_after((1,5))}, {state_before((1,5)). action(up). wall((2, 5)). wall((0, 5)). }).
#pos({state_after((1,4))}, {state_after((2,4)),state_after((1,5)),state_after((0,4)),state_after((1,3))}, {state_before((1,4)). action(non). wall((2, 4)). wall((0, 4)). }).
#pos({state_after((1,4))}, {state_after((2,4)),state_after((1,5)),state_after((0,4)),state_after((1,3))}, {state_before((1,4)). action(left). wall((2, 4)). wall((0, 4)). }).
#pos({state_after((1,5))}, {state_after((2,4)),state_after((0,4)),state_after((1,3)),state_after((1,4))}, {state_before((1,4)). action(down). wall((2, 4)). wall((0, 4)). }).
#pos({state_after((1,4))}, {state_after((2,5)),state_after((1,6)),state_after((0,5)),state_after((1,5))}, {state_before((1,5)). action(up). wall((2, 5)). wall((0, 5)). }).
#pos({state_after((1,5))}, {state_after((2,4)),state_after((0,4)),state_after((1,3)),state_after((1,4))}, {state_before((1,4)). action(down). wall((2, 4)). wall((0, 4)). }).
#pos({state_after((1,6))}, {state_after((2,5)),state_after((0,5)),state_after((1,4)),state_after((1,5))}, {state_before((1,5)). action(down). wall((2, 5)). wall((0, 5)). }).
#pos({state_after((1,5))}, {state_after((2,6)),state_after((1,7)),state_after((0,6)),state_after((1,6))}, {state_before((1,6)). action(up). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((1,6))}, {state_after((2,5)),state_after((0,5)),state_after((1,4)),state_after((1,5))}, {state_before((1,5)). action(down). wall((2, 5)). wall((0, 5)). }).
#pos({state_after((1,6))}, {state_after((2,6)),state_after((1,7)),state_after((0,6)),state_after((1,5))}, {state_before((1,6)). action(non). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((2,6))}, {state_after((1,7)),state_after((0,6)),state_after((1,5)),state_after((1,6))}, {state_before((1,6)). action(right). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((2,6))}, {state_after((3,6)),state_after((2,7)),state_after((1,6)),state_after((2,5))}, {state_before((2,6)). action(up). wall((2, 7)). wall((2, 5)). }).
#pos({state_after((3,6))}, {state_after((2,7)),state_after((1,6)),state_after((2,5)),state_after((2,6))}, {state_before((2,6)). action(right). wall((2, 7)). wall((2, 5)). }).
#pos({state_after((3,6))}, {state_after((4,6)),state_after((3,7)),state_after((2,6)),state_after((3,5))}, {state_before((3,6)). action(up). wall((3, 7)). wall((3, 5)). }).
#pos({state_after((2,6))}, {state_after((4,6)),state_after((3,7)),state_after((3,5)),state_after((3,6))}, {state_before((3,6)). action(left). wall((3, 7)). wall((3, 5)). }).
#pos({state_after((3,6))}, {state_after((2,7)),state_after((1,6)),state_after((2,5)),state_after((2,6))}, {state_before((2,6)). action(right). wall((2, 7)). wall((2, 5)). }).
#pos({state_after((3,6))}, {state_after((4,6)),state_after((3,7)),state_after((2,6)),state_after((3,5))}, {state_before((3,6)). action(up). wall((3, 7)). wall((3, 5)). }).
#pos({state_after((3,6))}, {state_after((4,6)),state_after((3,7)),state_after((2,6)),state_after((3,5))}, {state_before((3,6)). action(down). wall((3, 7)). wall((3, 5)). }).
#pos({state_after((4,6))}, {state_after((3,7)),state_after((2,6)),state_after((3,5)),state_after((3,6))}, {state_before((3,6)). action(right). wall((3, 7)). wall((3, 5)). }).
#pos({state_after((5,6))}, {state_after((4,7)),state_after((3,6)),state_after((4,5)),state_after((4,6))}, {state_before((4,6)). action(right). wall((4, 7)). wall((4, 5)). }).
#pos({state_after((6,6))}, {state_after((5,7)),state_after((4,6)),state_after((5,5)),state_after((5,6))}, {state_before((5,6)). action(right). wall((5, 7)). }).
#pos({state_after((6,6))}, {state_after((7,6)),state_after((6,7)),state_after((5,6)),state_after((6,5))}, {state_before((6,6)). action(up). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((6,6))}, {state_after((7,6)),state_after((6,7)),state_after((5,6)),state_after((6,5))}, {state_before((6,6)). action(down). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((6,6))}, {state_after((7,6)),state_after((6,7)),state_after((5,6)),state_after((6,5))}, {state_before((6,6)). action(down). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((6,6))}, {state_after((7,6)),state_after((6,7)),state_after((5,6)),state_after((6,5))}, {state_before((6,6)). action(down). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((6,6))}, {state_after((7,6)),state_after((6,7)),state_after((5,6)),state_after((6,5))}, {state_before((6,6)). action(up). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((5,6))}, {state_after((7,6)),state_after((6,7)),state_after((6,5)),state_after((6,6))}, {state_before((6,6)). action(left). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((5,6))}, {state_after((6,6)),state_after((5,7)),state_after((4,6)),state_after((5,5))}, {state_before((5,6)). action(non). wall((5, 7)). }).
#pos({state_after((6,6))}, {state_after((5,7)),state_after((4,6)),state_after((5,5)),state_after((5,6))}, {state_before((5,6)). action(right). wall((5, 7)). }).
#pos({state_after((7,6))}, {state_after((6,7)),state_after((5,6)),state_after((6,5)),state_after((6,6))}, {state_before((6,6)). action(right). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((6,6))}, {state_after((8,6)),state_after((7,7)),state_after((7,5)),state_after((7,6))}, {state_before((7,6)). action(left). wall((7, 7)). }).
#pos({state_after((6,6))}, {state_after((7,6)),state_after((6,7)),state_after((5,6)),state_after((6,5))}, {state_before((6,6)). action(non). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((5,6))}, {state_after((7,6)),state_after((6,7)),state_after((6,5)),state_after((6,6))}, {state_before((6,6)). action(left). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((5,5))}, {state_after((6,6)),state_after((5,7)),state_after((4,6)),state_after((5,6))}, {state_before((5,6)). action(up). wall((5, 7)). }).
#pos({state_after((5,4))}, {state_after((6,5)),state_after((5,6)),state_after((4,5)),state_after((5,5))}, {state_before((5,5)). action(up). wall((6, 5)). wall((4, 5)). }).
#pos({state_after((5,4))}, {state_after((6,4)),state_after((5,5)),state_after((4,4)),state_after((5,3))}, {state_before((5,4)). action(non). wall((6, 4)). wall((4, 4)). }).
#pos({state_after((5,3))}, {state_after((6,4)),state_after((5,5)),state_after((4,4)),state_after((5,4))}, {state_before((5,4)). action(up). wall((6, 4)). wall((4, 4)). }).
#pos({state_after((5,3))}, {state_after((6,3)),state_after((5,4)),state_after((4,3)),state_after((5,2))}, {state_before((5,3)). action(non). wall((6, 3)). wall((4, 3)). }).
#pos({state_after((5,4))}, {state_after((6,3)),state_after((4,3)),state_after((5,2)),state_after((5,3))}, {state_before((5,3)). action(down). wall((6, 3)). wall((4, 3)). }).
#pos({state_after((5,4))}, {state_after((6,4)),state_after((5,5)),state_after((4,4)),state_after((5,3))}, {state_before((5,4)). action(non). wall((6, 4)). wall((4, 4)). }).
#pos({state_after((5,5))}, {state_after((6,4)),state_after((4,4)),state_after((5,3)),state_after((5,4))}, {state_before((5,4)). action(down). wall((6, 4)). wall((4, 4)). }).
#pos({state_after((5,5))}, {state_after((6,5)),state_after((5,6)),state_after((4,5)),state_after((5,4))}, {state_before((5,5)). action(left). wall((6, 5)). wall((4, 5)). }).
#pos({state_after((5,5))}, {state_after((6,5)),state_after((5,6)),state_after((4,5)),state_after((5,4))}, {state_before((5,5)). action(left). wall((6, 5)). wall((4, 5)). }).
#pos({state_after((5,4))}, {state_after((6,5)),state_after((5,6)),state_after((4,5)),state_after((5,5))}, {state_before((5,5)). action(up). wall((6, 5)). wall((4, 5)). }).
#pos({state_after((5,5))}, {state_after((6,4)),state_after((4,4)),state_after((5,3)),state_after((5,4))}, {state_before((5,4)). action(down). wall((6, 4)). wall((4, 4)). }).
#pos({state_after((5,6))}, {state_after((6,5)),state_after((4,5)),state_after((5,4)),state_after((5,5))}, {state_before((5,5)). action(down). wall((6, 5)). wall((4, 5)). }).
#pos({state_after((5,6))}, {state_after((6,6)),state_after((5,7)),state_after((4,6)),state_after((5,5))}, {state_before((5,6)). action(down). wall((5, 7)). }).
#pos({state_after((5,6))}, {state_after((6,6)),state_after((5,7)),state_after((4,6)),state_after((5,5))}, {state_before((5,6)). action(down). wall((5, 7)). }).
#pos({state_after((6,6))}, {state_after((5,7)),state_after((4,6)),state_after((5,5)),state_after((5,6))}, {state_before((5,6)). action(right). wall((5, 7)). }).
#pos({state_after((7,6))}, {state_after((6,7)),state_after((5,6)),state_after((6,5)),state_after((6,6))}, {state_before((6,6)). action(right). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((6,6))}, {state_after((8,6)),state_after((7,7)),state_after((7,5)),state_after((7,6))}, {state_before((7,6)). action(left). wall((7, 7)). }).
#pos({state_after((7,6))}, {state_after((6,7)),state_after((5,6)),state_after((6,5)),state_after((6,6))}, {state_before((6,6)). action(right). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((7,5))}, {state_after((8,6)),state_after((7,7)),state_after((6,6)),state_after((7,6))}, {state_before((7,6)). action(up). wall((7, 7)). }).
#pos({state_after((7,5))}, {state_after((8,5)),state_after((7,6)),state_after((6,5)),state_after((7,4))}, {state_before((7,5)). action(right). wall((8, 5)). wall((6, 5)). }).
#pos({state_after((7,5))}, {state_after((8,5)),state_after((7,6)),state_after((6,5)),state_after((7,4))}, {state_before((7,5)). action(non). wall((8, 5)). wall((6, 5)). }).
#pos({state_after((7,6))}, {state_after((8,5)),state_after((6,5)),state_after((7,4)),state_after((7,5))}, {state_before((7,5)). action(down). wall((8, 5)). wall((6, 5)). }).
#pos({state_after((6,6))}, {state_after((8,6)),state_after((7,7)),state_after((7,5)),state_after((7,6))}, {state_before((7,6)). action(left). wall((7, 7)). }).
#pos({state_after((6,6))}, {state_after((7,6)),state_after((6,7)),state_after((5,6)),state_after((6,5))}, {state_before((6,6)). action(non). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((7,6))}, {state_after((6,7)),state_after((5,6)),state_after((6,5)),state_after((6,6))}, {state_before((6,6)). action(right). wall((6, 7)). wall((6, 5)). }).
#pos({state_after((7,6))}, {state_after((8,6)),state_after((7,7)),state_after((6,6)),state_after((7,5))}, {state_before((7,6)). action(non). wall((7, 7)). }).
#pos({state_after((7,6))}, {state_after((8,6)),state_after((7,7)),state_after((6,6)),state_after((7,5))}, {state_before((7,6)). action(non). wall((7, 7)). }).
#pos({state_after((7,6))}, {state_after((8,6)),state_after((7,7)),state_after((6,6)),state_after((7,5))}, {state_before((7,6)). action(non). wall((7, 7)). }).
#pos({state_after((8,6))}, {state_after((7,7)),state_after((6,6)),state_after((7,5)),state_after((7,6))}, {state_before((7,6)). action(right). wall((7, 7)). }).
#pos({state_after((8,6))}, {state_after((9,6)),state_after((8,7)),state_after((7,6)),state_after((8,5))}, {state_before((8,6)). action(non). wall((8, 7)). wall((8, 5)). }).
#pos({state_after((8,6))}, {state_after((9,6)),state_after((8,7)),state_after((7,6)),state_after((8,5))}, {state_before((8,6)). action(non). wall((8, 7)). wall((8, 5)). }).
#pos({state_after((8,6))}, {state_after((9,6)),state_after((8,7)),state_after((7,6)),state_after((8,5))}, {state_before((8,6)). action(non). wall((8, 7)). wall((8, 5)). }).
#pos({state_after((8,6))}, {state_after((9,6)),state_after((8,7)),state_after((7,6)),state_after((8,5))}, {state_before((8,6)). action(up). wall((8, 7)). wall((8, 5)). }).
#pos({state_after((8,6))}, {state_after((9,6)),state_after((8,7)),state_after((7,6)),state_after((8,5))}, {state_before((8,6)). action(non). wall((8, 7)). wall((8, 5)). }).
#pos({state_after((9,6))}, {state_after((8,7)),state_after((7,6)),state_after((8,5)),state_after((8,6))}, {state_before((8,6)). action(right). wall((8, 7)). wall((8, 5)). }).
#pos({state_after((8,6))}, {state_after((10,6)),state_after((9,7)),state_after((9,5)),state_after((9,6))}, {state_before((9,6)). action(left). wall((9, 7)). }).
#pos({state_after((8,6))}, {state_after((9,6)),state_after((8,7)),state_after((7,6)),state_after((8,5))}, {state_before((8,6)). action(up). wall((8, 7)). wall((8, 5)). }).
#pos({state_after((8,6))}, {state_after((9,6)),state_after((8,7)),state_after((7,6)),state_after((8,5))}, {state_before((8,6)). action(down). wall((8, 7)). wall((8, 5)). }).
#pos({state_after((8,6))}, {state_after((9,6)),state_after((8,7)),state_after((7,6)),state_after((8,5))}, {state_before((8,6)). action(down). wall((8, 7)). wall((8, 5)). }).
#pos({state_after((9,6))}, {state_after((8,7)),state_after((7,6)),state_after((8,5)),state_after((8,6))}, {state_before((8,6)). action(right). wall((8, 7)). wall((8, 5)). }).
#pos({state_after((9,5))}, {state_after((10,6)),state_after((9,7)),state_after((8,6)),state_after((9,6))}, {state_before((9,6)). action(up). wall((9, 7)). }).
#pos({state_after((9,4))}, {state_after((10,5)),state_after((9,6)),state_after((8,5)),state_after((9,5))}, {state_before((9,5)). action(up). wall((10, 5)). wall((8, 5)). }).
#pos({state_after((9,5))}, {state_after((10,4)),state_after((8,4)),state_after((9,3)),state_after((9,4))}, {state_before((9,4)). action(down). wall((10, 4)). wall((8, 4)). }).
#pos({state_after((9,5))}, {state_after((10,5)),state_after((9,6)),state_after((8,5)),state_after((9,4))}, {state_before((9,5)). action(left). wall((10, 5)). wall((8, 5)). }).
#pos({state_after((9,5))}, {state_after((10,5)),state_after((9,6)),state_after((8,5)),state_after((9,4))}, {state_before((9,5)). action(non). wall((10, 5)). wall((8, 5)). }).
#pos({state_after((9,5))}, {state_after((10,5)),state_after((9,6)),state_after((8,5)),state_after((9,4))}, {state_before((9,5)). action(left). wall((10, 5)). wall((8, 5)). }).
#pos({state_after((9,4))}, {state_after((10,5)),state_after((9,6)),state_after((8,5)),state_after((9,5))}, {state_before((9,5)). action(up). wall((10, 5)). wall((8, 5)). }).
#pos({state_after((9,4))}, {state_after((10,4)),state_after((9,5)),state_after((8,4)),state_after((9,3))}, {state_before((9,4)). action(right). wall((10, 4)). wall((8, 4)). }).
#pos({state_after((9,4))}, {state_after((10,4)),state_after((9,5)),state_after((8,4)),state_after((9,3))}, {state_before((9,4)). action(left). wall((10, 4)). wall((8, 4)). }).
#pos({state_after((9,4))}, {state_after((10,4)),state_after((9,5)),state_after((8,4)),state_after((9,3))}, {state_before((9,4)). action(left). wall((10, 4)). wall((8, 4)). }).
#pos({state_after((17,3))}, {state_after((10,4)),state_after((9,5)),state_after((8,4)),state_after((9,3)),state_after((9,4))}, {state_before((9,4)). action(up). is_link((9,3)). is_link((17,3)). wall((10, 4)). wall((8, 4)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(down). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,2))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,3))}, {state_before((17,3)). action(up). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,2))}, {state_after((18,2)),state_after((17,3)),state_after((16,2)),state_after((17,1))}, {state_before((17,2)). action(left). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((17,2))}, {state_after((18,2)),state_after((17,3)),state_after((16,2)),state_after((17,1))}, {state_before((17,2)). action(left). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((17,2))}, {state_after((18,2)),state_after((17,3)),state_after((16,2)),state_after((17,1))}, {state_before((17,2)). action(right). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((17,2))}, {state_after((18,2)),state_after((17,3)),state_after((16,2)),state_after((17,1))}, {state_before((17,2)). action(left). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((17,2))}, {state_after((18,2)),state_after((17,3)),state_after((16,2)),state_after((17,1))}, {state_before((17,2)). action(right). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((17,2))}, {state_after((18,2)),state_after((17,3)),state_after((16,2)),state_after((17,1))}, {state_before((17,2)). action(left). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((17,3))}, {state_after((18,2)),state_after((16,2)),state_after((17,1)),state_after((17,2))}, {state_before((17,2)). action(down). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(left). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(right). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(right). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(right). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(left). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(right). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(non). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(down). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(left). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(right). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(down). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(left). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(down). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(non). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(left). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,3))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,2))}, {state_before((17,3)). action(right). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,2))}, {state_after((18,3)),state_after((17,4)),state_after((16,3)),state_after((17,3))}, {state_before((17,3)). action(up). wall((18, 3)). wall((17, 4)). wall((16, 3)). }).
#pos({state_after((17,2))}, {state_after((18,2)),state_after((17,3)),state_after((16,2)),state_after((17,1))}, {state_before((17,2)). action(right). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((17,2))}, {state_after((18,2)),state_after((17,3)),state_after((16,2)),state_after((17,1))}, {state_before((17,2)). action(left). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((17,2))}, {state_after((18,2)),state_after((17,3)),state_after((16,2)),state_after((17,1))}, {state_before((17,2)). action(right). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((17,1))}, {state_after((18,2)),state_after((17,3)),state_after((16,2)),state_after((17,2))}, {state_before((17,2)). action(up). wall((18, 2)). wall((16, 2)). }).
#pos({state_after((1,6))}, {state_after((17,3)), state_after((9,3)), state_after((3,4)), state_after((4,4)), state_after((6,4)), state_after((0,5)), state_after((2,6)), state_after((3,6)), state_after((4,6)), state_after((6,6)), state_after((8,6)), state_after((16,1)), state_after((18,1)), state_after((4,2)), state_after((6,2)), state_after((16,2)), state_after((18,2)), state_after((0,3)), state_after((2,3)), state_after((4,3)), state_after((6,3)), state_after((8,3)), state_after((10,3)), state_after((0,4)), state_after((2,4)), state_after((8,4)), state_after((10,4)), state_after((5,6)), state_after((7,6)), state_after((9,6))}, {state_before((1,6)). action(down). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((1,6))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((5,3)), state_after((7,3)), state_after((1,4)), state_after((3,4)), state_after((5,4)), state_after((7,4)), state_after((9,4)), state_after((11,4)), state_after((18,4)), state_after((1,5)), state_after((3,5)), state_after((4,5)), state_after((5,5)), state_after((7,5)), state_after((9,5)), state_after((11,5)), state_after((2,7)), state_after((3,7)), state_after((4,7)), state_after((5,7)), state_after((6,7)), state_after((7,7)), state_after((8,7)), state_after((9,7)), state_after((10,7)), state_after((15,2)), state_after((3,3)), state_after((2,6)), state_after((3,6)), state_after((4,6)), state_after((6,6)), state_after((8,6)), state_after((8,3)), state_after((5,6)), state_after((7,6)), state_after((1,3)), state_after((5,2)), state_after((3,2)), state_after((17,1)), state_after((15,1))}, {state_before((1,6)). action(left). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((2,6))}, {state_after((17,3)), state_after((9,3)), state_after((15,2)), state_after((17,2)), state_after((3,3)), state_after((5,3)), state_after((15,3)), state_after((1,4)), state_after((3,4)), state_after((5,4)), state_after((7,4)), state_after((9,4)), state_after((16,4)), state_after((1,5)), state_after((2,5)), state_after((3,5)), state_after((5,5)), state_after((7,5)), state_after((9,5)), state_after((0,7)), state_after((1,7)), state_after((2,7)), state_after((3,7)), state_after((4,7)), state_after((5,7)), state_after((6,7)), state_after((7,7)), state_after((8,7))}, {state_before((1,6)). action(right). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((2,6))}, {state_after((17,3)), state_after((9,3)), state_after((15,2)), state_after((17,2)), state_after((3,3)), state_after((5,3)), state_after((1,4)), state_after((3,4)), state_after((5,4)), state_after((7,4)), state_after((9,4)), state_after((16,4)), state_after((2,5)), state_after((0,7)), state_after((16,3)), state_after((18,3)), state_after((4,4)), state_after((6,4)), state_after((18,4)), state_after((0,5)), state_after((4,5)), state_after((6,5)), state_after((8,5)), state_after((10,5)), state_after((17,5)), state_after((0,6)), state_after((3,6)), state_after((4,6)), state_after((6,6)), state_after((8,6)), state_after((10,6)), state_after((7,6)), state_after((5,6)), state_after((1,6)), state_after((7,3)), state_after((1,3)), state_after((5,2)), state_after((3,2)), state_after((17,1)), state_after((15,1)), state_after((9,2))}, {state_before((2,6)). action(up). wall((2, 7)). wall((2, 5)). }).
#pos({state_after((1,6))}, {state_after((9,3)), state_after((17,3))}, {state_before((2,6)). action(left). wall((2, 7)). wall((2, 5)). }).
#pos({state_after((1,5))}, {state_after((17,3)), state_after((9,3)), state_after((16,3)), state_after((18,3)), state_after((4,4)), state_after((6,4)), state_after((16,4)), state_after((18,4)), state_after((0,5)), state_after((2,5)), state_after((4,5)), state_after((6,5)), state_after((8,5)), state_after((10,5)), state_after((17,5)), state_after((0,6)), state_after((2,6)), state_after((3,6)), state_after((4,6)), state_after((6,6)), state_after((8,6)), state_after((10,6)), state_after((0,7)), state_after((17,2)), state_after((9,2))}, {state_before((1,6)). action(up). wall((1, 7)). wall((0, 6)). }).
#pos({state_after((1,4))}, {state_after((17,3)), state_after((9,3)), state_after((16,3)), state_after((18,3)), state_after((4,4)), state_after((6,4)), state_after((16,4)), state_after((18,4)), state_after((0,5)), state_after((2,5)), state_after((4,5)), state_after((6,5)), state_after((8,5)), state_after((10,5)), state_after((17,5)), state_after((0,6)), state_after((2,6)), state_after((3,6)), state_after((4,6)), state_after((6,6)), state_after((8,6)), state_after((10,6)), state_after((0,7)), state_after((9,2)), state_after((17,2)), state_after((9,1)), state_after((17,1))}, {state_before((1,5)). action(up). wall((2, 5)). wall((0, 5)). }).
#pos({state_after((1,3))}, {state_after((9,3)), state_after((17,3))}, {state_before((1,4)). action(up). wall((2, 4)). wall((0, 4)). }).
#pos({state_after((1,2))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2))}, {state_before((1,3)). action(up). wall((2, 3)). wall((0, 3)). }).
#pos({state_after((1,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((9,1)), state_after((17,1))}, {state_before((1,2)). action(up). wall((2, 2)). wall((0, 2)). }).
#pos({state_after((1,1))}, {state_after((9,3)), state_after((17,3)), state_after((1,0))}, {state_before((1,1)). action(up). wall((0, 1)). wall((1, 0)). }).
#pos({state_after((1,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2))}, {state_before((1,1)). action(up). wall((0, 1)). wall((1, 0)). }).
#pos({state_after((1,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((9,1)), state_after((17,1))}, {state_before((1,1)). action(up). wall((0, 1)). wall((1, 0)). }).
#pos({state_after((2,1))}, {state_after((9,3)), state_after((17,3))}, {state_before((1,1)). action(right). wall((0, 1)). wall((1, 0)). }).
#pos({state_after((2,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((2,0))}, {state_before((2,1)). action(up). wall((2, 2)). wall((2, 0)). }).
#pos({state_after((2,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((9,1)), state_after((17,1))}, {state_before((2,1)). action(up). wall((2, 2)). wall((2, 0)). }).
#pos({state_after((3,1))}, {state_after((9,3)), state_after((17,3))}, {state_before((2,1)). action(right). wall((2, 2)). wall((2, 0)). }).
#pos({state_after((3,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((3,0))}, {state_before((3,1)). action(up). wall((3, 2)). wall((3, 0)). }).
#pos({state_after((3,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((9,1)), state_after((17,1))}, {state_before((3,1)). action(up). wall((3, 2)). wall((3, 0)). }).
#pos({state_after((4,1))}, {state_after((9,3)), state_after((17,3))}, {state_before((3,1)). action(right). wall((3, 2)). wall((3, 0)). }).
#pos({state_after((4,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((4,0))}, {state_before((4,1)). action(up). wall((4, 2)). wall((4, 0)). }).
#pos({state_after((4,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((9,1)), state_after((17,1))}, {state_before((4,1)). action(up). wall((4, 2)). wall((4, 0)). }).
#pos({state_after((5,1))}, {state_after((9,3)), state_after((17,3))}, {state_before((4,1)). action(right). wall((4, 2)). wall((4, 0)). }).
#pos({state_after((5,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((5,0))}, {state_before((5,1)). action(up). wall((5, 0)). }).
#pos({state_after((5,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((9,1)), state_after((17,1))}, {state_before((5,1)). action(up). wall((5, 0)). }).
#pos({state_after((6,1))}, {state_after((9,3)), state_after((17,3))}, {state_before((5,1)). action(right). wall((5, 0)). }).
#pos({state_after((6,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((6,0))}, {state_before((6,1)). action(up). wall((6, 2)). wall((6, 0)). }).
#pos({state_after((6,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((9,1)), state_after((17,1))}, {state_before((6,1)). action(up). wall((6, 2)). wall((6, 0)). }).
#pos({state_after((7,1))}, {state_after((9,3)), state_after((17,3))}, {state_before((6,1)). action(right). wall((6, 2)). wall((6, 0)). }).
#pos({state_after((7,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((7,0))}, {state_before((7,1)). action(up). wall((7, 0)). }).
#pos({state_after((7,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,1)), state_after((9,2)), state_after((17,1))}, {state_before((7,1)). action(up). wall((7, 0)). }).
#pos({state_after((8,1))}, {state_after((9,3)), state_after((17,3))}, {state_before((7,1)). action(right). wall((7, 0)). }).
#pos({state_after((8,1))}, {state_after((17,3)), state_after((9,3)), state_after((17,2)), state_after((9,2)), state_after((8,0))}, {state_before((8,1)). action(up). wall((8, 2)). wall((8, 0)). }).