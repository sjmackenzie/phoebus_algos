.PHONY: rel deps

all: deps
	@rebar compile

compile:
	@rebar compile

deps:
	@rebar get-deps

clean:
	@rebar clean

dialyzer: compile
	@dialyzer -Wno_return -c apps/riak_kv/ebin

