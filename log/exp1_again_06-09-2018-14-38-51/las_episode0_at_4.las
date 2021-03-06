%ILASP

%state_after(V0) :- adjacent(right, V0, V1), wall(V1).
%state_after(V1) :- adjacent(up, V0, V1), state_before(V0), not wall(V1).
%state_after(V0) :- state_before(V0), action(down), wall(V1).
%state_after(V1) :- adjacent(right, V0, V1), state_before(V0), action(left), not wall(V1).
cell((0..18, 0..8)).
% (X+1,Y) is right next to (X,Y)
adjacent(right, (X+1,Y),(X,Y))   :- cell((X,Y)), cell((X+1,Y)).

adjacent(left,(X,Y),  (X+1,Y)) :- cell((X,Y)), cell((X+1,Y)).

% (X,Y+1) is above next to (X,Y)
adjacent(down, (X,Y+1),(X,Y))   :- cell((X,Y)), cell((X,Y+1)).

adjacent(up,   (X,Y),  (X,Y+1)) :- cell((X,Y)), cell((X,Y+1)).

#modeh(state_after(var(cell))).

#modeb(1, adjacent(const(action), var(cell), var(cell)), (positive)).
#modeb(1, state_before(var(cell)), (positive)).
#modeb(1, action(const(action)), (positive)).
#modeb(1, wall(var(cell))).

#max_penalty(50).

#constant(action, right).
#constant(action, left).
#constant(action, down).
#constant(action, up).
#pos({state_after((2,6))}, {state_after((3,5)),state_after((1,5)),state_after((2,4)),state_after((2,5))}, {state_before((2,5)).action(down).}).
#pos({state_after((2,6))}, {state_after((3,6)),state_after((2,7)),state_after((1,6)),state_after((2,5)),state_after((2,7))}, {state_before((2,6)).action(down).wall((2, 7)). }).
#pos({}, {state_after((3,6)),state_after((2,7)),state_after((1,6)),state_after((2,5))}, {state_before((2,6)).action(down).wall((2, 7)). }).
#pos({state_after((1,6))}, {state_after((3,6)),state_after((2,7)),state_after((2,5)),state_after((2,6)),state_after((2,6))}, {state_before((2,6)).action(left).wall((2, 7)). }).
#pos({state_after((1,6))}, {state_after((2,6)),state_after((1,7)),state_after((0,6)),state_after((1,5)),state_after((0,6))}, {state_before((1,6)).action(left).wall((1, 7)). wall((0, 6)). }).
