all: parse_web parse_request

%: %.c
	g++ -o $@ $^
.PHONY: clean

clean: 
	rm -rf parse_request
	rm -rf parse_web
	rm -rf *output*
