all: parse_request

%: %.c
	g++ -o $@ $^
.PHONY: clean

clean: 
	rm -rf parse_request
	rm -rf *output*
	rm -rf *.png
