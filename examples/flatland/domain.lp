% DOMAIN HELPERS

direction(n;e;s;w).

track_type(T) :- node(_,T).

bits((NN,NE,NS,NW),(EN,EE,ES,EW),(SN,SE,SS,SW),(WN,WE,WS,WW),T) :- track_type(T),
                                                                   WW=(T/(2**0))\2, WS=(T/(2**1))\2, WE=(T/(2**2))\2, WN=(T/(2**3))\2,
                                                                   SW=(T/(2**4))\2, SS=(T/(2**5))\2, SE=(T/(2**6))\2, SN=(T/(2**7))\2,
                                                                   EW=(T/(2**8))\2, ES=(T/(2**9))\2, EE=(T/(2**10))\2, EN=(T/(2**11))\2,
                                                                   NW=(T/(2**12))\2, NS=(T/(2**13))\2, NE=(T/(2**14))\2, NN=(T/(2**15))\2.

action_possible(T,n,forward) :- bits((1,_,_,_),_,_,_,T). 
action_possible(T,s,forward) :- bits(_,_,(_,_,1,_),_,T). 

action_possible(T,e,forward) :- bits(_,(_,1,_,_),_,_,T). 
action_possible(T,w,forward) :- bits(_,_,_,(_,_,_,1),T). 

action_possible(T,s,left   ) :- bits(_,_,(_,1,_,_),_,T).
action_possible(T,s,right  ) :- bits(_,_,(_,_,_,1),_,T).

action_possible(T,w,left   ) :- bits(_,_,_,(_,_,1,_),T).
action_possible(T,w,right  ) :- bits(_,_,_,(1,_,_,_),T).

action_possible(T,e,left   ) :- bits(_,(1,_,_,_),_,_,T).
action_possible(T,e,right  ) :- bits(_,(_,_,1,_),_,_,T).

action_possible(T,n,left   ) :- bits((_,_,_,1),_,_,_,T).
action_possible(T,n,right  ) :- bits((_,1,_,_),_,_,_,T).

action_possible(T,DIR,wait) :- track_type(T), direction(DIR).

action_direction_change(forward,n,n).
action_direction_change(forward,e,e).
action_direction_change(forward,s,s).
action_direction_change(forward,w,w).

action_direction_change(left,n,w).
action_direction_change(left,e,n).
action_direction_change(left,s,e).
action_direction_change(left,w,s).

action_direction_change(right,n,e).
action_direction_change(right,e,s).
action_direction_change(right,s,w).
action_direction_change(right,w,n).

direction_out_position_diff(n,(0,-1)).
direction_out_position_diff(e,(1, 0)).
direction_out_position_diff(s,(0, 1)).
direction_out_position_diff(w,(-1,0)).

