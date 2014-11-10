all: parse_web

%: %.c
	g++ -o $@ $^
.PHONY: clean

clean: 
	rm -rf parse_web
	rm -rf *output*
	rm -rf *.png
