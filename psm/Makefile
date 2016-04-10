MODULE:=psm
TEST_MODULE:=psm_test
ENTRY:=psm_test

all: $(TEST_MODULE).beam
	erl -noshell -s $(TEST_MODULE) $(ENTRY) -s init stop

$(TEST_MODULE).beam: $(MODULE).beam
	erlc $(TEST_MODULE).erl

$(MODULE).beam: 
	erlc $(MODULE).erl

.PHONY: clean

clean:
	rm -rf *.beam *.dump
