% Flatland Temporal Example
%
% fluents : holds(F,T)    (F=fluent, T=timestep)
% actions : occur(A,T)    (A=action, T=timestep)
%         : action(A)
% time    : time(T)       (T=timestep)
%         : horizon(T)

#include "./domain.lp".

% DEFINITIONS

time(0..horizon).

% Actions
action(wait).
action(forward).
action(left).
action(right).

% Fulents
fluent(at).
fluent(reached_goal).

% ACTION GENERATION

% TODO : Rewrite to exclude cardinality constraint
{occur(A,TR,T): action(A)} :- train(TR), time(T), time(T+1).
% Cardinality constraints
:- time(T), train(TR), occur(A1,TR,T), occur(A2,TR,T), A1!=A2.
:- time(T), train(TR), not occur(_,TR,T).

% TODO : Replace with pre-conditions
% Eliminate invalid actions

:- occur(A,TR,T), holds(at(TR,(X,Y),DIR),T), node((X,Y),TYPE), not action_possible(TYPE,DIR,A).

% Initial positions

holds(at(R,(X,Y),DIR),0) :- start(R,(X,Y),DIR).

% Compute at positions

holds(at(TR,(X+DX,Y+DY),DIR_OUT),T+1) :- occur(A,TR,T), A!=wait, holds(at(TR,(X,Y),DIR),T),
										 action_direction_change(A,DIR,DIR_OUT),
										 direction_out_position_diff(DIR_OUT,(DX,DY)).

holds(at(TR,(X,Y),DIR),T+1) :- occur(wait,TR,T), holds(at(TR,(X,Y),DIR),T).

% Compute rached_goal

holds(reached_goal(TR),T) :- holds(at(TR,(X,Y),_),T), goal(TR,(X,Y)).

% Inertia
holds(reached_goal(R),T+1) :- holds(reached_goal(R),T), time(T+1).

% CONSTRAINTS

% All trains must reach goal their goal

:- train(R), not holds(reached_goal(R),horizon).

% Vertex Conflict

:- holds(at(TR1,POS,_),T), holds(at(TR2,POS,_),T), TR1>TR2.

% Edge Conflict

:- holds(at(TR1,POS1,_),T), holds(at(TR1,POS2,_),T+1), holds(at(TR2,POS2,_),T), holds(at(TR2,POS1,_),T+1), TR1>TR2.

#show.
#show occur/3.
