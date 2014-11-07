#!/bin/sh
gnuplot << EOF

set style fill transparent solid 0.5 border -1
set boxwidth 1 relative
set xrange [-5:105]
set yrange [0:*]
set ylabel 'PLT (s)'
set xlabel 'Number of requests'
set title 'Leopard picture ~1Mo: Yiping - delay=100ms'
set grid

plot "request_output.txt" using 0:1 title 'HTTP/1.1' with boxes, \
	 "request_output.txt" using 0:3 title 'HTTP/2' with boxes
load "loop_til_escape"

plot "request_output.txt" using 0:2 title 'HTTP/1.1 secure' with boxes, \
	 "request_output.txt" using 0:4 title 'HTTP/2 secure' with boxes
load "loop_til_escape"

EOF
