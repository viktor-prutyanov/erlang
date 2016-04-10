SRC:=src
EBIN:=ebin
INCLUDE:=include
TEST_MODULE:=sm_test
TEST_ENTRY:=sm_test

test: $(TEST_MODULE)
	erl -pa $(EBIN) -noshell -s $(TEST_MODULE) $(TEST_ENTRY) -s init stop

$(TEST_MODULE): 
	erlc -I $(INCLUDE) -o $(EBIN) $(SRC)/*.erl

.PHONY: test clean

clean:
	rm -rf $(EBIN)/* *.dump
