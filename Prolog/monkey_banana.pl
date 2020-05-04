move(state(middle, onBox, middle, hasNot),
    grasp,
    state(middle, onBox, middle, has)).

move(state(P, onFloor, P, H),
    climb,
    state(P, onBox, P, H)).

move(state(P1, onFloor, P1, H),
    push(P1, P2),
    state(P2, onFloor, P2, H)).

move(state(P1, onFloor, B, H),
    walk(P1, P2),
    state(P2, onFloor, B, H)).

canget(state(_, _, _, has)).
canget(State1) :-
    move(State1, _, State2),
    canget(State2).

% Example: 
%| ?- canget(state(atDoor, onFloor, atWindow, hasNot)).

% extract from: https://youtu.be/T095SaEhHas