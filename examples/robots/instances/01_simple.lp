#const horizon=7.
#const map_size=4.

robot(1).
robot(2).
robot(3).

node(1..map_size,1..map_size).

start(1,(1,1)).
start(2,(1,map_size)).
start(3,(map_size,map_size)).

goal(1,(map_size,map_size)).
goal(2,(map_size,1)).
goal(3,(1,1)).
