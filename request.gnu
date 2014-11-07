#!/bin/sh
gnuplot << EOF

reset
red = "#FF0000"; green = "#00FF00"
set style fill transparent solid 0.5 border -1
set boxwidth 1 relative

set terminal png enhanced size 1600,600 truecolor
set output 'request.png'

set multiplot layout 1, 2

set title 'Leopard picture \~1Mo: Yiping - delay=100ms'
set grid

set xrange [-5:105]
set yrange [0:*]

set ylabel 'Page Loading Times (PLT) in seconds'
set xlabel 'Number of requests'


plot "request_output.txt" using 0:1 title 'HTTP/1.1' with boxes lt rgb red, \
	 "request_output.txt" using 0:3 title 'HTTP/2' with boxes lt rgb green
#load "loop_til_escape"

plot "request_output.txt" using 0:2 title 'HTTP/1.1 secure' with boxes lt rgb red, \
	 "request_output.txt" using 0:4 title 'HTTP/2 secure' with boxes lt rgb green
#load "loop_til_escape"

unset multiplot

EOF
