-module(prop_bigger).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_biggest() ->
    % Binds each value of the list(integer()) to the variable List
    ?FORALL(List, mytype(),
        begin
            biggest(List) =:= lists:last(lists:sort(List))
        end).

%%%%%%%%%%%%%%%
%%% Helpers %%%
%%%%%%%%%%%%%%%
biggest([ Head | Tail]) ->
    biggest(Tail, Head).

biggest([], Biggest) ->
    Biggest;
biggest([Head | Tail], Biggest) when Head > Biggest ->
    biggest(Tail, Head);
biggest([_Head | Tail], Biggest) ->
    biggest(Tail, Biggest).

%%%%%%%%%%%%%%%%%%
%%% Generators %%%
%%%%%%%%%%%%%%%%%%
mytype() -> non_empty(list(integer())).
