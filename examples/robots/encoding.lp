% Robots Temporal Example
% 
% fluents : holds(F,T)    (F=fluent, T=timestep)
% actions : occur(A,T)    (A=action, T=timestep)
%         : action(A)
% time    : time(T)       (T=timestep) 
%         : horizon(T)

% DEFINITIONS

time(0..horizon).

% Actions
action(wait).
action(up).
action(down).
action(left).
action(right).

% Fulents
fluent(at).
fluent(reached_goal).

% ACTION GENERATION

% TODO : Rewrite to exclude cardinality constraint
{occur(A,R,T): action(A)}=1 :- robot(R), time(T), time(T+1).

% TODO : Replace with pre-conditions
% Eliminate invalid actions

:- occur(up,R,T), holds(at(R,(X,Y)),T), not node(X,Y-1).
:- occur(down,R,T), holds(at(R,(X,Y)),T), not node(X,Y+1).
:- occur(left,R,T), holds(at(R,(X,Y)),T), not node(X-1,Y).
:- occur(right,R,T), holds(at(R,(X,Y)),T), not node(X+1,Y).

% Initial positions

holds(at(R,(X,Y)),0) :- start(R,(X,Y)). 

% Compute at positions
holds(at(R,(X,Y-1)),T+1) :- occur(up,R,T),  holds(at(R,(X,Y)),T).
holds(at(R,(X,Y+1)),T+1) :- occur(down,R,T),  holds(at(R,(X,Y)),T).
holds(at(R,(X-1,Y)),T+1) :- occur(left,R,T),  holds(at(R,(X,Y)),T).
holds(at(R,(X+1,Y)),T+1) :- occur(right,R,T),  holds(at(R,(X,Y)),T).
holds(at(R,(X,Y)),T+1) :- occur(wait,R,T),  holds(at(R,(X,Y)),T).

% Compute rached_goal

holds(reached_goal(R),T) :- holds(at(R,(X,Y)),T), goal(R,(X,Y)).

% Inertia
holds(reached_goal(R),T+1) :- holds(reached_goal(R),T), time(T+1).

% CONSTRAINTS

% All robots must reach goal their goal

:- robot(R), not holds(reached_goal(R),horizon).

% Vertex Conflict

:- holds(at(R1,POS),T), holds(at(R2,POS),T), R1>R2.

% Edge Conflict

:- holds(at(R1,POS1),T), holds(at(R1,POS2),T+1), holds(at(R2,POS2),T), holds(at(R2,POS1),T+1), R1>R2.
