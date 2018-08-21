-module(prop_base).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_test() ->
    ?FORALL(InstanceOfType, mytype(),
        begin
            boolean(InstanceOfType)
        end).

%%%%%%%%%%%%%%%
%%% Helpers %%%
%%%%%%%%%%%%%%%
boolean(_) -> true.

%%%%%%%%%%%%%%%%%%
%%% Generators %%%
%%%%%%%%%%%%%%%%%%
mytype() -> term().

% NOTE
% ?FORALL can be translated to:
% proper:forall(TypeGenerator, fun(InstanceOfType) -> PropertyExpression end).

% NOTE
% term() is a generator supplied by PropEr. It's a macro for the function call
% proper_types:term()
% Try it:
% $ rebar3 as test shell
% 1> proper_types:term().
