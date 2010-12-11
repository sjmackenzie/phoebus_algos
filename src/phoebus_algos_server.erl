-module(phoebus_algos_server).
-behaviour(gen_server).

-export([start_link/0, generate_input/0,compute_fun/0,aggregate_fun/0,shortest_path/0,create_binary_tree/3]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    {ok, []}.

generate_input() ->
    gen_server:call(?MODULE, generate_fun).
compute_fun() ->
    gen_server:call(?MODULE, compute_fun).
aggregate_fun() ->
    gen_server:call(?MODULE, aggregate_fun).
shortest_path() ->
    gen_server:call(?MODULE, shortest_path).
create_binary_tree(Where,NumFiles,NumRecs) ->
    gen_server:call(?MODULE, {create_binary_tree,Where,NumFiles,NumRecs}).

%% callbacks
handle_call(generate_fun, _From, State) ->
    {reply, ok, State};
handle_call(compute_fun, _From, State) ->
    {reply, ok, State};
handle_call(aggregate_fun, _From, State) ->
    {reply, ok, State};
handle_call(shortest_path, _From, State) ->
    {reply, ok, State};
handle_call({create_binary_tree,Where,NumFiles,NumRecs}, _From, State) ->
    phoebus_algos_shortest_path:create_binary_tree(Where, NumFiles, NumRecs),
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
