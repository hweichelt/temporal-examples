% Elevator calls are removable
removable_if_fact(holds(called(F),T)) :- holds(called(F),T).

% First elevator position can be changed
removable_if_fact(holds(at(F),0)) :- holds(at(F),0).


#program addable.

% @label("Elevator starts at floor {}",(F,))
holds(at(F),0) :- floor(F).
